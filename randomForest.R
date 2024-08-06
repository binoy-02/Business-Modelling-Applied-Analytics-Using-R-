install.packages("randomForest")
library(randomForest)

#preprocessing
head(iris)
library(caTools)
sp=sample.split(iris,SplitRatio = 0.8)
train_set=subset(iris,sp==TRUE)
test_set=subset(iris,sp==FALSE)

#fit the model
set.seed(123)
rf_model<- randomForest(Species ~., data = train_set,nTree=100)
rf_model

pred<-predict(rf_model,newdata = test_set,type = "class")
pred

plot(rf_model)
importance(rf_model)
varImpPlot(rf_model)

