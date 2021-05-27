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

-----------------------------------------------------------------------------------------------------

/*

Creating clean tables

*/

-- create vehicle table with converted temp, renamed columns, dropped descriptive columns,
-- added date column and time column

SELECT holiday
	, (temp - 273.15)* 9/5 +32 as temp_F
	, rain_1h as rain_in_mm
	, snow_1h as snow_in_mm
	, clouds_all as cloud_percent
	, traffic_volume as vehicle_volume
	, date_time :: date AS date
	, date_time :: time AS time_of_day
	

FROM raw_vehicle_traffic
;

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