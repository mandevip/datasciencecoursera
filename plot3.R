### plot3

### Eric Lecoutre: I don't want to die being idiot...
### Peter Dalgaard: With age, most of us come to realise that that is the only
### possible outcome.
###    -- Eric Lecoutre and Peter Dalgaard
###       R-help (October 2004)

### Session information
sessionInfo()

### Work directory
setwd("E:/Courses/Coursera/Exploratory Data Analysis/Course Projects/Project1")
getwd()
dir()

### Data
dat <- read.table("household_power_consumption.txt",sep=";",na.strings="?",header=T)
dim(dat)
head(dat)
write.csv(dat,"dat.csv",row.names=F)
dir()
summary(dat)
str(dat)

### Convert string to Date
dat$Date2 <- as.Date(as.character(dat$Date),"%d/%m/%Y")
dim(dat)
head(dat)
summary(dat)

### Subset
dat2 <- subset(dat,Date2==as.Date("2007-02-01") | Date2==as.Date("2007-02-02"))
dim(dat2)
write.csv(dat2,"dat2.csv",row.names=F)
dir()
unique(dat2$Date2)
summary(dat2)

### hours, minutes, seconds
dat2$H <- substring(dat2$Time,1,2)
dat2$H[1:5]
dat2$M <- substring(dat2$Time,4,5)
dat2$M[1:5]
dat2$S <- substring(dat2$Time,7,8)
dat2$S[1:5]
unique(dat2$S)

### No hay segundos, solamente minutos y horas
dat2$min <- as.numeric(dat2$H)*60+as.numeric(dat2$M)
dat2$min[1:5]

### days
dat2$fecha <- with(dat2,ifelse(Date=="1/2/2007",1,2))
unique(dat2$fecha)

### minutes/day

### 24 hrs * 60 min/hr = 1440 min/day

### Day1 = number of minutes
### Day2 = number of minutes + 1440

### Convert to minutes
dat2$Min <- ifelse(dat2$fecha==2,dat2$min+1440,dat2$min)
range(dat2$Min) 

### maximum
max(dat2$Sub_metering_1)
max(dat2$Sub_metering_2)
max(dat2$Sub_metering_3)

### test plot
plot(dat2$Min,dat2$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",axes=F)
box()
axis(2)
axis(1,at=c(0,1434.5,2879),labels=c("Thu","Fri","Sat"))
lines(dat2$Sub_metering_1,type="l",col="black")
lines(dat2$Sub_metering_2,type="l",col="red")
lines(dat2$Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

### save plot
png(file="plot3.png",bg="transparent")
plot(dat2$Min,dat2$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",axes=F)
box()
axis(2)
axis(1,at=c(0,1434.5,2879),labels=c("Thu","Fri","Sat"))
lines(dat2$Sub_metering_1,type="l",col="black")
lines(dat2$Sub_metering_2,type="l",col="red")
lines(dat2$Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


