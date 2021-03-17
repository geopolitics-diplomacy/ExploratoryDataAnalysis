power <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
power$Date <- strptime(power$Date, format = "%d/%m/%Y")
power$Time <- strptime(power$Time, format = "%H:%M:%S")
power$Date <- as.Date(power$Date, format = "%Y-%m-%d")
df <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]
df$Global_active_power <- as.numeric(df$Global_active_power)
png(file = "plot2.png", width = 480, height = 480)
thu <- length(df$Date[weekdays(df$Date) == "Donnerstag"])
fri <- length(df$Date[weekdays(df$Date) == "Freitag"]) + thu
plot(df$Global_active_power, xaxt = "n", col = "black", type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, at = c(0, thu, fri), labels = c("Thu", "Fri", "Sat"))
dev.off()
