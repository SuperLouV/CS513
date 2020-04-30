#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676


HW02_1<-function(){
  print("HW02_1")
  #set url
  setwd("/Users/louyilin/RStudioProjects")
  
  #read csv file
  data<-read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?")
  #I.Summarizing each column (e.g. min, max, mean )
  summary(data)
  # II.Identifying missing values
  is.na(data)
  
  #III.Replacing the missing values with the “mean” of the column.
  for (i in 1:11) {
    # datas[is.na(datas)]=mean(datas,na.rm=TRUE)  
    data[is.na(data[,i]),i] <- mean(data[,i],na.rm = TRUE)
  }
  data<-round(data,0)
  data
  
  #IV.Displaying the frequency table of “Class” vs. F6
  
  with(data,table(Class,F6))
  
  # V.Displaying the scatter plot of F1 to F6, one pair at a time
  
  # library(ggplot2)
  # p <- ggplot(data,aes(x=F1,y=F2)) + geom_point(shape=19) +
  # xlab("F1") + ylab("F2") 
  # p
  
  plot(data[2:7],main="the scatter plot of F1 to F6",col="red")
  
  # VI.Show histogram box plot for columns F7 to F9
  
  boxplot(data[8:10],main="histogram box plot for columns F7 to F9",col="green")
  
}




HW02_1()

# remove all objects
rm(list=ls())
#Reload the “breast-cancer-wisconsin.data.csv” 
#set url
setwd("/Users/louyilin/RStudioProjects")
#read csv file
data<-read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?")
#Remove any row with a missing value in any of the columns.
data1<-na.omit(data)

View(data1)













