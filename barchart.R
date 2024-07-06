library(ggplot2)
data(mtcars)
head(mtcars)
# Bar Diagram
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar() +
  theme_minimal() +
  ggtitle("Bar Diagram of Cylinders") +
  xlab("Number of Cylinders") +
  ylab("Count")