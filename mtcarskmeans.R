#dataset
data("mtcars")
names(mtcars)
head(mtcars)

#assign this to a dataframe
df<-select(mtcars,c(1:3))




library(factoextra)

#ELBOW TEST : To find optimal number of clusters

fviz_nbclust(df,kmeans,method="wss")

#implement kmeans algm using kmeans
set.seed(123)
#optimal number of clusters=4
km<-kmeans(df,centers=2,nstart=25)


#view result
km
km$cluster
km$centers

#plot reult 1
fviz_cluster(km,df)

#plot reult 1

library(ggfortify)
autoplot(km,df,frame=TRUE)

#mean of each cluster
aggregate(mtcars,by=list(cluster=km$cluster),mean)


