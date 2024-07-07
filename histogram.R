# Histogram
library(ggplot2)

data(mtcars)
head(mtcars)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "black") +
  theme_minimal() +
  ggtitle("Histogram of MPG") +
  xlab("Miles Per Gallon") +
  ylab("Count")
