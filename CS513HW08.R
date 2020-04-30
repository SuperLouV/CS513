#  Course          : Data Mining
#  First Name      : Yilin
#  Last Name       : Lou
#  Id              : 10445676
#  HW              : 08 K-Mean Cluster

## remove all objects
rm(list=ls())
dev.off
#read CSV file
setwd("/Users/louyilin/RStudioProjects")
data<-read.csv("wisc_bc_ContinuousVar.csv")
#set.seed(111)
#delete NA
data=na.omit(data)

#                   Kmean
k_mean=kmeans(data[,-c(1,2)],2)
Kmean_table=table(clusters=k_mean$cluster,diagnosis=data[,'diagnosis'])
print('K-mean Table and Plot')
print(Kmean_table)
#picture
plot(data[c(3,4)],col=k_mean$cluster)
points(k_mean$centers,col=1:3,pch=16,cex=2)
#                   h_cluster
h_cluster=hclust(dist(data[,-c(1,2)]),method="average")
#divide into 2 clusters
plot(h_cluster)
rect.hclust(h_cluster, k = 2)
hclust_2<-cutree(h_cluster,2)
hcluster_table=table(clusters=hclust_2,diagnosis=data[,'diagnosis'])
print('hcluster Table and Plot')
print(hcluster_table)


