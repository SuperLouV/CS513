
rm(list=ls())

setwd("/Users/louyilin/RStudioProjects")
#read csv file
bc_data<-read.csv("breast-cancer-wisconsin.data.csv",header = TRUE,na.strings = "?")


#install.packages("kknn")
library(kknn)


bc<-na.omit(bc_data)
View(bc)
##Use 30% test 70% training
idx<-sort(sample(nrow(bc),as.integer(.70*nrow(bc))))
training<-bc[idx,]
test<-bc[-idx,]

?kknn()
## k=3
predict <- kknn(formula=Class~., training, test, k=3,kernel ="rectangular"  )
fit <- fitted(predict)
##table(test$Class,fit)
table(kknn=fit,test$Class)

## k=5
predict <- kknn(formula=Class~., training, test, k=5,kernel ="rectangular"  )
fit <- fitted(predict)
table(kknn=fit,test$Class)

## k=10
predict <- kknn(formula=Class~., training, test, k=10,kernel ="rectangular"  )
fit <- fitted(predict)
table(kknn=fit,test$Class)
