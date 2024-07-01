
x=1:10
?plot(x)
#case sensitive language

a=10
A=10
#variables in R
var_name<-10 #allowed
var.name<-20 #allowed
.varname<-19 #allowed
var5=20 #allowed
_var_name=20 #not allowed
2var_name #not allowed

#aasignment of variable

var1<-10
var2=20
20->var3

print(var1)

cat(var1," ",var2,"\n",var3)

#TYPE CONVERSIONS

num1<- as.numeric(12L)
num1
num2<- as.numeric(15+7i)
num2
num3<- as.numeric(TRUE)
num3
num4<-as.numeric("Hello")
num4
num4<-as.numeric("12345")
num4

int1<- as.integer(12.345)
int1
int2<- as.integer(12+6i)
int2
int3<- as.integer(TRUE)
int3
int4<- as.integer("1234")
int4
int5<-as.integer("12gfr")
int5

comp1<- as.complex(12.345)
comp1
comp2<- as.complex((TRUE))
comp2
comp3<-as.complex("1234")
comp3
comp4<-as.complex(12L)
comp4
comp5<-as.complex("we32")
comp5

logi1<- as.logical(12.345)
logi1
logi2<- as.logical(0)
logi2
logi3<-as.logical("1234")
logi3
logi4<-as.logical(12L)
logi4
logi5<-as.logical("we32")
logi5
logi6<- as.logical(12+6i)
logi6

char1<- as.character(12.345)
char1
char2<- as.character(0)
char2
char3<-as.character(12+6i)
char3
char4<-as.character(12L)
char4
char5<-as.character("we32")
char5
char5<-as.character(TRUE)
char5

#OPERATORS

#Arithmetic + - * / %% %/% ^
 < > == != <= >= 
#Logical & ! |  && ||
#Assignment = <- -> <<- ->>

#Arithmetic
a<-7.4
b<-3

print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a%%b) #reminder
print(a%/%b) #Quotient
print(a^b)


c1<-c(2,4,5)
c2<-c(3,7,9)

print(c1+c2)
print(c1-c2)
print(c1*c2)
print(c1/c2)
print(c1%%c2) 
print(c1%/%c2) 
print(c1^c2)      

#Relational
print(a<b)
print(a>b)
print(a==b)
print(a!=b)
print(a<=b) 
print(a>=b) 

print(c1<c2)
print(c1>c2)
print(c1==c2)
print(c1!=c2)
print(c1<=c2) 
print(c1>=c2) 

#Relational
d<-c(3.5,TRUE,3+6i)
e<-c(4.5,TRUE,2+6i)

print(d&e)
print(d|e)
print(d||e)
print(d&&e)
print(!e)
