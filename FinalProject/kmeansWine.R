#  Group           : Wine Quality
#  HW              : Final Project
#  Algorithm       : K-means





## remove all objects
rm(list=ls())
dev.off
#read CSV
setwd("/Users/louyilin/RStudioProjects/FinalProject")
knnData<-read.csv("winequalityN.csv",header = TRUE,na.strings = "?")

#  clean NA datas
knnData=na.omit(knnData)
knnData$type <- as.numeric(knnData$type, levels = c("white", "red"), labels = c("1","2"))

kMean=kmeans(knnData[,-c(13)],3)
plot(knnData[c(3,8)],col=kMean$cluster)
points(kMean$centers,col=1:3,pch=16,cex=2)

kMeanTable=table(clusters=kMean$cluster,quality=knnData[,'quality'])
print(kMeanTable)






