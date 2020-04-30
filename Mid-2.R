#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  Project         : Midterm O2


## remove all objects
rm(list=ls())
data<-read.csv("COVID19_v3.csv",header = TRUE,na.strings = "?",colClasses = c("MaritalStatus"="factor"))
which(rowSums(is.na(data))==0)
#data1<-na.omit(data)

#I.Summarizing each column (e.g. min, max, mean )
summary(data)

# II.Identifying missing values
is.na(data)

#III.Displaying the frequency table of “Infected” vs. “MaritalStatus” 
with(data,table(Infected,MaritalStatus))

#IV.Displaying the scatter plot of “Age”, “MaritalStatus” and “MonthAtHospital”, one pair at a time
data_display=data.frame(data$Age,data$MaritalStatus,data$MonthAtHospital)

#data2=cbind(data$Age,data$MaritalStatus,data$MonthAtHospital)
plot(data_display,main="the scatter plot of “Age”, “MaritalStatus” and “MonthAtHospital”",col="red")

#V.Show box plots for columns:  “Age”, “MaritalStatus” and “MonthAtHospital”
boxplot(data_display,main="histogram box plot for“Age”, “MaritalStatus” and “MonthAtHospital”",col="green")

#VI.Replacing the missing values of “Cases” with the “mean” of “Cases”.
# there is no  missing values of “Cases” acturally
data[is.na(data[,'Cases'])]=mean(data[,'Cases'],na.rm=TRUE)  
mean(data[,'Cases'],na.rm=TRUE)  









