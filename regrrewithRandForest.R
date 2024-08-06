#regression with randomForest

library(randomForest)
data(mtcars)

#preprocessing
library(caTools)
SP = sample.split(mtcars,SplitRatio = 0.8)
train = subset(mtcars,sp==TRUE)
test= subset(mtcars, sp==FALSE)

#fit the model
set.seed(123)
model<- randomForest(mpg ~.,data = train,ntree=100)
model

pred<- predict(model,newdata = test)
pred

importance(model)
varImpPlot(model)

#print Metrics using library Metrics
library(Metrics)
rmse(test$mpg,pred)
mae(test$mpg,pred)
mse(test$mpg,pred)

head(data.frame(Actualvalues = test$mpg,Predictions=pred))