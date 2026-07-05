############# Read data ###############

library(readr)
# the txt file contains only the dates 2007-02-01 and 2007-02-02

adat <- read.table(
  "C:/Dokumentumok/Data Science/Exploratory DA/household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  dec = ".",
  na.strings = "?",
  stringsAsFactors = FALSE
)


adat$Date <- as.Date(adat$Date, format = "%d/%m/%Y")

adat$DateTime <- strptime(
  paste(adat$Date, adat$Time),
  format = "%Y-%m-%d %H:%M:%S"
)


###### Plot4 ###########

png("plot4.png", width = 480, height = 480)

Sys.setlocale("LC_TIME", "English")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Plot1
plot(
    adat$DateTime,
    adat$Global_active_power,
    type = "l",
    col = "black",
    xlab = "",
    ylab = "Global Active Power (kilowatts)",
    xaxt = "n"
  )
  
  axis.POSIXct(
    side = 1,
    at = seq(min(adat$DateTime), max(adat$DateTime), by = "day"),
    format = "%a"
  )

#Plot2    
plot(
  adat$DateTime,
  adat$Voltage,
  type = "l",
  col = "black",
  xlab = "",
  ylab = "Voltage",
  xaxt = "n"
)
axis.POSIXct(
  side = 1,
  at = seq(min(adat$DateTime), max(adat$DateTime), by = "day"),
  format = "%a"
)

#Plot3

plot(
  adat$DateTime,
  adat$Sub_metering_1,
  type = "l",
  col = "black",
  xlab = "",
  ylab = "Energy sub metering",
  xaxt = "n"
)

lines(adat$DateTime, adat$Sub_metering_2, col = "red")
lines(adat$DateTime, adat$Sub_metering_3, col = "blue")

axis.POSIXct(
  side = 1,
  at = seq(min(adat$DateTime), max(adat$DateTime), by = "day"),
  format = "%a"
)

legend(
  "topright",
  inset = 0.02,
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n",
  cex = 0.7
)

#Plot4
plot(
  adat$DateTime,
  adat$Global_reactive_power,
  type = "l",
  col = "black",
  xlab = "",
  ylab = "Global_reactive_power",
  xaxt = "n"
)
axis.POSIXct(
  side = 1,
  at = seq(min(adat$DateTime), max(adat$DateTime), by = "day"),
  format = "%a"
)

dev.off()