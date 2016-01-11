library(data.table)

house_pow <- fread("household_power_consumption.txt", 
                   na.strings = "?",
                   nrows = 100000)[Date == "1/2/2007" | Date == "2/2/2007"]

par(bg = "grey95")
with(house_pow, hist(Global_active_power, 
                     main = "Global Active Power", 
                     xlab = "Global Active Power (kilowatts)",
                     col = "darkred"))

dev.copy(png, "plot1.png")
dev.off()