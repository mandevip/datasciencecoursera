### plot1

### It appears to me that you do not understand even basic statistics. As a
### corollary to that impression I would suggest that giving you advice about the
### use of R for scientific investigation could be morally similar to giving you
### advice about how to do your own household wiring.
###    -- David Winsemius
###       R-help (November 2009)

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
                                          
### test plot
hist(dat2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

### save plot
png(file="plot1.png",bg="transparent")
hist(dat2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

