#create a dataframe
data <- data.frame(x1 = c(1:4, 99999, 1, NA, 1, 1, NA),   # Create example data frame
                   x1 = c(1:5, 1, "NA", 1, 1, "NA"),
                   x1 = c(letters[c(1:3)], "x  x",  "x", "   y    y y", "x", "a", "a", NA),
                   x4 = "",
                   x5 = NA)
data  

#clean the column names of a data frame
#Print column names
colnames(data)  
#change these column names to a consecutive range with the prefix “col” => apply the colnames, paste0, and ncol functions
colnames(data) <- paste0("col", 1:ncol(data)) 
data
#format missing values (NA)
#some missing values are also represented by blank character strings
data[data == ""] # Print blank data cells
data[data == ""] <- NA # Replace blanks by NA
data
#Another typical problem with missing values: NA values are formatted as the character string “NA”
data$col2 # Print column2
# NA values are formatted as characters instead of real NA values
data$col2[data$col2 == "NA"] <- NA  # Replace character "NA"
data #converted all empty characters “” and all character “NA” to true missing values
#Remove Empty Rows & Columns
data <- data[rowSums(is.na(data)) != ncol(data), ]        # Drop empty rows
data                                                      # Print updated data frame
#Row 10 is removed since it has all NA values
data <- data[ , colSums(is.na(data)) != nrow(data)]       # Drop empty columns
data                                                      # Print updated data frame
#column 4 and 5 removed

#Remove Rows with Missing Values: delete all rows with at least one NA value.
#Our data still contains some NA values in the 7th row of the data frame
#This method is called listwise deletion or complete cases analysis
data <- na.omit(data)                                     # Delete rows with missing values 
data      

#Remove Duplicates
data <- unique(data)                                      # Exclude duplicates
data  

#Modify Classes of Columns
#format each column to the most appropriate data type automatically
sapply(data, class)                                       # Print classes of all columns
#use the type.convert function to change the column classes whenever it is appropriate
data <- type.convert(data, as.is = TRUE)
data 
sapply(data, class)

#Detect & Remove Outliers
data$col1[data$col1 %in% boxplot.stats(data$col1)$out]    # Identify outliers in column 1
# returned one outlier (i.e. the value 99999). This value is obviously much higher than the other values in this column.
data <- data[! data$col1 %in% boxplot.stats(data$col1)$out, ]  # Remove rows with outliers
data 

#Remove Spaces in Character Strings
#avoid blank spaces in the character strings of a certain variable
data$col3 <- gsub(" ", "", data$col3)           # Delete white space in character strings
data

#Combine Categories
#merge certain categories of a categorical variable: group the categories “a”, “b”, and “c” in a single category “a”.
data$col3[data$col3 %in% c("b", "c")] <- "a"              # Merge categories
data 