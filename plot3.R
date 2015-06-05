
#Read the data by introducing the corresponding "sep", "nastrings" and "colnames".
#Also, make a rough estimate of the position of the data we are interested in, limiting the extrated data.

data<-read.table("household_power_consumption.txt",skip=(1471*30),nrows=(1471*30),sep=";",na.strings="?",header=F,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Extract the exact values we are interested in.

data2<-data[data$Date=="1/2/2007"| data$Date=="2/2/2007",]


#Convert the Date and Time variables to Date/Time classes and generate a new column

datim<-paste(data2$Date,data2$Time)

data2$DateTime<-strptime(datim,"%d/%m/%Y %H:%M:%S")

#Create the line plot of "plot3".

with(data2, plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))

lines(data2$DateTime,data2$Sub_metering_2,col="red")

lines(data2$DateTime,data2$Sub_metering_3,col="blue")

#Add the legend

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),cex=0.6,y.intersp=0.5)

#Generate the .png file with the required specifications

dev.copy(png, file ="plot3.png",width=480,height=480,units="px")  

dev.off()