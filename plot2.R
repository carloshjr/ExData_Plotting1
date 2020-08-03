household_power_consumption <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

household_power_consumption1 <- household_power_consumption[household_power_consumption$Date=="1/2/2007", ]

household_power_consumption2 <- household_power_consumption[household_power_consumption$Date=="2/2/2007", ]

household_power_consumption <- rbind(household_power_consumption1, household_power_consumption2)

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

date_time <- paste(as.Date(household_power_consumption$Date), household_power_consumption$Time)

household_power_consumption$Date_time <- as.POSIXct(date_time)

png(filename = "plot2.png", width = 480, height = 480)

plot(household_power_consumption$Date_time, as.numeric(as.character(household_power_consumption$Global_active_power)), 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()