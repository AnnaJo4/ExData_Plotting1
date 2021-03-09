# if needed, set the working directory
# setwd("~/your_directory/Exploratory_Data_Analysis/wk1_assignment")

# read the data, which is a ; delimited text file
hpc <- read.delim("household_power_consumption.txt",sep = ";", na.strings = '?')

# select the two days by subsetting
library(lubridate)
hpc$Date1 <- dmy(hpc$Date)
mydate1 <- dmy(01022007)
mydate2 <- dmy(02022007)
hpc <-subset(hpc, (hpc$Date1 == mydate1 | hpc$Date1 == mydate2), na.rm=TRUE)

#look at the data if you want
#head(hpc)

# create histogram
hist(hpc$Global_active_power, col='red', main ='Global Active Power', xlab='Global Active Power (kilowatts)')

# print to png
dev.set(3)
dev.copy(png, file = "plot1.png")
dev.off()