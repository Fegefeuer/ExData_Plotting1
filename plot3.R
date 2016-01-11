library(data.table)

house_pow <- fread("household_power_consumption.txt", 
                   na.strings = "?",
                   nrows = 100000)[Date == "1/2/2007" | Date == "2/2/2007"]

house_pow[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

par(bg = "grey95")
with(house_pow, plot(datetime, Sub_metering_1, 
                     type = "n", 
                     ylab = "Energy sub metering", 
                     xlab = ""))
with(house_pow, lines(datetime, Sub_metering_1, 
                      lwd = 2))
with(house_pow, lines(datetime, Sub_metering_2, 
                      col = "darkred", 
                      lwd = 2))
with(house_pow, lines(datetime, Sub_metering_3, 
                      col = "darkblue", 
                      lwd =2))
legend("top", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "darkred", "darkblue"),
       bty = "n",
       lwd = 2,
       lty = 1)

dev.copy(png, "plot3.png")
dev.off()