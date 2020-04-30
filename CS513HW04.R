#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  HW              : 04


## remove all objects
rm(list=ls())

#install.packages('e1071', dependencies = TRUE)
library(e1071)
library(class) 

#read data
data<-read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?")
#clean data
data<-na.omit(data)
#read the type
class(data)

data$Class <- factor(data$Class, levels = c(2, 4), labels = c("benign", "malignant"))
class(data$Class)
##Use 30% test 70% training
idx<-sort(sample(nrow(data),as.integer(.70*nrow(data))))
train<-data[idx,]
test<-data[-idx,]

#naive-bayes
nb=naiveBayes(Class~., data=train)
category_nb<-predict(nb,test )
table(NBayes=category_nb,Class=test$Class)
NB_wrong<-sum(category_nb!=test$Class)

NB_error_rate<-NB_wrong/length(category_nb)

print(NB_error_rate)




