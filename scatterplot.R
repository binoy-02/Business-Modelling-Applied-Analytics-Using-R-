# Scatter Plot
library(ggplot2)

data(mtcars)
head(mtcars)
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point() +
  theme_minimal() +
  ggtitle("Scatter Plot of Weight vs MPG") +
  xlab("Weight (1000 lbs)") +
  ylab("Miles Per Gallon") +
  labs(color = "Number of Gears")
