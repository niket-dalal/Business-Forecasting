Citi_Bike_Data <- Citi.Bike...Monthly.Trip.Count

#Convert the Month column into Date column
Citi_Bike_Data$Month <- as.Date(Citi_Bike_Data$Month, "%d-%B-%Y")

library(ggplot2)
#create plot of your data after import and date field conversion
p <- ggplot(Citi_Bike_Data, aes(x=Month, y=Trips)) + geom_line()

#This will show month and year on the X-Axis with an interval of 4 months
p + scale_x_date(breaks = "4 month", date_labels = "%b %Y") 

#Convert your data into a time -series
Citi_ts <- ts(Citi_Bike_Data$Trips,start = c(2015,1),end = c(2020,12),frequency = 12)
plot(Citi_ts)

#Another way to plot the data set with all the datapoints
str(Citi_Bike_Data)
library(ggplot2)
library(dplyr)
Citi_Bike_Data %>%
ggplot(aes(x=Month, y=Trips)) + geom_line() + geom_point()


naive_mod <- naive(Citi_ts, h = 12)
summary(naive_mod)

se_model <- ses(Citi_ts, h = 12)
summary(se_model)

holt_model <- holt(Citi_ts, h = 12)
summary(holt_model)

Acf(Citi_ts)
mean_forecast <- meanf(Citi_ts,5)
plot(mean_forecast)
naive_forecast <- naive(Citi_ts,5)
plot(naive_forecast)
naive_forecast
naive_forecast
?naive
naive_forecast <- naive(Citi_ts,5,level = c(20,99))
plot(naive_forecast)
naive_forecast <- naive(Citi_ts,5,level = c(0,99))
plot(naive_forecast)
rwf_forecast <- rwf(Citi_ts,12)
plot(rwf_forecast)
rwf_forecast
snaive_forecast <- snaive(Citi_ts,12)
plot(snaive_forecast)
MA5_forecast <- ma(Citi_ts,order=5)
MA9_forecast <- ma(Citi_ts,order=9)
MA20_forecast <- ma(Citi_ts,order=20)
plot(MA5_forecast)
plot(MA9_forecast)
plot(MA20_forecast)
MA51_forecast <- ma(Citi_ts,order=51)
plot(MA51_forecast)
plot(Citi_ts)
lines(MA5_forecast, col = "Red")
lines(MA9_forecast, col = "Green")
lines(MA20_forecast, col = "Blue")
?na
?ma
?ma
MA20_forecast <- ma(Citi_ts)
MA20_forecast <- ma(Citi_ts)
lines(snaive_forecast$mean,col="Yellow")
attributes(snaive_forecast)
?forecast
snaive_forecast$level
snaive_forecast$fitted
lines(snaive_forecast$fitted,col="Yellow")
lines(snaive_forecast$x,col="Yellow")
plot(elecequip)
lines(snaive_forecast$fitted,col="Yellow")
?plot
?ets
ets_forecast <- ets(Citi_ts)
ets_forecast
hw_forecast_level <- HoltWinters(Citi_ts, beta=FALSE,gamma=FALSE)
hw_forecast_level
hw_forecast_trend <- HoltWinters(Citi_ts,gamma=FALSE)
hw_forecast_trend
hw_forecast_season <- HoltWinters(Citi_ts)
hw_forecast_season
plot(Citi_ts)
plot(hw_forecast_level)
plot(hw_forecast_trend)
plot(hw_forecast_season)
hw_forecast_all <- forecast(hw_forecast_season, h=12)
plot(hw_forecast_all)
accuracy(hw_forecast_all)


Citi_ts %>%
stl(t.window=13, s.window="periodic", robust=TRUE) %>%
  autoplot()
-----------------
