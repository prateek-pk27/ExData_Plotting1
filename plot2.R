# Loading and Selecting relevent Data
  # Reading Daa from file
  # Converting colunm class to Date
  # Subsetting the data
  # Getting Plotting Data
  # Getting Weekday from Date
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ';')
power_consumption <- mutate(df, Date = as.Date(Date, "%d/%m/%Y"))
power_consumption_subset <- subset(df1, Date == "2007-02-01" | Date == "2007-02-02")
global_active_power <- as.numeric(as.character(power_consumption_subset$Global_active_power))
date_time <- strptime(paste(power_consumption_subset$Date, power_consumption_subset$Time, sep = ' '), "%Y-%m-%d %H:%M:%S")

# Plotting Graph on PNG file
png("plot2.png", height = 480, width = 480)
plot(date_time, global_active_power, ylab = "Global Active Power (kilowatts)", xlab = '', type = "l")
dev.off()
