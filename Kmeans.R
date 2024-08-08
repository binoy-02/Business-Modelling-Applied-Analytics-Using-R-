#dataset
data(USArrests)
names(USArrests)
head(USArrests)

#assign this to a dataframe
df<-USArrests

#remove rows with missing values
df<-na.omit(df)

#scale all column values
df<-scale(df)
head(df)

#install.packages("factoextra")
library(factoextra)

#ELBOW TEST : To find optimal number of clusters

fviz_nbclust(df,kmeans,method="wss")

#implement kmeans algm using kmeans
set.seed(123)
#optimal number of clusters=4
km<-kmeans(df,centers=4,nstart=25)


#view result
km
km$cluster
km$centers

#plot reult 1
fviz_cluster(km,df)

#plot reult 1
#install.packages("ggfortify")
library(ggfortify)
autoplot(km,df,frame=TRUE)

#mean of each cluster
aggregate(USArrests,by=list(cluster=km$cluster),mean)


