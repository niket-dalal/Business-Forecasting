# Business-Forecasting

GITHUB ASSIGNMENT

**1. What are you forecasting and why?**

**What** : Our Team is forecasting number of bike Trips completed by a specific Station location to aid the management with making decisions around demand for bikes in the upcoming year

**Why** : Our Team is forecasting for demand for the bikes at “Central Park S & 6 Ave” bike station in the upcoming year. We want to look at the past data for count of trips completed from this location to understand how demand has trended over time and how does weather, lifestyle, Leisure etc. play into the overall demand. This forecast equips the management and logistics team to be prepared with bike demand fluctuations and volatility. 

**2. Be specific on your forecast out. Point, Range, Short, Medium, Long,**\
     We will focus on short term. Basically, the term of our forecast will be limited to the upcoming 6-12 months.

**3. How will your measure the accuracy of the forecast.**

We will carry out the following steps and validations to measure the accuracy of the forecast
* Measure the forecast value and observed value and calculate the error
* Measure percentage errors, root mean square errors and mean absolute error
* Splitting dataset into training and testing and then training the test dataset to measure the accuracy of the model's forecast.


**4. Your data set. It should have a time component a column on what you are forecasting at a minimum.**\
Our Dataset has Years and Months. And if there is a need, we can drill down our data to a Daily level as well.

**5. Describe your data, where you got it, how you got it, is there a way other can do the same.**

* Citi Bike is a privately owned public bicycle sharing system serving the New York City boroughs of the Bronx, Brooklyn, Manhattan, and Queens, as well as Jersey City and Hoboken in New Jersey and it is named after its lead sponsor ‘Citigroup’.
* Citi Bike shares its system data for developers, engineers, statisticians, artists, academics, and other interested members of the public for analysis, development, visualization, forecasting and analytics.
* This data resides in a s3 bucket on AWS at https://s3.amazonaws.com/tripdata/index.html.
* Data is split by location into 2 sets of zip files, NYC and Jersey City [JC]. NYC zip files will have trip data from all the stations serving in the 5 boroughs of NYC. JC Zip files will have trip data collected from any NJ based stations (mostly in and around Jersey City neighborhoods).
* We are using NYC Trip data for our forecasting. Furthermore, each zip file only has trip data for a month. 

**For our research and forecasting we did the following**

* 1] Downloaded all the zip files from 2015 until 2020 [72 files].
* 2] Grain of data in these files is Days, Hours and minutes.
* 3] Firstly we extract and consolidate data for 6 years into an excel workbook.
* 4] Next, we filter [on station id] our data to focus and analyze only one specific Station(location) in the NYC market.
* 5] Next, we use Pivot table to covert Trip duration into count of Trips by Day for Station ‘2006’
* 6] Next, we Aggregate Count of Trips from Day to Month roll up
* 7] Final table has 72 data points each row corresponding to distinct 72 months starting from Jan 2015 and ending at Dec 2020.

**6. Links to your group members GitHub profiles.**

* https://github.com/gisha-gopal
* https://github.com/garimachouhan


