#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  Project         : Midterm O6


## remove all objects
rm(list=ls())
#load a file
data<-read.csv("COVID19_v3.csv",header = TRUE,na.strings = "?",colClasses = c("MaritalStatus"="factor"))
# Remove the missing values
data<-na.omit(data)

#Discretize the “MonthAtHospital” into “less than 6 months” and “6 or more months”. 
data$MonthAtHospital[data$MonthAtHospital>=6]<-c("6 or more months")
data$MonthAtHospital[data$MonthAtHospital<6]<-c("less than 6 months")

# Also discretize the age into “less than 35”, “35 to 50” and “51 or over”.
data$Age[data$Age<35]<-c("less than 35")
data$Age[data$Age>=35&data$Age<=50]<-c("35 to 50")
data$Age[data$Age>51]<-c("51 or over")

##Use 30% test 70% training
idx<-sort(sample(nrow(data),as.integer(.70*nrow(data))))
train<-data[idx,]
test<-data[-idx,]

train<-train[,-1]
test<-test[,-1]
# PlotTree

DTree<-rpart(Infected~.,data = train)
rpart.plot(DTree)

# Prediction
pred<-predict(DTree ,test, type="class")

# Calculate Error Rate 
right<-(test$Infected==pred)
right_rate<-sum(right)/length(right)

print(paste0('Accuracy Percentage: ', right_rate*100))














