plot1 <- function() {
  
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
  png(filename = "plot1.png", width = 480, height = 480, units = "px")
  
  ## make plot
  par(bg = NA)
  hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  
  ## close png file
  dev.off()
  
}

