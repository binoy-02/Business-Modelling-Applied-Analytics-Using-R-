my_df<-data.frame(
  name=c("A","B","C"),
  age=c(20,23,NA),
  rollno=c(1,2,NA)
)

is.na(my_df)

#acess only a particular column
mean(my_df$age)

mean(my_df$age,na.rm = TRUE)

sum(is.na(my_df)) #count of columns having missing values

sum(!is.na(my_df)) #count of columns not having missing values

install.packages("Hmisc")
library(Hmisc)

impute(my_df$age,mean)

#apply a function to df columnwise

df_cleaned <- as.data.frame(lapply(my_df,function(x)
  impute(x,mean)))
df_cleaned

colnames(my_df)
names(my_df)

paste0("col",1:ncol(my_df))

my_df1 <- data.frame(
  name=c("A","B","C"),
  age=c(20,21,NA),
  ROLL_NO=c(1,2,"")
)

my_df1[my_df1 ==""]<- NA
my_df1
rbind(my_df1,c(NA,NA,NA))

my_df1<- my_df1[rowSums(is.na(my_df1))!=ncol(my_df1),]

df2 <- data.frame(
  id = c(1,2,3),
  math = c(80,85,90),
  science=c(75,88,95)
)

library(tidyr)

long<- gather(df2,key = "subject",value="score")
long

short<-spread(df2,key = "subject",value="score")

namedf<- data.frame(
  id=c(1,2),
  full_name=c("John Smith","James Augustine")
)

separate(namedf,full_name,
         into = c("first_name","last_name"),sep=" ")

unite(namedf,col="full_name",
      c("first_name","last_name"), sep = " ")