# Loading and Selecting relevent Data
  # Reading Daa from file
  # Converting colunm class to Date
  # Subsetting the data
  # Getting Weekday from Date
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')
power_consumption <- mutate(df, Date = as.Date(Date, "%d/%m/%Y"))
power_consumption_subset <- subset(df1, Date == "2007-02-01" | Date == "2007-02-02")
date_time <- strptime(paste(power_consumption_subset$Date, power_consumption_subset$Time, sep = ' '), "%Y-%m-%d %H:%M:%S")

# Getting Plotting Data
submeter1 <- as.numeric(as.character(power_consumption_subset$Sub_metering_1))
submeter2 <- as.numeric(as.character(power_consumption_subset$Sub_metering_2))
submeter3 <- as.numeric(as.character(power_consumption_subset$Sub_metering_3))

# Plotting Graph on PNG File
png("plot3.png", height = 480, width = 480)
plot(date_time, submeter1, ylab = "Energy sub metering", xlab = '', type = "l")
lines(date_time, submeter2, col = 'red')
lines(date_time, submeter3, col = 'blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)
dev.off()
