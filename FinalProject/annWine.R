#  Group           : Wine Quality
#  HW              : Final Project
#  Algorithm       : ANN

#nstall.packages('NeuralNetTools')
#install.packages("stringr")
## remove all objects
rm(list=ls())
dev.off
library(neuralnet)
library(NeuralNetTools)
## read CSV file

setwd("/Users/louyilin/RStudioProjects/FinalProject")
data<-read.csv("winequality-red.csv",header = TRUE,na.strings = "?")
#  clean NA datas
# The predictor vars must be scaled data for the ANN fitting

data=na.omit(data[,-1])
data_origonal=data

#data$type <- as.numeric(data$type, levels = c("white", "red"), labels = c("1","2"))
#data$quality <- factor(data$quality, levels = c(3,4,5,6,7,8,9), labels = c("three", "four","five","six","seven","eight","night"))

##Use 30% test 70% training

idx <- sample(1:nrow(data),round(0.7*nrow(data)))
training<-data[idx,]
test<-data[-idx,]

#############
max = apply(data, 2 , max)
min = apply(data, 2 , min)

# response var must be scaled to [0 < resp < 1]
annScaled<- as.data.frame(scale(data, center = min, scale = max- min ))
trainNN<-annScaled[idx,]
testNN<-annScaled[-idx,]

## ANN
#ANN<- neuralnet(quality~fixed.acidity+volatile.acidity+citric.acid+residual.sugar+chlorides+free.sulfur.dioxide+total.sulfur.dioxide+density+pH+sulphates+alcohol,data=trainNN,hidden=c(4,2), threshold=0.01,act.fct = "logistic", linear.output = FALSE)
ANN<- neuralnet(quality~.,data=trainNN,hidden=c(4,2), threshold=0.01,act.fct = "logistic", linear.output = FALSE)
#plot(ANN)
k=ANN$result.matrix
p=ANN$net.result

#A=as.numeric(ANN$net.result)
pred<-compute(ANN ,testNN[,-12])
pred=(pred$net.result * (max(data$quality) - min(data$quality))) + min(data$quality)
pred




# Compare predicted quality with real quality
plot(test$quality, pred, col='blue', pch=16, ylab = "predicted quality NN", xlab = "real quality")

# Calculate Root Mean Square Error (RMSE)
RMSE.NN = (sum((test$quality - pred)^2) / nrow(test)) ^ 0.5
print(paste("the Root Mean Square Error is",RMSE.NN))
# 
gwplot(ANN, selected.covariate="pH")

# Calculate accuracy
for (i in 1: length(pred)) {
  pred[i]=round(pred[i])
}

accuracy= (test$quality==pred)

acc<-sum(accuracy)/length(accuracy)
print(paste("the accuracy is",acc))

# evaluation of variable importance
#Garsons algorithm not applicable for multiple hidden layers
#garson(ANN)














