#read and prepare data
library(lubridate)

df <- subset(read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE, na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7))), 
             Date=="1/2/2007"| Date=="2/2/2007")
names(df) <- tolower(names(df))
df$dtime <- dmy_hms(paste(df$date,df$time))

# set layout of the page
par(mfrow=c(2,2))
#first plot
plot(x=df$dtime, y=df$global_active_power, type="l", xlab = "", ylab = "Global Active Power")
#second plot
plot(df$dtime, df$voltage, type="l", ylab = "Voltage", xlab = "datetime")
#third plot
plot(df$dtime,df$sub_metering_1, type = "l", xlab = "", ylab ="Energy sub metering")
        points(df$dt, df$sub_metering_2, type="l", col="red")
        points(df$dt, df$sub_metering_3, type="l", col="blue")
        legend("topright", col=c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lwd=1, 
        y.intersp=0.3, x.intersp=0.3, 
        text.width = strwidth("sub_metering_x")[1]*0.8, 
        cex=0.8,  
        bty="n")
plot(df$dtime,df$global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file="plot4.png", height = 480, width = 480, units = "px")
dev.off()

