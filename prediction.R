patient <- data.frame(Age=c(45,32,65,47,56),
                      Cholestrol=c(200,270,230,190,150),
                      Disease=c(1,0,1,0,1))
patient

model<-glm(Disease~Age+Cholestrol,data=patient,family = binomial())
model
summary(model)

#prediction
new_data = data.frame(Age=52,Cholestrol=170)
pred<-predict(model,newdata=new_data, type="response")
pred