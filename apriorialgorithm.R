#install.packages("tidyverse")
library(tidyverse)

#create a list of transactions

market_basket<-list(
  c("apple","beer","rice","meat"),
  c("apple","beer","rice"),
  c("apple","beer"),
  c("apple","rice"),
  c("apple","beer","rice"),
  c("apple","beer"),
  c("milk","beer","rice","meat"),
  c("milk","beer")
  )

#print
market_basket

#set transaction names to T1 to T8
names(market_basket)<-paste('T',c(1:8),sep = "")

#print the names
names(market_basket)

#install.packages("arules")
#install.packages("arulesViz")

library(arules)
library(arulesViz)

trans<-as(market_basket,"transactions")
trans
dim(trans)

itemLabels(trans)

summary(trans)
image(trans)

itemFrequencyPlot(trans,topN=10)

#IMPLEMENT APRIORI ALG...

rules<-apriori(trans,parameter = list(supp=0.3,conf=.5,maxlen=10,target="rules"))
summary(rules)



