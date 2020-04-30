#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  HW              : 07 ANN

## remove all objects
rm(list=ls())
dev.off
#install.packages('neuralnet')
library(neuralnet)
#read CSV file
setwd("/Users/louyilin/RStudioProjects")
data<-read.csv("wisc_bc_ContinuousVar.csv")
set.seed(111)
#judge NAN
table(is.na(data))

data=data[,-1]


##Use 30% test 70% training

idx <- sample(1:nrow(data),round(0.7*nrow(data)))
training<-data[idx,]
test<-data[-idx,]

#ANN five (5) nodes in the hidden layer
ANN <- neuralnet(diagnosis~.,data=training,hidden=5, threshold=0.01)

pred<-compute(ANN ,test[,-1])
ANN_diagnosis<-c('B','M')[apply(pred$net.result,1,which.max)]
ANN$result.matrix
k=apply(pred$net.result,1,which.max)
pred$net.result
k
accuracy= (test$diagnosis==ANN_diagnosis)

acc<-sum(accuracy)/length(accuracy)
print(paste("the accuracy is",acc))


# Plot Neural Net
#plot(ANN)

