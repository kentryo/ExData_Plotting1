#load data
rawdata <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#convert date and subset data
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%Y")
data_subset <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#convert target to numeric
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

#make histgram
hist(data_subset$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")

#save to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
