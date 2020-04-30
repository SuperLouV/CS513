# Zero clearing
rm(list=ls())

# Step 1 load the data without removing missting data
C50 <- read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?")
View(C50)
# install.packages
library(rpart)
library(rpart.plot)  
library(rattle)           
library(RColorBrewer)
library('C50')

# Factorize 
C50$Class<-factor(C50$Class,levels = c(2,4),labels=c("benign","malignant"))
print(summary(C50))

# Split into training and testing datasets
index <- sort(sample(nrow(C50),as.integer(.80*nrow(C50))))
training<-C50[-index,]
testing<-C50[index,]
removeCol<-c(which(colnames(C50)=="Sample"))


# PlotTree
C50<-C5.0(Class~.,data=training[,-removeCol])
plot(C50)

# Prediction
pred<-predict(C50 ,testing[,-removeCol], type="class")

# Frequency table
table(actual=testing[,11],pred)
#View(table(actual=testing[,11],pred))

# Calculate Error Rate 
wrong<-(testing[,11]!=pred)
error_rate<-sum(wrong)/length(wrong)
error_rate

# Accuracy Percentage
print(paste0('Accuracy Percentage: ', (1-error_rate)*100))