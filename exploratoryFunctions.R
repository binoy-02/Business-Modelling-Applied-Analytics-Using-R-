#exploratory functions

d=read.csv("D:/Binoy/R/Housing.csv") #reading data

View(d) #viewing data

names(d) #viewing names of variable

dim(d)  #dimension

summary(d)

str(d) #structure of data

class(d) #type of Data

head(d,n=5) #show the first 5 row

tail(d,n=5)  #show the last 5 row

#####################################################
##installing and importing packages for exploratory##
#####################################################

# install.packages("Hmisc")
# install.packages("pastecs")
# install.packages("psych")
# library(Hmisc)
# library(pastecs)
# library(psych)


#exploratory function to cover summary and structure of data

describe(d)

stat.desc(d)

stat.desc(d$price)


round(cor(d[c('price','bedrooms','bathrooms')]),2)

sapply(d,function(x)sum(is.na(x)))

