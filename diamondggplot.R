library(ggplot2)
data(diamonds)
par(mar = c(5, 4, 4, 2) + 0.1)
plot(1, type = "n", xlim = c(0.5, 5.5), ylim = range(diamonds$price),
     xlab = "Cut", ylab = "Price", main = "Box Plot of Price by Cut Quality with Jitter Points",
     xaxt = "n")
axis(1, at = 1:5, labels = levels(diamonds$cut))
boxplot(price ~ cut, data = diamonds, add = TRUE, at = 1:5, 
        col = "lightgray", border = "black", outline = FALSE)
set.seed(42)
jittered_x <- jitter(as.numeric(diamonds$cut))
points(jittered_x, diamonds$price, pch = 16, col = rgb(0.2, 0.2, 0.8, 0.3))
