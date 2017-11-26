library(sqldf)

# read only the data from Feb 1 and 2 2007 using SQL query
df <- read.csv.sql("household_power_consumption.txt", 
                   sep=";",
                   sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'")

png(filename="plot1.png", width=480, height=480)

hist(df$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (killowatts)")

dev.off()
