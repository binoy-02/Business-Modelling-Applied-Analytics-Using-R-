install.packages("tidyverse")

# load the tidyr package 
library(tidyr) 

n = 10 
# creating a data frame 
tidy_dataframe = data.frame( 
  S.No = c(1:n),  
  Group.1 = c(23, 345, 76, 212, 88,  
              199, 72, 35, 90, 265), 
  Group.2 = c(117, 89, 66, 334, 90,  
              101, 178, 233, 45, 200), 
  Group.3 = c(29, 101, 239, 289, 176, 
              320, 89, 109, 199, 56)) 
tidy_dataframe

# using gather() function on tidy_dataframe 
long <- gather(tidy_dataframe,Group,Frequency,Group.1:Group.3) 
long


#We can say that the long datasets created using gather() is appropriate for use
#but we can break down Group variable even further using separate()

library(tidyr) #load the package for running each session
# use separate() function to make datseparate_data wider 
separate_data <- separate(long,Group,c("Allotment","Number"))
separate_data

library(tidyr)
#Unite is the compliment of separate. 
#To undo separate(), we can use unite(), which merges two variables into one. 
#Here we will merge two columns Allotment and Number with a separator “.”. 
unite_data <- unite(separate_data , Group, Allotment, Number, sep = ".") 
# print the new data frame 
unite_data

#We can transform the data from long back to wide with the spread() function. 
library(tidyr)
back_to_wide <- spread(unite_data, Group, Frequency) 

# print the new data frame 
back_to_wide 

# Let’s try to nest Group.1 column from the tidy_dataframe we created in the data set
# import tidyr package 
library(tidyr) 
df <- tidy_dataframe 
# nest column Group.1 in tidy_dataframe using nest() 
nest(df,data = c(Group.1))

#We will try to nest and unnest Species column in the iris dataframe in the tidyr package
# import the tidyr package 
library(tidyr) 

df <- iris 
names(iris) 

# nesting the species column in  
# the df data frame using nest() 
head(nest(df, data = c(Species)))  # Output (i) 

# unnesting the species column  
# in the df data frame using unnest() 
head(unnest(df,Species,.drop = NA, .preserve = NULL)) # Output (ii)

# import the tidyr package 
library(tidyr)
df <- data.frame(Month = 1:6,  
                 Year = c(2000, rep(NA, 5))) 

# print the df data frame 
df        # Output (i) 

# use fill() to fill missing values in  
# Year column in df data frame 
fill(df,Year)    # Output (ii)



# import the tidyr package 
library(tidyr) 
# creating a numeric vector 
num_vec <- c(1, 7, 9, 14, 19, 20) 

# use full_seq() to fill missing values in num_vec 
full_seq(num_vec, 1)


# import tidyr package 
library(tidyr) 

# create a tibble df with missing values 
df <- tibble(S.No = c(1:10), 
             Name = c('John', 'Smith', 'Peter', 
                      'Luke', 'King', rep(NA, 5))) 

# print df tibble 
df                    # Output (i) 

# use drop_na() to drop rows 
# in df with missing values  
drop_na(df, Name)  # Output (ii)

# import tidyr package 
library(tidyr) 

# use replace_na() to replace missing values or na 
replace_na(df,list(Name = 'Henry')) # Output (ii)


#Updated versions of functions, older functions no longer under active development
#Can handle multiple columns

#create a data frame
fruits <- data.frame(
  day = c(1:2),
  apple = c(5, 6),
  kiwi = c(8, 10),
  orange = c(2, 3),
  strawberry = c(7, 2)
)
print(fruits)

#pivot_longer()
long <- pivot_longer(fruits, cols = c(apple, kiwi, orange, strawberry),
                     names_to = 'fruit', values_to = 'count')
print(long)

#pivot_wider()
wide <- pivot_wider(long, names_from = fruit, values_from = count)
print(wide)

#seperate_rows()
#create another dataframe
remv<-data.frame(
  day=c(1:4),
  fruit=c("apple","apple","kiwi","kiwi"),
  count=c(5,6,8,10)
)
remv

#add a new row
remv[nrow(remv) + 1,] <- c("3", "apple, kiwi", "3,5")
print(remv)

#use the seperate_rows() functions to split the data row having multiple values
seprt<-separate_rows(remv, fruit, count)
print(seprt)

#complete() : implicit missing value into explicit missing value
comp <- complete(remv, fruit,count)
print(comp)

#crossing() : create a new data frame that represents all possible combinations of variables
fruits <- data.frame(
  day = c(1:2),
  apple = c(5, 6),
  kiwi = c(8, 10),
  orange = c(2, 3),
  strawberry = c(7, 2)
)
fruits
#split fruits into df1 and df2
df1<-fruits[1, ]
df2<-fruits[2,]
colnames(df1) <- c('day_df1','apple_df1','kiwi_df1','orange_df1','strawberry_df1')
colnames(df2) <- c('day_df2','apple_df2','kiwi_df2','orange_df2','strawberry_df2')
print(df1)
print(df2)

cross <- crossing(df1, df2)
print(cross)