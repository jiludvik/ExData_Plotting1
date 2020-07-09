library(lubridate)
#prepare data
df <- subset(read.table("household_power_consumption.txt", sep=";", 
                   header=TRUE, na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7))), 
             Date=="1/2/2007"| Date=="2/2/2007")
names(df) <- tolower(names(df))
df$datetime <- dmy_hms(paste(df$date,df$time))

#reset layout
par(mfrow=c(1,1))

#plot line chart
plot(df$datetime,df$global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

# copy to png output file
dev.copy(png, file="plot2.png", height = 480, width = 480, units = "px")
dev.off()

