# Reading, naming and subsetting
ActivePower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(ActivePower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subActivePower <- subset(ActivePower,power$Date=="1/2/2007" | ActivePower$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subActivePower$Date <- as.Date(subActivePower$Date, format="%d/%m/%Y")
subActivePower$Time <- strptime(subActivePower$Time, format="%H:%M:%S")
subActivePower[1:1440,"Time"] <- format(subActivePower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subActivePower[1441:2880,"Time"] <- format(subActivePower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Basic plot function
plot(subActivePower$Time,as.numeric(as.character(subActivePower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# Annotating graph
title(main="Global Active Power Vs Time")

#COpy
dev.copy(png, file = "plot2.png", height=480, width=480)
dev.off()