#load data
rawdata <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#convert date and subset data
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%Y")
data_subset <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert target to numeric
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

#create datetime
datetime <- strptime(paste(as.character(data_subset$Date), data_subset$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

#make plot2
png("plot2.png", width = 480, height = 480)
plot(datetime, data_subset$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()