# Pie Chart
library(ggplot2)
data(mtcars)
head(mtcars)

cyl_count <- table(mtcars$cyl)

cyl_labels <- paste(names(cyl_count), "\n", cyl_count, sep="")

pie(cyl_count, labels = cyl_labels, main ="Pie Chart of Cylinders", col = rainbow(length(cyl_count)))
