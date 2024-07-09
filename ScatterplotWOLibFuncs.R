data(iris)
species_colors <- c("setosa" = "red", "versicolor" = "green", "virginica" = "blue")
plot(iris$Sepal.Length, iris$Sepal.Width,
     col = species_colors[iris$Species],
     pch = 19, # Use solid circle points
     xlab = "Sepal Length",
     ylab = "Sepal Width",
     main = "Scatter Plot of Sepal Length vs. Sepal Width")
legend("topright",
       legend = levels(iris$Species),
       col = species_colors,
       pch = 19)
