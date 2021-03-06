###############################################################################################################
#JHU Data Science Specialization --> Course4 Week1

rm(list = ls())
setwd("C:/Users/akash/Desktop/StatsCourses/JHU_Specialization/Course4/w1")
###############################################################################################################
##Loading The Data
if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = './data/household_power_consumption.zip')
unzip('./data/household_power_consumption.zip', exdir = './data')

data_full <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')

data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

dataOne <- subset(data_full, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data_full)

##Converting Dates
datetime <- paste(as.Date(dataOne$Date), dataOne$Time)
dataOne$Datetime <- as.POSIXct(datetime)

###############################################################################################################
##PlotTwo
plot(dataOne$Global_active_power ~ dataOne$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

###############################################################################################################

