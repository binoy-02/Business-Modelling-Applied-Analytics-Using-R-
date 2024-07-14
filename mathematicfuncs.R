#Defining vectors

x=c(3,7,5,13,46,35,32,45,76,83,15,35,96,43)
print(mean(x))

#print gerometric mean

print(prod(x)^(1/length(x)))

#Harmonic mean

print(1/mean(1/x))

#median

median(x,na.rm = FALSE)

#generating frequency table
y=table(x)

#Printing frequency table
print(y)

#mode x

m=names(y)[which(y == max(y))]

#print mode

print(m)

#mode another method

install.packages("modest")
library(modest)
mode=mfv(d$price) #error
print(mode)

mode=function(){
  return(sort(-table(d$price))[1])
}

mode()

#range() function o/p
print(range(x))
print(max(x)-min(x))

#mean deviation

md=sum(abs(x-mean(x)))/length(x)
print(md)

#Inter Quartile Range
print(IQR(x))

print(QR(d$price))
print(quantile(data$price,0.2)) #20%quantile

