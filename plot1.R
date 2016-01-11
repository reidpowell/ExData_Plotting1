## Read the data
dat <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

## Select the subset of data between 2007-02-01 and 2007-02-02
subdat <- subset(dat, Date == "2/1/2007" | Date == "2/2/2007")

## Open the device
png(filename="./plot1.png", width = 480, height = 480)

## Generate the histogram
hist(as.numeric(subdat$Global_active_power)/500, breaks = seq(0,10,by = .5), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",xlim = c(0,7.5))

## Close the device
dev.off()