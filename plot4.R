## http://seananderson.ca/courses/11-multipanel/multipanel.pdf

## Read the data
dat <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

## Select the subset of data between 2007-02-01 and 2007-02-02
subdat <- subset(dat, Date == "2/1/2007" | Date == "2/2/2007")
subdat$datetime <- strptime(paste(subdat$Date, subdat$Time), "%m/%d/%Y %H:%M:%OS")

## Open the device
png(filename="./plot4.png", width = 480, height = 480)

## Generate the plot
par(mfrow = c(2, 2))
par(cex = 0.6)
plot(subset(subdat, select = c(datetime,Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power")
plot(subset(subdat, select = c(datetime,Voltage)), type = "l")
plot(subset(subdat, select = c(datetime,Sub_metering_1)), ylim = c(0,40), type = "l", ylab = "Energy sub metering", xlab = "")
par(new = T)
plot(subset(subdat, select = c(datetime,Sub_metering_2)), ylim = c(0,40), type = "l", ylab = "Energy sub metering", col = "red", xlab = "")
par(new = T)
plot(subset(subdat, select = c(datetime,Sub_metering_3)), ylim = c(0,40), type = "l", ylab = "Energy sub metering", col = "blue", xlab = "")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), pch=NA, lty = c(1,1,1))
plot(subset(subdat, select = c(datetime,Global_reactive_power)), type = "l")

## Close the device
dev.off()