power <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
power$Date <- strptime(power$Date, format = "%d/%m/%Y")
power$Time <- strptime(power$Time, format = "%H:%M:%S")
power$Date <- as.Date(power$Date, format = "%Y-%m-%d")
df <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]
df$Global_active_power <- as.numeric(df$Global_active_power)
thu <- length(df$Date[weekdays(df$Date) == "Donnerstag"])
fri <- length(df$Date[weekdays(df$Date) == "Freitag"]) + thu
png(file = "plot3.png", width = 480, height = 480)
plot(df$Sub_metering_1, xaxt = "n", col = "black", type = "l", ylab = "Energy sub metering", xlab = "")
axis(1, at = c(0, thu, fri), labels = c("Thu", "Fri", "Sat"))
lines(df$Sub_metering_2, col = "red")
lines(df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()
