##  plot1.R

##  The purpose of this code is to created the first plot for the
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

## Prepare the dataset to only leverage February 1st and 2nd 2007
powerConsumptionData <- read.csv("./data/household_power_consumption.txt", header=T, sep = ';', na.strings="?")
nov1and2 <- subset(powerConsumptionData, Date %in% c("1/2/2007","2/2/2007"))
nov1and2$Date <- as.Date(nov1and2$Date, format="%d/%m/%Y")

hist(nov1and2$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
