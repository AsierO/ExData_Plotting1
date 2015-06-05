
#Read the data by introducing the corresponding "sep", "nastrings" and "colnames".
#Also, make a rough estimate of the position of the data we are interested in, limiting the extrated data.

data<-read.table("household_power_consumption.txt",skip=(1471*30),nrows=(1471*30),sep=";",na.strings="?",header=F,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Extract the exact values we are interested in.

data2<-data[data$Date=="1/2/2007"| data$Date=="2/2/2007",]


#Convert the Date and Time variables to Date/Time classes and generate a new column

datim<-paste(data2$Date,data2$Time)

data2$DateTime<-strptime(datim,"%d/%m/%Y %H:%M:%S")

#Create the panel plot of "plot4".

par(mfrow = c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(data2, {
        
        #Plot (1,1)
        
        plot(DateTime,Global_active_power,type="l",ylab="Global Active Power",xlab="")
        
        #Plot (1,2)
        
        plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime")
        
        #Plot (2,1)
        
        plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
        
        lines(data2$DateTime,data2$Sub_metering_2,col="red")
        
        lines(data2$DateTime,data2$Sub_metering_3,col="blue")
        
        legend("topright",bty = "n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),cex=0.6,y.intersp=0.5)
        
        #Plot (2,2)
        
        plot(DateTime,Global_reactive_power,type="l",xlab="datetime")
        
})

#Generate the .png file with the required specifications


dev.copy(png, file ="plot4.png",width=480,height=480,units="px")  

dev.off()