/*

Creating empty tables and loading raw data

*/

-- create empty table for raw vehicle traffic dataset
CREATE TABLE raw_vehicle_traffic(
	holiday VARCHAR(40) NOT NULL,
	temp REAL NOT NULL,
	rain_1h REAL NOT NULL,
	snow_1h REAL NOT NULL,
	clouds_all INT NOT NULL,
	weather_main VARCHAR(15) NOT NULL,
	weather_description VARCHAR(40) NOT NULL,
	date_time TIMESTAMP NOT NULL,
	traffic_volume INT NOT NULL	
);

-- IMPORT CSV: Metro_Interstate_Traffic_Volume.csv to populate raw_vehicle_traffic table

-- create empty table for raw bike/pedestrian traffic
CREATE TABLE raw_bike_pedestrian_traffic(
	site VARCHAR,
	agency CHAR(5),
	lat FLOAT,
	long FLOAT,
	city VARCHAR(30),
	county VARCHAR(30),
	mndot_district VARCHAR(5),
	mode VARCHAR(10),
	date_day DATE,
	doy INT,
	total INT,
	PRCP REAL,
	TMAX REAL,
	imputed VARCHAR(5),
	total_yearly_imputed_days INT,
	facility_type VARCHAR(30),
	on_off_road VARCHAR(3),
	install_year INT,
	trunk_hwy VARCHAR(3),
	us_bikeroute VARCHAR(8),
	device VARCHAR(15),
	direction VARCHAR(15),
	technology VARCHAR(30)				
);

-- IMPORT CSV: 2014-2020_AllUserData_4Website.csv to populate raw_bike_pedestrian_traffic table

-----------------------------------------------------------------------------------------------------

/*

Creating clean tables from raw_vehicle_traffic table

*/

-- check for duplicate date_time records in raw_vehicle_traffic table
WITH RowNumCTE AS(
	SELECT *,
		ROW_NUMBER() OVER(
		PARTITION BY temp
						
						, rain_1h
						, snow_1h
						, clouds_all
						, date_time
						, traffic_volume
							) row_num
	FROM raw_vehicle_traffic
	)
	SELECT *
	FROM RowNumCTE
	-- WHERE row_num > 1
	;

--confirm duplicate date times have same concrete values, just different descriptive columns
SELECT *
	, COUNT (date_time) OVER (PARTITION BY date_time) AS record_count
FROM raw_vehicle_traffic
ORDER BY record_count DESC, date_time
;

-- create clean vehicle table dropping duplicate date_times, converted temp to F, renamed columns, dropped descriptive columns,
-- added date column and time column

SELECT DISTINCT date_time --as unique_date_time
	, holiday
	, (temp - 273.15)* 9/5 + 32 as temp_F
	, rain_1h as rain_in_mm
	, snow_1h as snow_in_mm
	, clouds_all as cloud_percent
	, traffic_volume as vehicle_volume
 	-- , date_time :: date AS date
 	-- , date_time :: time AS time_of_day
INTO clean_vehicle_traffic
FROM raw_vehicle_traffic
;

--confirm duplicate date times have been dropped
SELECT *
	, COUNT (date_time) OVER (PARTITION BY date_time) AS record_count
FROM clean_vehicle_traffic
ORDER BY record_count DESC, date_time
;

-- still have some duplicate date_time entries:
-- group by date_time and avg weather and traffic columns to 
-- create table with unique entry per date_time

SELECT date_time 
	, AVG(temp_f) as avg_temp_f_hourly
	, AVG(rain_in_mm) as avg_rain_in_mm_hourly
	, AVG(snow_in_mm) as avg_snow_in_mm_hourly
	, ROUND(AVG(cloud_percent), 1) as avg_cloud_percent_hourly
	, FLOOR(AVG(vehicle_volume)) as vehicle_volume
	, date_time :: date AS date
 	, date_time :: time AS time_of_day
INTO cleaner_vehicle_traffic
FROM clean_vehicle_traffic
GROUP BY date_time
ORDER BY date_time
;

/*

Clean holidays to solve for some dates saying None when it is a holiday


*/

-- determine if all date_times that are holidays have the holiday named

WITH holidayCTE as (
	SELECT holiday, date_time::date as date
	FROM raw_vehicle_traffic
	) 
	-- JOIN the CTE to itself where dates are same but holiday is not
	SELECT a.holiday as a_holiday
		, a.date as a_date
		, b.holiday as b_holiday
		, b.date as b_date
	FROM holidayCTE a
	JOIN holidayCTE b
		on a.date = b.date
		AND a.holiday != b.holiday--) holiday_match
	ORDER BY a_date
	;


-- select distinct holiday and date from above query where holiday is not 'None' 
-- to create table of dates that are holidays
WITH holidayCTE as (
	SELECT holiday, date_time::date as date
	FROM raw_vehicle_traffic
	) 
	SELECT DISTINCT a_holiday as holiday
		, a_date as date
	INTO holiday
	FROM
		(SELECT a.holiday as a_holiday
			, a.date as a_date
			, b.holiday as b_holiday
			, b.date as b_date
		FROM holidayCTE a
		JOIN holidayCTE b
			on a.date = b.date
			AND a.holiday != b.holiday
		WHERE a.holiday!= 'None'
		ORDER BY a_date) holiday_match
	;


/*

-- join cleaner vehicle table grouped by date, bike_pedestrian table grouped by date for Ramsey county
-- holiday tables to create machine learning dataset

*/


WITH VehicleCTE AS(  -- CTE to aggregate vehicle set on date
	SELECT AVG(avg_temp_f_hourly) as avg_temp_f_daily
		, SUM(avg_rain_in_mm_hourly) as total_rain_mm_daily
		, SUM(avg_snow_in_mm_hourly) as total_snow_mm_daily
		, AVG(avg_cloud_percent_hourly) as avg_cloud_percent_daily
		, SUM(vehicle_volume) as total_vehicle_volume_daily
		, date
		, EXTRACT(MONTH FROM date) as month
		, EXTRACT(DOW FROM date) as day_of_week
	FROM cleaner_vehicle_traffic
	GROUP BY date
	)
	, BikeCTE AS (  -- CTE to aggregate bike and pedestrian volume totals for Ramsey county
	SELECT SUM(total) as total
		, date_day
	FROM raw_bike_pedestrian_traffic
	WHERE county = 'Ramsey'
	GROUP BY date_day
	)
	SELECT b.total as daily_non_vehicle_traffic  -- join the aggregated vehicle and bike sets on common date
		, v.*
		, COALESCE(h.holiday, 'none') as holiday -- create label 'none' if not a holiday
	INTO machine_learning_set
	FROM BikeCTE b
	INNER JOIN VehicleCTE v
			on b.date_day = v.date
	LEFT JOIN holiday h
		ON v.date = h.date
	;

-- show machine learning set
SELECT * 
FROM machine_learning_set
;