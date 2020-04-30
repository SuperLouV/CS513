#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  Project         : Midterm O7


## remove all objects
rm(list=ls())
#load a file
data<-read.csv("COVID19_v3.csv",header = TRUE,na.strings = "?",colClasses = c("MaritalStatus"="factor"))
# Remove the missing values
data<-na.omit(data)

library(kknn)
##Use 30% test 70% training
idx<-sort(sample(nrow(data),as.integer(.70*nrow(data))))
train<-data[idx,]
test<-data[-idx,]

## k=5
predict <- kknn(formula=Infected~., train, test, k=5,kernel ="rectangular"  )
fit <- fitted(predict)
table(kknn=fit,test$Infected)
true_class2<-(fit==test$Infected)
accuracy2<-sum(true_class2)/length(true_class2)

print(paste0('Accuracy Percentage: ', accuracy2*100))





