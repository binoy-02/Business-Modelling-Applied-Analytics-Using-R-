# Boxplot
library(ggplot2)

data(mtcars)
head(mtcars)
ggplot(mtcars, aes(x = factor(cyl), y = hp)) +
  geom_boxplot() +
  theme_minimal() +
  ggtitle("Boxplot of Horsepower by Cylinders") +
  xlab("Number of Cylinders") +
  ylab("Horsepower")

