plot4 <- function() {
  
  ## load dependencies
  library(lubridate)
  
  ## read data (from unzipped folder in working directory)
  dat <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", 
                    sep = ";", na.strings = "?", header = TRUE)
  
  ## subset relevant dates
  dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## create datetime column
  dat$datetime <- dmy_hms(paste(dat$Date, dat$Time))
  
  ## open png file
  png(filename = "plot4.png", width = 480, height = 480, units = "px")
  
  ## make plot
  par(bg = NA, mfrow = c(2, 2))
  
  ## plot 1
  plot(dat$datetime, dat$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  
  ## plot 2
  with(dat, plot(datetime, Voltage, type = "l"))
  
  ## plot 3
  plot(dat$datetime, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(dat$datetime, dat$Sub_metering_2, type = "l", col = "red")
  lines(dat$datetime, dat$Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), 
         lty = c(1, 1, 1), bty = "n")
  
  ## plot 4
  with(dat, plot(datetime, Global_reactive_power, type = "l"))
  
  ## close png file
  dev.off()
  
}