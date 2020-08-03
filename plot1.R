household_power_consumption <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";")

household_power_consumption1 <- household_power_consumption[household_power_consumption$Date=="1/2/2007", ]

household_power_consumption2 <- household_power_consumption[household_power_consumption$Date=="2/2/2007", ]

household_power_consumption <- rbind(household_power_consumption1, household_power_consumption2)

household_power_consumption$Date <- as.Date(household_power_consumption$Date)

png(filename = "plot1.png", width = 480, height = 480)

hist(as.numeric(as.character(household_power_consumption$Global_active_power)), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()