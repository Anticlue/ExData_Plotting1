##  plot3.R

##  The purpose of this code is to created the third plot for the
##  Coursera Exploratory Data Analysis first project assignment.

## Initial Setup
setwd("C:/Users/antic/ExData_Plotting1")

## Downloading and unzipping the dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("./data")){
  dir.create ("./data")}
zipfileName <- "./data/powerdataset.zip"
download.file(fileURL, zipfileName)

unzip(zipfileName, exdir="./data")

powerConsumptionData <- read.csv("./data/household_power_consumption.txt", header=T, sep = ';', na.strings="?")
nov1and2 <- subset(powerConsumptionData, Date %in% c("1/2/2007","2/2/2007"))
nov1and2$Date <- as.Date(nov1and2$Date, format="%d/%m/%Y")

nov1and2 <- transform(nov1and2, timeStamp=as.POSIXct( paste(Date,Time)), "%d/%m/%Y %H:%M:%S")


with(nov1and2, {
   plot(timeStamp, Sub_metering_1, type="l", ylab="Global Active Power(kilowatts)", xlab="")
   lines(Sub_metering_2~timeStamp,col="Red")
   lines(Sub_metering_3~timeStamp,col="Blue")
})

legend("topright", col=c("black","red","blue"),lwd=c(1,1,1),c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
