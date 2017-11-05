setwd("~/Josh Data Science/DataScienceWorkingDir/exdata%2Fdata%2Fhousehold_power_consumption")

##Read Data
Read_File <- read.table("~/Josh Data Science/DataScienceWorkingDir/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Subset data for specific dates
SubsetDate<- subset(Read_File, Date %in% c("1/2/2007", "2/2/2007"))

##Reformat dates
SubsetDate$Date<- as.Date(SubsetDate$Date, format = "%d/%m/%Y")

##Create/Concatenate a Date + Time field in table
DateTime<- paste(as.Date(SubsetDate$Date), SubsetDate$Time)

##Set new field DateTime as POSIXct for correct formatting
SubsetDate$DateTime<- as.POSIXct(DateTime)

##Create PngFile
png("plot3.png", width= 480, height= 480)

##Create Plot with the appropriate annotations
plot(SubsetDate$Sub_metering_1~SubsetDate$DateTime, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(SubsetDate$Sub_metering_2~SubsetDate$DateTime, col = "Red")
lines(SubsetDate$Sub_metering_3~SubsetDate$DateTime, col = "Blue")
legend("topright", lty = 1, lwd = 3, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Close Device
dev.off()

