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

inspect(rules)

Beer_rules_rhs<-apriori(trans,parameter = list(supp=0.3,conf=0.5,maxlen=10,minlen=2),appearance=list(lhs="beer",default="rhs"))

inspect(Beer_rules_rhs)


#visualization

#1,.scatterplot
library(arulesViz)
plot(rules)
plot(rules,measure="confidence")
plot(rules,method="two-key plot")

#2.interactive scatter plot
#install.packages("plotly")
library(plotly)
plot(rules,engine="plotly")

#3.Graph based visualization
#install.packages("htmlwidgets")
library(htmlwidgets)
subrules=head(rules,n=10,by="confidence")
plot(subrules,method="graph",engine="htmlwidgets")

#4, parallel cordinate plot
plot(subrules,method="paracoord")