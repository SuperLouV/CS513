#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  HW              : 06 C5.0 and Random Forest

#install.packages("C50", repos="http://R-Forge.R-project.org")
#install.packages("C50")
library('C50')
## remove all objects
rm(list=ls())
setwd("/Users/louyilin/RStudioProjects")
#read data
data<-read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?",colClasses = c("Sample"="character","F1"="factor","F2"="factor","F3"="factor","F4"="factor","F5"="factor","F6"="factor","F7"="factor","F8"="factor","F9"="factor"))
#clean data
data<-na.omit(data[,-1])
data$Class <- factor(data$Class, levels = c(2, 4), labels = c("benign", "malignant"))
##Use 25% test 75% training
index<-sort(sample(nrow(data),round(.25*nrow(data))))
training<-data[-index,]
test<-data[index,]
#
C50_class <- C5.0( Class~.,data=training )
plot(C50_class)
C50_predict<-predict( C50_class ,test , type="class" )
right<- (test[,10]==C50_predict)
c50_rate<-sum(right)/length(test[,10])
print(paste("the accuracy of C50 is",c50_rate))


#Random Forest

#install.packages("randomForest")
library('randomForest')

randomForest_class<-randomForest(Class~.,data = training)
plot(randomForest_class)
# Predict
randomForest_predict<-predict( randomForest_class ,test , type="class" )
right2<- (test[,10]==randomForest_predict)
RF_rate<-sum(right2)/length(test[,10])
print(paste("the accuracy of RF is",RF_rate))
