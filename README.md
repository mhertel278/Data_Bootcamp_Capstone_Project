# Data_Bootcamp_Capstone_Project
Capstone project for UT Austin Data Bootcamp group 2

## Selected Topic:
We chose to analyze car, pedestrian, and bike traffic data collected in Ramsey County Minnesota from June 2015 to September 2018. 

## Reason for Selected Topic:
We are interested in  how weather, day of the week, time of year and holidays affected commuters’ preferred method of transportation. 

## Source of Data
Our car, pedestrian and bike data came from the Minnesota Department of Transportation. 
Our weather data came from OpenWeatherMap. 
The original datasets can be found at the links below: 

https://archive.ics.uci.edu/ml/datasets/Metro+Interstate+Traffic+Volume#
https://www.dot.state.mn.us/bike-ped-counting/reports.html

Although these datasets are structured files, they still contain messy and non-benefical characteristics. We will use a linear regression machine learning model to effectively detect relationships between information contained the two datasets. 

## Technologies Used
Our team will use the following technologies and processes listed in the technologies.md to conduct our machine learning project. 

## Questions We Hope to Answer
- How does commuter behavior change given the day of the week and time of year? 
- How do weather conditions affect commuter behavior? 
- Can we predict non-vehicle (bikers + walkers) traffic on a given day assuming vehicle traffic and weather conditions? 

## Data Exploration Phase

## Analysis Phase

Once the datasets had been cleaned and joined our team was able to produce initial visualizations using Seaborn. A variety of visualizations including bar charts, line graphs, scatter plots, swarm graphs, and linear regression plots, allowed us to identify outliers and decide what inputs were crucial and which ones just created noise. As a second step new visualizations were created in Tableau to include in the final dashboard as well as make some of the visualizations interactive. 

## Database
(3 - 4 sentence summary from Michael)

## Machine Learning Model
# Preliminary Data Preprocessing 

After our database was connected to our machine learning model, several steps were taken to preprocess the data. In order to make the dataset more compatible with the model, we dropped the date column, as it only contained unique values.  We also dropped a row that contained an extreme outlier.  We converted the entries in the 'Holiday' column from strings into integers so that the model could process the entries. We scaled the data, and ran the machine learning model with both scaled and unscaled data. We discovered that scaling our data did not make any difference to the accuracy score in this model. 

# Preliminary Feature Engineering and Selection

As we continue to refine our model, we will experiment with the following selection methods: drop holiday columns, drop vehicle columns. For feature engineering, we will experiment with putting the rows into bins of weeks of the year, months and holidays. We will also test the model by adding a day of the week column to the dataset. We will use all of these methods to try to improve the accuracy of the model. 

# Train-Test-Split

To test the accuracy of our machine learning model, we separated our dataset into a training set and a testing set. We trained the model on the training set, which allowed the model to understand the correlation between the data points. Then we ran our testing set through the model, and asked the model to predict the number of non-vehicle commuters. Our model was able to predict the number of non-vehicle commuters with about 70% accuracy. 

# Model Choice

We decided to use linear regression for our machine learning model. Linear regression works well in this scenario because we are attempting to predict the number of non-vehicle commuters on a given day (our target variable). This number is a continuous variable, which is what linear regression models predict. A limitation of a linear regression model is that it can only predict continuous variables. It cannot predict discreet values like a classification machine learning model. Another limitation of linear regression models is that they are especially sensitive to outliers. As stated above, we dropped our extreme outlier in order to make the model more accurate. 

## Dashboard
For our final Dashboard, we will use visualizations created with Seaborn and Tableau. 

Interactive elements include the ability to filter by month, data inputs, and holidays. The interactive element is a filter legend built into several of the Tableau visualizations. 

Visualization files:
Non_Vehicle_Traffic_by_Day_of_Week.png
Vehicle_vs_Non_Vehicle_Sorted_by_Snow_Totals.png
Vehicle_vs_Non_Vehicle_Filtered_by_Month.png
Vehicle_vs_Non_Vehicle_Volumes_by_Rain_Totals.png
Non_Vehicle_vs_Vehicle_Sorted_by_Temp.png
Traffic_Volume_by_Month.png
Non_Vehicle_Traffic_by_Month.png
Traffic_Volume_by_Day_of_Week.png

Tableau Link:
https://public.tableau.com/views/DraftofFinalProjectVisualizations/Vehiclevs_Non-VehicleTrafficFilteredbyMonth?:language=en-US&:display_count=n&:origin=viz_share_link


The link to the Dashboard on Google Slides is found below:
https://docs.google.com/presentation/d/1tCeESHg-k9MaFWjkYsrsxCZbY75Rz8vQ-FKmILoDWCw/edit?usp=sharing

## Communication Protocols
Our team is utilizing Slack as our primary communication platform. Zoom calls are made as needed to discuss topics and project direction. All code is shared through a common GitHub repository. 
