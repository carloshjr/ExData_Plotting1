household_power_consumption <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

household_power_consumption1 <- household_power_consumption[household_power_consumption$Date=="1/2/2007", ]

household_power_consumption2 <- household_power_consumption[household_power_consumption$Date=="2/2/2007", ]

household_power_consumption <- rbind(household_power_consumption1, household_power_consumption2)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

date_time <- paste(as.Date(household_power_consumption$Date), household_power_consumption$Time)

household_power_consumption$Date_time <- as.POSIXct(date_time)

png(filename = "plot3.png", width = 480, height = 480)

with(household_power_consumption, {
     plot(as.numeric(as.character(Sub_metering_1))~Date_time, type="l", 
                                       ylab = "Energy sub metering", 
                                       xlab="")
     lines(as.numeric(as.character(Sub_metering_2))~Date_time, col="red")
     lines(as.numeric(as.character(Sub_metering_3))~Date_time, col="blue")
})
     
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



dev.off()