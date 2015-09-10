#load data
rawdata <- read.csv("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#convert date and subset data
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%y")
data_subset <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
