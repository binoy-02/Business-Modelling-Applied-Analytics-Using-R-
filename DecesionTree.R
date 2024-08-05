installed.packages("rpart")
library(rpart)
data(iris)
head(iris)
nrow(iris)

#preprocessing
library(caTools)
sp=sample.split(iris,SplitRatio = 0.8)
train_set=subset(iris,sp==TRUE)
test_set=subset(iris,sp==FALSE)

nrow(train_set)
nrow(test_set)

#fit the model
model<- rpart(Species ~ .,data=train_set,method = "class")
model

#prediction
pred<- predict(model,newdata = test_set,type = "class")
pred

#decesion tree
install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(model, main="Decesion tree for Iris dataset")

install.packages("Metrics")
library(Metrics)
accuracy(test_set$Species,pred)

install.packages("caret")
library(caret)
confusionMatrix(table(test_set$Species,pred))

library(rpart)
data("mtcars")

#predicting mpg from all other variables

library(caTools)
sp=sample.split(mtcars,SplitRatio = 0.8)
train_set=subset(mtcars,sp==TRUE)
test_set=subset(mtcars,sp==FALSE)

model<- rpart(mpg ~. , data=train_set)
model

pred<-predict(model,newdata=test_set);
pred

library(rpart.plot)
rpart.plot(model,main="Decesion tree for mtcars dataset")

#print the metrics
library(Metrics)
rmse(test_set$mpg,pred)
mse(test_set$mpg,pred)
mae(test_set$mpg,pred)
summary(model)