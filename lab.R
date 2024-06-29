#fibonacci
n=10
fib=numeric(n)
fib[1]=0
if(n>1){
  fib[2]=1
}
for(i in 3:n){
  fib[i]=fib[i-1]+fib[i-2]
}
print(fib)

#string
s1="My"
s2="name"
s3="is"
s4="Binoy"
s5="Jolly"
newstring=paste(s1,s2,s3,s4,s5)
print(newstring)
nchar(newstring)

#multiplication
a=4
range=1:10
for (i in range) {
  result=a*i
  print(paste(a,"*",i,"=",result))
}