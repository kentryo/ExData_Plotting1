#load data
rawdata <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#convert date and subset data
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%Y")
data_subset <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#create datetime
datetime <- strptime(paste(as.character(data_subset$Date), data_subset$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

#convert target data to numeric
global_active_power <- as.numeric(data_subset$Global_active_power)
sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)

#make plot3
png("plot3.png", width = 480, height = 480)
plot(datetime, sub_metering_1, type = "l", ylab = "Energy sub metering",xlab = "")
lines(datetime, sub_metering_2, type = "l", col = "red")
lines(datetime, sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1)
dev.off()