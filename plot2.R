## Read the data
dat <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

## Select the subset of data between 2007-02-01 and 2007-02-02
subdat <- subset(dat, Date == "2/1/2007" | Date == "2/2/2007")
subdat$datetime <- strptime(paste(subdat$Date, subdat$Time), "%m/%d/%Y %H:%M:%OS")
timeseries <- subset(subdat, select = c(datetime,Global_active_power))

## Open the device
png(filename="./plot2.png", width = 480, height = 480)

## Generate the histogram
plot(timeseries, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Close the device
dev.off()