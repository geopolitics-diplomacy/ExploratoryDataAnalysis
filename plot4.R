power <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
power$Date <- strptime(power$Date, format = "%d/%m/%Y")
power$Time <- strptime(power$Time, format = "%H:%M:%S")
power$Date <- as.Date(power$Date, format = "%Y-%m-%d")
df <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
thu <- length(df$Date[weekdays(df$Date) == "Donnerstag"])
fri <- length(df$Date[weekdays(df$Date) == "Freitag"]) + thu
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#upper left graphic
plot(df$Global_active_power, xaxt = "n", col = "black", type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, at = c(0, thu, fri), labels = c("Thu", "Fri", "Sat"))

#upper right graphic
plot(df$Voltage, xaxt = "n", col = "black", type = "l", ylab = "Voltage", xlab = "datetime")
axis(1, at = c(0, thu, fri), labels = c("Thu", "Fri", "Sat"))

#lower left graphic
plot(df$Sub_metering_1, xaxt = "n", col = "black", type = "l", ylab = "Energy sub metering", xlab = "")
axis(1, at = c(0, thu, fri), labels = c("Thu", "Fri", "Sat"))
lines(df$Sub_metering_2, col = "red")
lines(df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

#lower right graphic
#upper left graphic
plot(df$Global_reactive_power, xaxt = "n", col = "black", type = "l", ylab = "Global_reactive_power", xlab = "datetime")
axis(1, at = c(0, thu, fri), labels = c("Thu", "Fri", "Sat"))

dev.off()
