
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


###### Plot1 ###########

png("plot1.png", width = 480, height = 480)

hist(
  adat$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency"
)

dev.off()