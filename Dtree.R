# Zero clearing
rm(list=ls())

# Step 1 load the data without removing missting data
Dtree <- read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?")

# install.packages
library(rpart)
library(rpart.plot)  
library(rattle)           
library(RColorBrewer)

# Factorize 
Dtree$Class<-factor(Dtree$Class,levels = c(2,4),labels=c("benign","malignant"))
print(summary(Dtree))

# Split into training and testing datasets
index <- sort(sample(nrow(Dtree),as.integer(.6*nrow(Dtree))))
training<-Dtree[-index,]
testing<-Dtree[index,]
removeCol<-c(which(colnames(Dtree)=="Sample"))

#View(Dtree)

# PlotTree
DTree<-rpart(Class~.,data=training[,-removeCol])
fancyRpartPlot(DTree)

# Prediction
pred<-predict(DTree ,testing[,-removeCol], type="class")

# Frequency table
table(actual=testing[,11],pred)
#View(table(actual=testing[,11],pred))

# Calculate Error Rate 
wrong<-(testing[,11]!=pred)
error_rate<-sum(wrong)/length(wrong)
error_rate

# Accuracy Percentage
print(paste0('Accuracy Percentage: ', (1-error_rate)*100))


