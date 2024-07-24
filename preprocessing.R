df=data.frame(
  id=c(1,2,3,4,5),
  name=c("x","y","z","w","z"),
  age=c(28,41,32,40,21),
  score=c(40,50,60,20,10)
)
install.packages("caTools")
library(caTools)

set.seed(7)
sp <- sample.split(df$age,0.8)
sp
train_set= subset(df,sp==TRUE)
train_set
train_set= subset(df,sp==FALSE)
train_set
scale(df$age,center = TRUE,scale = TRUE)

library(ggplot2)
plot=ggplot(data = df,aes(x=name,y=score,colour = "blue"),shape = score,size = factor(age))+geom_point()

plot+facet_grid(id~.)+facet_grid(.~score)