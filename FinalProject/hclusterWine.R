#  Group           : Wine Quality
#  HW              : Final Project
#  Algorithm       : HCluster


## remove all objects
rm(list=ls())
dev.off
#read CSV
setwd("/Users/louyilin/RStudioProjects/FinalProject")
hData<-read.csv("winequalityN.csv",header = TRUE,na.strings = "?")

#  clean NA datas
hData=na.omit(hData)
hData$type <- as.numeric(hData$type, levels = c("white", "red"), labels = c("1","2"))
hCluster=hclust(dist(hData[,-c(13)]),method="average")
#divide into 2 clusters
plot(hCluster)
rect.hclust(hCluster, k = 6)
hClustCut<-cutree(hCluster,7)
hClusterTable=table(clusters=hClustCut,quality=hData[,'quality'])
print('hcluster Table and Plot')
print(hClusterTable)





