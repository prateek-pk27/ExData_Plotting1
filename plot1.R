# Loading and Selecting relevent Data
  # Reading Daa from file
  # Converting colunm class to Date
  # Subsetting the data
  # Getting Plotting Data
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ';') 
power_consumption <- mutate(df, Date = as.Date(Date, "%d/%m/%Y")) 
power_consumption_subset <- subset(df1, Date == "2007-02-01" | Date == "2007-02-02") 
global_active_power <- as.numeric(as.character(power_consumption_subset$Global_active_power)) 

# Plotting Graph on a PNG file
png("plot1.png", height = 480, width = 480)
hist(global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = 'red')
dev.off()
