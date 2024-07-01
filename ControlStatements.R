x<-25
if(is.integer(x)){
  print("X is an integer")
}else{
  print("X is not an integer")
}

y<-c("Hello","Welcome","To","R","Tutorial")
if("R" %in% y){
  print("word present in vector")
  
}else{
  print("Word Not present in vector")
}

marks<-63
if(marks>75){
  print("first class")
  }else if(marks>45){
  print("Pass")
}else if(marks<45){
  print("Fail")
}


#Switch case

switch1<- switch (1,
  "Binoy",
  "Henoy",
  "Shenoy"
  
)
print(switch1)

obj<-"5"
switch2 <- switch (obj,
  "4" = "Binoy",
  "5"="Henoy",
  "6"="Shenoy"
)

print(switch2)