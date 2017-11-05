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
png("plot2.png", width= 480, height= 480)

##Create plot
plot(SubsetDate$Global_active_power~SubsetDate$DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##Close Device
dev.off()


