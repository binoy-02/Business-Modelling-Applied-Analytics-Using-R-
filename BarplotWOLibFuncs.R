data(mtcars)
car_brands <- sapply(strsplit(rownames(mtcars), " "), `[`, 1)
brand_table <- table(car_brands)
barplot(brand_table,
        main = "Frequency of Different Car Brands in mtcars Dataset",
        xlab = "Car Brand",
        ylab = "Frequency",
        col = "blue",
        las = 2,         
        cex.names = 0.8)  
