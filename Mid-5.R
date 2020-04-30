#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  Project         : Midterm O5


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

#naive-bayes
nb=naiveBayes(Infected~., data=train)
category_nb<-predict(nb,test )
#table
table(NBayes=category_nb,Infected=test$Infected)


NB_right<-sum(category_nb==test$Infected)
#coubt error rate
NB_right_rate<-NB_right/length(category_nb)
print(paste0('Accuracy Percentage: ', NB_right_rate*100))




