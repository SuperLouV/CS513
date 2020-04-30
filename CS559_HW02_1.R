#  Course          : CS559
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  Project         : HW02 Problem 1

#Use the “Pima Indians Diabetes Database” and implement a k-Nearest
#Neighbor classifier. Split the data in half to form the training and test sets and use features 2 to 4
#as above. Report mean accuracy for k=1, 5 and 11, as well as its standard deviation, over at least
#10 trials for each value of k.


## remove all objects
rm(list=ls())
## read data
data<-read.csv("pima-indians-diabetes.csv",header = FALSE,na.strings = "?",skip=9)
## clean data
data<-na.omit(data)
## KNN library
library(kknn)
## select V2 V3 V9
new_data=data[,c(2,3,4,9)]
## Use 50% test 50% training

## k=1

knn1<-function(){
  knn1_accuracy=0
  for (i in 1:10) {
    
    idx<-sort(sample(nrow(new_data),as.integer(.50*nrow(new_data))))
    train<-new_data[idx,]
    test<-new_data[-idx,]
    predict <- kknn(formula=V9~., train, test, k=1,kernel ="rectangular"  )
    fit <- fitted(predict)
    true_class1<-(fit==test$V9)
    accuracy1<-sum(true_class1)/length(true_class1)
    knn1_accuracy=accuracy1+knn1_accuracy
    print(paste0('the',i,'th times : ' ,knn1_accuracy*100/i))
    print(paste0('Accuracy Percentage: ', accuracy1*100))
  }
  print(paste0('the  times : ' ,knn1_accuracy*100/i))

}
knn1()


