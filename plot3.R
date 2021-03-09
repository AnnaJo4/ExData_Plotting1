# read data
# setwd("~/your_directory/Exploratory_Data_Analysis/wk1_assignment")
hpc <- read.delim("household_power_consumption.txt",sep = ";", na.strings = '?')


library(lubridate)
# select and edit data
hpc$Date1 <- dmy(hpc$Date)
mydate1 <- dmy(01022007)
mydate2 <- dmy(02022007)
hpc <-subset(hpc, (hpc$Date1 == mydate1 | hpc$Date1 == mydate2), na.rm=TRUE)
hpc$datetime <- dmy_hms(paste(hpc$Date, hpc$Time))

#make plot
plot(hpc$datetime,as.numeric(hpc$Sub_metering_1), type = 'l', ylab='Energy sub metering')
points(hpc$datetime,as.numeric(hpc$Sub_metering_2), type = 'l', col = 'red')
points(hpc$datetime,as.numeric(hpc$Sub_metering_3), type = 'l', col = 'blue')
legend("topright", lwd = 1, col = c("black", "red","blue"), legend = c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"))


# print to png
dev.set(3)
dev.copy(png, file = "plot3.png")
dev.off()

