Citi_Bike_Data <- `Citi.Bike...Includes.parial.2021.data_Monthly.Trip.Count.(exclude.2013,.2014.and.2015)`
  
#Convert the Month column into Date column
Citi_Bike_Data$Month <- as.Date(Citi_Bike_Data$Month, "%d-%B-%y")

str(Citi_Bike_Data)

library(ggplot2)
#create plot of your data after import and date field conversion
p <- ggplot(Citi_Bike_Data, aes(x=Month, y=Trips)) + geom_line(col="dark blue")
plot(p)

#This will show month and year on the X-Axis with an interval of 4 months
p + scale_x_date(breaks = "4 month", date_labels = "%b %Y") 

#Convert your data into a time -series
Citi_ts <- ts(Citi_Bike_Data$Trips,start = c(2016,1),end = c(2021,5),frequency = 12)
plot(Citi_ts)

#Another way to plot the data set with all the datapoints
str(Citi_Bike_Data)
library(ggplot2)
library(dplyr)
Citi_Bike_Data %>%
  ggplot(aes(x=Month, y=Trips)) + geom_line() + geom_point()

summary(Citi_ts)

boxplot(Citi_ts)

##Decomposition using STL

Citi_fit <- stl(Citi_ts,s.window = "periodic")

plot(Citi_fit)

##Decomposition using Decompose

Citi_dec_fit <- decompose(Citi_ts)

plot(Citi_dec_fit)

##Seasonally Adjust the Time-series:
library(forecast)
Citi_seasonal_adj <- seasadj(Citi_dec_fit)

plot(Citi_seasonal_adj)

plot(Citi_ts)

lines(Citi_seasonal_adj,col="Red")


Citi_dec_fit$type
## [1] "additive"

Citi_dec_fit$figure
## [1] -3501.46302 -3464.83802 -2747.25469    82.84948  2107.66198
## [6]  2807.29740  2471.13073  2734.82240  3095.77240  1938.38073
## [11] -2214.01094 -3310.34844

Citi_s_indice <- round(Citi_dec_fit$figure/1000,2)

Citi_s_indice
## [1] -3.50 -3.46 -2.75  0.08  2.11  2.81  2.47  2.73  3.10  1.94 -2.21
## [12] -3.31
##Highest: September Lowest: January

##Acf

Citi_acf <- Acf(Citi_ts,type="correlation")

##Mean Forecast
Citi_bike.mean_f <- meanf(Citi_ts,h=12)
plot(citi_bike.meanf)
plot(citi_bike.meanf$residuals)
hist(citi_bike.meanf$residuals,  xlab = "residuals", main = "Histogram of Mean forecasting Residuals")
Acf(citi_bike.meanf$residuals, main = "ACF OF Mean Forecasting")
citi_bike.acc.meanf <- accuracy(citi_bike.meanf)
citi_bike.mean.forecast <- forecast(citi_bike.meanf,h=7)


##Accuracy for the Mean Forecast:
acc_mean <- accuracy(Citi_bike.mean_f)


##Naive Forecast

Citi_naive_f <- naive(Citi_ts,h=12)
plot(Citi_naive_f)
Citi_naive_seasadj <- naive(Citi_seasonal_adj, h=12)
plot(Citi_naive_seasadj)

plot(Citi_naive_f$residuals)
plot(Citi_naive_seasadj$residuals)

gghistogram(Citi_naive_f$residuals)
gghistogram(Citi_naive_seasadj$residuals)


acc_naive <- accuracy(Citi_naive_f)
Citi_n_forecast <- forecast(Citi_naive_f,h=12)
plot(Citi_n_forecast)

##Random Walk
Citi_rwf_f <- rwf(Citi_ts,12)
plot(Citi_rwf_f)
gghistogram(Citi_rwf_f$residuals)

library(ggplot2)
ggplot(Citi_ts,aes(x=Citi_rwf_f$fitted,y=Citi_rwf_f$residuals))+geom_point()

acc_rwf <- accuracy(Citi_rwf_f)
Citi_rwf_forecast <- forecast(Citi_rwf_f,h=12)
plot(Citi_rwf_forecast)


##Snaive Forecast

Citi_snaive_f <- snaive(Citi_ts,12)
plot(Citi_snaive_f)
gghistogram(Citi_snaive_f$residuals)
ggplot(Citi_ts,aes(x=Citi_snaive_f$fitted,y=Citi_snaive_f$residuals))+geom_point()
acc_snaive <- accuracy(Citi_snaive_f)
Citi_sn_forecast <- forecast(Citi_snaive_f,h=12)
plot(Citi_sn_forecast)

##Simple Moving Average:

Citi_sma_f3  <- ma(Citi_ts,order = 3)

Citi_sma_f6  <- ma(Citi_ts,order = 6)

Citi_sma_f12 <- ma(Citi_ts,order = 12)

##Plotting the time-line:

plot(Citi_ts)

lines(Citi_sma_f3,col="red")

lines(Citi_sma_f6,col="blue")

lines(Citi_sma_f12,col="green")


Citi_sma_forecast1 <- forecast(Citi_sma_f3,h=12)

Citi_sma_forecast2 <- forecast(Citi_sma_f6,h=12)

Citi_sma_forecast3 <- forecast(Citi_sma_f12,h=12)

plot(Citi_sma_forecast1)

plot(Citi_sma_forecast2)

plot(Citi_sma_forecast3)

##Accuracy for Simple moving average:

acc_sma1 <- accuracy(Citi_sma_forecast1)
acc_sma2 <- accuracy(Citi_sma_forecast2)
acc_sma3 <- accuracy(Citi_sma_forecast3)

##ETS method

Citi_ets <- ets(Citi_ts)
plot(Citi_ets)
Citi_ets_forecast <- forecast(Citi_ets,h=12)
plot(Citi_ets_forecast)
acc_ets <- accuracy(Citi_ets)

##Holts-Winter

Citi_hw_f <- HoltWinters(Citi_ts)
plot(Citi_hw_f)
Citi_hw_forecast <- forecast(Citi_hw_f,h=12)
plot(Citi_hw_forecast)
acc_hw <- accuracy(Citi_hw_forecast)


##ARIMA Model:

ndiffs(log(Citi_ts))
## [1] 0
nsdiffs(log(Citi_ts)) 
## [1] 1
tsdisplay(diff((log(Citi_ts)),12))

auto.arima(log(Citi_ts))
auto.arima(log(Citi_ts), stepwise=FALSE)
fit3 <- Arima(log(Citi_ts), order=c(0,0,0), seasonal=c(1,1,0))
res <- residuals(fit3)
tsdisplay(res)
Box.test(res, lag=12, fitdf=4, type="Ljung")
xx=forecast(fit3,h=12)
plot(forecast(fit3, h=12))
accuracy(xx)

