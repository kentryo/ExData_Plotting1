#load data
rawdata <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#convert date and subset data
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%Y")
data_subset <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert target to numeric
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

#make histgram
png("plot1.png", width = 480, height = 480)
hist(data_subset$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
