#mtcars(motor trend car road test) comprise fuel consumption and 10 aspects of automobile design and performance for 32 automobiles
#come pre-installed with dplyr package in R

# Print the top 5 records of the dataset
head(mtcars)

# Installing the package
install.packages("dplyr")

# Loading package
library(dplyr)

# Summary of dataset in package
summary(mtcars)
names(mtcars)#print column names

#visualizations on mtcars dataset which includes 32 car brands and 11 attributes using ggplot2 layers

#1. Data Layer:define the source of the information to be visualize, let’s use the mtcars dataset in the ggplot2 package

library(ggplot2)
library(dplyr)

ggplot(data = mtcars) + labs(title = "MTCars Data Plot") #Specify the dataset and title 
#labs() function is used to customize the labels of your plot: title, subtitle, caption etc.


#2. Aesthetic Layer:ggplot2 in R Here we will display and map dataset into certain aesthetics.
ggplot(data = mtcars, aes(x = hp, y = mpg))+ labs(title = "MTCars Data Plot")

#3. Geometric layer:ggplot2 in R geometric layer control the essential elements, see how our data being displayed using point, line, histogram, bar, boxplot
ggplot(data = mtcars, aes(x = hp, y = mpg, col = disp)) +
  geom_point() +
  labs(title = "Miles per Gallon vs Horsepower",
       x = "Horsepower",
       y = "Miles per Gallon")
#geom_point() is a function used to add points (or dots) to a plot.

#Adding Size, color, and shape and then plotting the Histogram plot
# Adding size
ggplot(data = mtcars, aes(x = hp, y = mpg, size = disp)) +
  geom_point() +
  labs(title = "Miles per Gallon vs Horsepower",
       x = "Horsepower",
       y = "Miles per Gallon")

# Adding shape and color
ggplot(data = mtcars, aes(x = hp, y = mpg, col = factor(cyl),
                          shape = factor(am))) +geom_point() +
  labs(title = "Miles per Gallon vs Horsepower",
       x = "Horsepower",
       y = "Miles per Gallon")
#convert unique values of cyl into a factor
#using first length(cyl) colors from color palette

# Histogram plot
ggplot(data = mtcars, aes(x = hp)) +
  geom_histogram(binwidth = 5) +
  labs(title = "Histogram of Horsepower",
       x = "Horsepower",
       y = "Count")

#4. Facet layer:
#split the data up into subsets of the entire dataset and it allows the subsets to be visualized on the same plot. 
#Here we separate rows according to transmission type and Separate columns according to cylinders.

# Separate rows according to transmission type
p <- ggplot(data = mtcars, aes(x = hp, y = mpg, shape = factor(cyl))) + geom_point()

p + facet_grid(am ~ .) +
  labs(title = "Miles per Gallon vs Horsepower",
       x = "Horsepower",
       y = "Miles per Gallon")

# Separate columns according to cylinders
p <- ggplot(data = mtcars, aes(x = hp, y = mpg, shape = factor(cyl))) + geom_point()

p + facet_grid(. ~ cyl) +
  labs(title = "Miles per Gallon vs Horsepower",
       x = "Horsepower",
       y = "Miles per Gallon")

# 5. Statistics layer:
#transform our data using binning, smoothing, descriptive, intermediate

#fit and display a linear model
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  stat_smooth(method = lm, col = "red") +
  labs(title = "Miles per Gallon vs Horsepower")

#6. Coordinates layer:
#data coordinates are mapped together to the mentioned plane of the graphic
#we adjust the axis and changes the spacing of displayed data with Control plot dimensions
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  stat_smooth(method = lm, col = "red") +
  scale_y_continuous("Miles per Gallon", limits = c(2, 35), expand = c(0, 0)) +
  scale_x_continuous("Weight", limits = c(0, 25), expand = c(0, 0)) +
  coord_equal() +
  labs(title = "Miles per Gallon vs Weight",
       x = "Weight",
       y = "Miles per Gallon")
