#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  HW              : 05


## remove all objects
rm(list=ls())

#libraries
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle
#load csv file
data<-read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?",colClasses = c("Sample"="character","F1"="factor",
                                                                                                "F2"="factor","F3"="factor","F4"="factor",
                                                                                                "F5"="factor","F6"="factor","F7"="factor",
                                                                                                "F8"="factor","F9"="factor"))

#clean data
data<-na.omit(data)

data$Class <- factor(data$Class, levels = c(2, 4), labels = c("benign", "malignant"))
class(data$Class)
##Use 30% test 70% training
idx<-sort(sample(nrow(data),as.integer(.70*nrow(data))))
training<-data[idx,]
test<-data[-idx,]
#cut the Sample
cut<-c(which(colnames(data)=="Sample"))
cut
data_train=training[,-cut]
data_test=test[,-cut]
# PlotTree

DTree<-rpart(Class~.,data = data_train)
rpart.plot(DTree)
#fancyRpartPlot(DTree)


# Prediction
pred<-predict(DTree ,data_test, type="class")
# Frequency table
table(actual=test[,11],pred)
# Calculate Error Rate 
wrong<-(test[,11]!=pred)
error_rate<-sum(wrong)/length(wrong)
error_rate

# Accuracy Percentage
print(paste0('Accuracy Percentage: ', (1-error_rate)*100))














