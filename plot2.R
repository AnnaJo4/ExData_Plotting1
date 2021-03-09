# repeat creating data process from plot1.R
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

# create datetime from Date and Time
hpc$datetime <- dmy_hms(paste(hpc$Date, hpc$Time))

# make a lineplot
with(hpc, plot(datetime,Global_active_power, type = 'l', ylab='Global Active Power (kilowatts)'))


# print to png
dev.set(3)
dev.copy(png, file = "plot2.png")
dev.off()
