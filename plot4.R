# Loading and Selecting relevent Data
  # Reading Daa from file
  # Converting colunm class to Date
  # Subsetting the data
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')
power_consumption <- mutate(power_consumption, Date = as.Date(Date, "%d/%m/%Y"))
power_consumption_subset <- subset(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

# Getting Plotting data 
voltage <- as.numeric(as.character(power_consumption_subset$Voltage))
global_active_power <- as.numeric(as.character(power_consumption_subset$Global_active_power))
global_reactive_power <- as.numeric(as.character(power_consumption_subset$Global_reactive_power))
date_time <- strptime(paste(power_consumption_subset$Date, power_consumption_subset$Time, sep = ' '), "%Y-%m-%d %H:%M:%S")
submeter1 <- as.numeric(as.character(power_consumption_subset$Sub_metering_1))
submeter2 <- as.numeric(as.character(power_consumption_subset$Sub_metering_2))
submeter3 <- as.numeric(as.character(power_consumption_subset$Sub_metering_3))

# Opening PNG Graphics Device
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))

# Plotting 1st Graph
plot(date_time, global_active_power, ylab = "Global Active Power (kilowatts)", xlab = '', type = "l")

# Plotting 2nd Graph
plot(date_time, voltage, ylab = "Voltage", xlab = 'datetime', type = "l")

# Plotting 3rd Graph
plot(date_time, submeter1, ylab = "Energy sub metering", xlab = '', type = "l")
lines(date_time, submeter2, col = 'red')
lines(date_time, submeter3, col = 'blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n")

# Plotting 4th Graph
plot(date_time, global_reactive_power, ylab = "Global_reactive_ower", xlab = 'datetime', type = "l")
dev.off()
