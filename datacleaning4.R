df1<- data.frame(name=c("Binoy","Athulya","Anusree"),
                 age=c(21,23,NA),
                 gender=c("m","f","f")
                 )
is.na(df1)

meandf<-mean(df1$age,na.rm=TRUE)
meandf

library(Hmisc)
impute(df1$age,meandf)

df2=data.frame(
  id=c(1,2,3,4,5),
  name=c("x","y","z","w","z"),
  age=c(28,41,32,40,21),
  score=c(40,50,60,20,10)
)

library(dplyr)
new=df2 %>% select(id)
new
new1=df2 %>% select(name,age)
new1

filter_data= df2 %>% filter(age>25)
filter_data

arranged_data = df2 %>% arrange(name)
arranged_data

filter_data1 = df2 %>% filter(age>25) %>% arrange(name) %>% select(name,age)
filter_data1

part1= select(df2,starts_with("ag"))
part1
part2= select(df2,-starts_with("ag"))
part2
part3= select(df2,contains("ag"))
part4
part4= select(df2,matches("ag"))
part4

add1= mutate(df2,ag_sc=age+score)
print(add1)
add2= transmute(df2,ag_sc=age+score)
print(add2)

summarise(df2,mean1=mean(age))

slice_df = slice(df2,c(2,3))
slice_df

slice_df = slice(df2,c(2:3))
slice_df

df<- slice(df2,-2)
df
df<- slice(df2,c(-2,-4))
df

install.packages("caTools")