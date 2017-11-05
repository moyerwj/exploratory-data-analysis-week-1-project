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
png("plot4.png", width= 480, height= 480)

##Setup parameters for plots to display in a 2 x 2 row/col
par(mfrow= c(2,2))

##Plots to display
plot(SubsetDate$Global_active_power~SubsetDate$DateTime, type = "l", xlab = "", ylab = "Global Active Power")
plot(SubsetDate$Voltage~SubsetDate$DateTime, type = "l", xlab = "datetime", ylab = "Voltage")

plot(SubsetDate$Sub_metering_1~SubsetDate$DateTime, type = "l", xlab = "", ylab = "Energy Sub Metering")
lines(SubsetDate$Sub_metering_2~SubsetDate$DateTime, col = "Red")
lines(SubsetDate$Sub_metering_3~SubsetDate$DateTime, col = "Blue")
legend("topright", lty = 1, lwd = 3, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(SubsetDate$Global_reactive_power~SubsetDate$DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##Close Device
dev.off()
