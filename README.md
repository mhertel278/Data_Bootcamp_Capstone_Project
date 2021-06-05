# Data_Bootcamp_Capstone_Project
Capstone project for UT Austin Data Bootcamp group 2

## Selected Topic:
We chose to analyze car, pedestrian, and bike traffic data collected  in Ramsey County Minnesota from June 2015 to September 2018. 

## Reason for Selected Topic:
We are interested in  how weather, day of the week, time of year and holidays affected commuters’ preferred method of transportation. 

## Source of Data
Our car, pedestrian and bike data came from the Minnesota Department of Transportation. 
Our weather data came from OpenWeatherMap. 
The original datasets can be found at the links below: 

https://archive.ics.uci.edu/ml/datasets/Metro+Interstate+Traffic+Volume#
https://www.dot.state.mn.us/bike-ped-counting/reports.html

Although these datasets are structured files, they still contain messy and non-benefical characteristics. We will use a linear regression machine learning model to effectively detect complex relationships between information contained the two datasets. 

## Technologies Used
Our team will use the following technologies and processes listed in the technologies.md to conduct our machine learning project. 

## Questions We Hope to Answer
- How does commuter behavior change given the day of the week and time of year? 
- How do weather conditions affect commuter behavior? 
- Can we predict non-vehile (bikers + walkers) traffic on a given day assuming vehicle traffic and weather conditions? 

## Data Exploration Phase

## Analysis Phase

## Machine Learning Model
# Preliminary Data Preprocessing - dropped an outlier, dropped the date column, we scaled the data and it did not make a difference with this model
# Preliminary Feature Engineering and Selection - Feature selection examples: Drop holiday columns, drop vehicle columns, Feature engineering examples: bin days of weeks/months/holiday vs. all holidays, adding day of the week column 
# Train-Test-Split
# Model Choice - linear regression 
(including limitations and benefits)

## Database
(3 - 4 sentence summary from Michael)

## Dashboard
For our final Dashboard, we will use visualizations created with MatPlotLib and Tableau. 

Our interactive element will consist of allowing the viewer to filter the traffic data by season, weekend or weekday. 

## Communication Protocols
Our team is utilizing Slack as our primary communication platform. Zoom calls are made as needed to discuss topics and project direction. All code is shared through a common GitHub repository. 
