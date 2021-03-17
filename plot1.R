power <- read.table("./data/household_power_consumption.txt", sep = ";", header = TRUE)
power$Date <- strptime(power$Date, format = "%d/%m/%Y")
power$Date <- as.Date(power$Date, format = "%Y-%m-%d")
df <- power[power$Date >= "2007-02-01" & power$Date <= "2007-02-02", ]
df$Global_active_power <- as.numeric(df$Global_active_power)
png(file = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
