file_data=scan("D:/Binoy/R/sample.txt",what = 'character')

file_data

file=scan(file.choose(),what='character')

d=read.csv("D:/Binoy/R/Book1.csv")

df=read.table(file ="D:/Binoy/R/Book1.csv",header=TRUE,sep=",")

install.packages("readr")
library(readr)
mydata1=read_tsv(file ="D:/Binoy/R/Book1.txt",col_names=FALSE)
print(mydata1)


mydata2=read.delim("https://www.geeksforgeeks.org/how-to-import-tsv-files-into-r/")
print(head(mydata2))

#saving file

#save(list=mylist,file='filename')
#extension=.Rdata