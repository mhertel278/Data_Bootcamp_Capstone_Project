# Technologies Used
The following programming languages and libraries were used in order to create our Deep Learning model:

**Languages**
- Python
- PostgreSQL
- Tableau

**Libraries**
- Pandas
- scikit-learn
- TensorFlow
- pgAdmin
- Datatime
- Calendar
- Matplotlib

## Data Cleaning and Analysis
### Data Cleaning
Python pandas, scikit-learn, and TensorFlow will be used to clean and perform an exploratory data analysis. In addition, we will also use matplotlib.plot for visualizations while cleaning and exploring the data. 

Once the dependencies are imported, the Metro_Interstate_Traffic_Volume.csv **(rename)** will be imported and read using the pandas.read_csv() into the DataFrame as Traffic_analysis_df. The 2014-2020_AllUserData_4Website.xlsx **(rename)** will also be imported and read into the DataFrame as bike_df. However, an additional pandas library, ExcelWriter and ExcelFile, is required to read the excel file. 

Next, we will drop any non-benefical ID columns from both DataFrames.

- Two ID columns will be dropped from Traffic_analysis.df
    1. weather_main
    2. weather_description
- Eight ID columns will be dropped from bike_df.
    1. site
    2. agency
    3. lat
    4. long
    5. city
    6. mndot_district
    7. doy
    8. imputed

Then in our Traffic_analysis_df, we will import Datetime from pandas to split and convert data_time into two separate columns, date and time_of_day. Further utilizing the variety of pandas libraries, we till import Calendar to determine and add day of the week. This will provide an additional variable when creating our dashboard.

Traffic_analysis_df will need further cleaning on 'temp' ID column. Our data originally stored the temperature vairables in Kelvin, which explains the high temperatures. Our team will convert 'temp' from Kelvin to Fahrenheit for better understanding amongst our audience. 

Our team will repurpose some of the code used in preparing the data to load into the SQL database later in the development of our project.

### Database Schema
To have a graphical representation of our datasets, we will create an entity-relationship diagram (ERD) in pgAdmin. ERD enables us to design and visualize our database tables. This will also ensure we clearly label data columns.  

The data set files used for our ERD will also act as the provisional database to establish the structure our team will use for developing the final SQL database.

## Database Storage
pgAdmin is an open source database which provides a powerful graphical interface that can be used to create, maintain, and use our datadase objects. Our team felt pgAdmin was the best fit for our project in both data storage and creating a entity-relationship diagram (ERD). The ERD will provide a graphical representation of our database tables, columns, and their inter-relationships (Primary and Foreign Keys). 

## Machine Learning
Since our target is bike volume, our machine learning model will predict a continuous value. A Deep Learning model with neural networks will be used since we are using regression data. Scikit-learn is the ML library our team determined is the best fit for our analysis project. Scikit-learn aids us in creating our deep learning model by featuring algorithums, such as support vector machine (SVM), and supporting matplotlib. 

As mentioned above, our team will be using Deep Learning. Our raw data set files will act as the provisional database which will be connected to our Machine Learning Model. 

Fitting the model to train data and test the model will be setup in TensorFlow.

## Dashboard
Our team felt Tableau would be an effective tool for developing a dashboard into our project. In addition to using a Tableua template, we will also integrate D3.js for a fully functioning and interactive dashboard. 