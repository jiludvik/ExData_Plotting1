library(lubridate)

#prepare data
df <- subset(read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE, na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7))), 
             Date=="1/2/2007"| Date=="2/2/2007")
names(df) <- tolower(names(df))
df$dtime <- dmy_hms(paste(df$date,df$time))

# plot sub_metering_1
plot(df$dtime,df$sub_metering_1, type = "l", xlab = "", ylab ="Energy sub metering")
# add sub_metering_2        
points(df$dt, df$sub_metering_2, type="l", col="red")
# add sub_metering_3
points(df$dt, df$sub_metering_3, type="l", col="blue")
# add legend
legend("topright", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, y.intersp=0.5, x.intersp=0.5, text.width = strwidth("sub_metering_x")[1]*0.8)

#copy plot to png output file
dev.copy(png, file="plot3.png", height = 480, width = 480, units = "px")
dev.off()

