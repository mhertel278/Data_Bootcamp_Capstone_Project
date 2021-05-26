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