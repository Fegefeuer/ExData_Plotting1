library(data.table)

house_pow <- fread("household_power_consumption.txt", 
                   na.strings = "?",
                   nrows = 100000)[Date == "1/2/2007" | Date == "2/2/2007"]

house_pow[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

par(bg = "grey95")
with(house_pow, plot(datetime, Global_active_power, 
                     ylab = "Global Active Power (kilowatts)", 
                     xlab = "", 
                     type = "l", 
                     col = "darkred"))


dev.copy(png, "plot2.png")
dev.off()