#scale_y_continuous() function is used to customize the y-axis in a plot
#scale_x_continuous() function is used to customize the x-axis of a plot
#coord_equal() function is used to ensure that the units along the x and y axes are equal, making one unit on the x-axis the same length as one unit on the y-axis. 


#Coord_cartesian() to proper zoom in:
# Add coord_cartesian() to proper zoom in
ggplot(data = mtcars, aes(x = wt, y = hp, col = am)) +
  geom_point() + geom_smooth() +
  coord_cartesian(xlim = c(3, 6))
#coord_cartesian() function is used to zoom in on a specific region of the plot without affecting the underlying data.
# setting the limits of the x-axis to the range between 3 and 6. This function will only display the data within this specified range on the x-axis, effectively "zooming in" on that portion of the plot.


#7. Theme Layer:
#controls the finer points of display like the font size and background color properties.

#Example 1: Theme layer – element_rect() function
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  facet_grid(. ~ cyl) +
  theme(plot.background = element_rect(fill = "blue", colour = "gray")) +
  labs(title = "Miles per Gallon vs Horsepower")

#Example 2
ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point() + facet_grid(am ~ cyl) + 
  theme_gray()+
  labs(title = "Miles per Gallon vs Horsepower")
#theme_gray(): provides a gray background with white grid lines, 


#Contour plot for the mtcars dataset
# Create a 2D density contour plot for the mtcars dataset
ggplot(mtcars, aes(x = wt, y = mpg)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", color = "white") +
  scale_fill_viridis_c() + 
  labs(title = "2D Density Contour Plot of mtcars Dataset",
       x = "Weight (wt)",
       y = "Miles per Gallon (mpg)",
       fill = "Density") +
  theme_minimal()
#A contour plot is a graphical representation used to show the three-dimensional surface of a function in two dimensions.
#stat_density_2d() function is used to create two-dimensional density plots. 
#fill = ..level..: Maps the fill color of the polygons to the density levels. Areas with higher density (more points) will typically have a darker fill color.
#geom = "polygon": Specifies the type of geometry to use for plotting. Here, "polygon" indicates that filled polygons should be used to represent the density contours.
#color = "white": This parameter sets the color of the polygon borders (outlines) to white. 
# theme_minimal() is one of the built-in theme functions that modifies the appearance of a plot to create a minimalistic design. 

#Creating a panel of different plots
install.packages("gridExtra")
library(gridExtra)

# Selecting specific columns from mtcars dataset
selected_cols <- c("mpg", "disp", "hp", "drat")
selected_data <- mtcars[, selected_cols]

# Create histograms for individual variables
hist_plot_mpg <- ggplot(selected_data, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "white") +
  labs(title = "Histogram: Miles per Gallon", x = "Miles per Gallon", y = "Frequency")

hist_plot_disp <- ggplot(selected_data, aes(x = disp)) +
  geom_histogram(binwidth = 50, fill = "red", color = "white") +
  labs(title = "Histogram: Displacement", x = "Displacement", y = "Frequency")

hist_plot_hp <- ggplot(selected_data, aes(x = hp)) +
  geom_histogram(binwidth = 20, fill = "green", color = "white") +
  labs(title = "Histogram: Horsepower", x = "Horsepower", y = "Frequency")

hist_plot_drat <- ggplot(selected_data, aes(x = drat)) +
  geom_histogram(binwidth = 0.5, fill = "orange", color = "white") +
  labs(title = "Histogram: Drat", x = "Drat", y = "Frequency")

# Arrange the plots in a grid
grid.arrange(hist_plot_mpg, hist_plot_disp, hist_plot_hp, hist_plot_drat,
             ncol = 2)


#Save and extract R plots:
# Create a plot
plot <- ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  labs(title = "Miles per Gallon vs Horsepower")

# Save the plot as an image file (e.g., PNG)
ggsave("plot.png", plot)

# Save the plot as a PDF file
ggsave("plot.pdf", plot)

# Extract the plot as a variable for further use
extracted_plot <- plot
plot

#ggsave() function in ggplot2 to save a plot as an image file, the file is saved in the current working directory by default. 
#The current working directory is the folder in your file system where R is currently operating.
#getwd() for getting current working directory