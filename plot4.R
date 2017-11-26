library(sqldf)
library(lubridate)

# read only the data from Feb 1 and 2 2007 using SQL query
df <- read.csv.sql("household_power_consumption.txt", 
                   sep=";",
                   sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'")

df$datetime <- with(df, dmy(Date) + hms(Time))

png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# top left plot (same as "plot2")
with(df, plot(datetime, 
              Global_active_power, 
              type="l", 
              xlab="", 
              ylab="Global Active Power (killowatts)"))

# top right plot
with(df, plot(datetime, 
              Voltage, 
              type="l", 
              ylab="Voltage"))

# bottom left plot (same as "plot3")
with(df, plot(datetime, 
              Sub_metering_1, 
              type="l", 
              col="black",
              ylab = "Energy sub metering", 
              xlab = ""))

with(df, points(datetime, 
                Sub_metering_2, 
                type="l", 
                col="red"))

with(df, points(datetime, 
                Sub_metering_3, 
                type="l", 
                col="blue"))

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lwd=c(1,1,1)
)

# bottom right plot
with(df, plot(datetime, 
              Global_reactive_power, 
              type="l", 
              ylab="Global_reactive_power"))


dev.off()