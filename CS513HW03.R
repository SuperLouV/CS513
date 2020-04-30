#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676


## remove all objects
rm(list=ls())

setwd("/Users/louyilin/RStudioProjects")
#read csv file
data<-read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?")

#clean data
data<-na.omit(data)

library(kknn)
?kknn()
data$Class <- factor(data$Class, levels = c(2, 4), labels = c("benign", "malignant"))
class(data$Class)
##Use 30% test 70% training
idx<-sort(sample(nrow(data),as.integer(.70*nrow(data))))
training<-data[idx,]
test<-data[-idx,]


## k=3
predict <- kknn(formula=Class~., training[, -1], test, k=3,kernel ="rectangular"  )
fit <- fitted(predict)
true_class1<-(fit==test$Class)
accuracy1<-sum(true_class1)/length(true_class1)
## k=5
predict <- kknn(formula=Class~., training[, -1], test, k=5,kernel ="rectangular"  )
fit <- fitted(predict)
table(kknn=fit,test$Class)
true_class2<-(fit==test$Class)
accuracy2<-sum(true_class2)/length(true_class2)
## k=10
predict <- kknn(formula=Class~., training[, -1], test, k=10,kernel ="rectangular"  )
fit <- fitted(predict)
table(kknn=fit,test$Class)
true_class3<-(fit==test$Class)
accuracy3<-sum(true_class3)/length(true_class3)
