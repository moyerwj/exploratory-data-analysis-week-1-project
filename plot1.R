setwd("~/Josh Data Science/DataScienceWorkingDir/exdata%2Fdata%2Fhousehold_power_consumption")

##Read Data
Read_File <- read.table("~/Josh Data Science/DataScienceWorkingDir/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Subset data for specific dates
SubsetDate<- subset(Read_File, Date %in% c("1/2/2007", "2/2/2007"))

##Reformat dates
SubsetDate$Date<- as.Date(SubsetDate$Date, format = "%d/%m/%Y")

##Create PngFile
png("plot1.png", width= 480, height= 480)

##Create Histogram Plot
hist(SubsetDate$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency", col = "red")

##Close Device
dev.off()

