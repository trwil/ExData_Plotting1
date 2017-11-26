library(sqldf)
library(lubridate)

# read only the data from Feb 1 and 2 2007 using SQL query
df <- read.csv.sql("household_power_consumption.txt", 
                   sep=";",
                   sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'")

df$datetime <- with(df, dmy(Date) + hms(Time))

png(filename="plot2.png", width=480, height=480)

with(df, plot(datetime, 
              Global_active_power, 
              type="l", 
              xlab="", 
              ylab="Global Active Power (killowatts)"))

dev.off()
