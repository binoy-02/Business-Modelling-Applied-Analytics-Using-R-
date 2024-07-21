# Load the tidyverse package
library(tidyverse)

# Create a sample data frame
df <- tibble(
  age = c(25, 30, 35, NA, 40),
  salary = c(50000, 60000, NA, 80000, 90000)
)

# View the original data frame
print("Original Data Frame:")
print(df)

# Dropping rows with any missing values
df_dropped <- df %>% drop_na()

# Imputing missing values with the mean
df_imputed <- df %>%
  mutate(
    age = ifelse(is.na(age), mean(age, na.rm = TRUE), age),
    salary = ifelse(is.na(salary), mean(salary, na.rm = TRUE), salary)
  )

print("After Dropping Missing Values:")
print(df_dropped)

print("After Imputing Missing Values:")
print(df_imputed)


# Binning the 'age' column into categories
df <- df %>%
  mutate(age_group = cut(age, breaks = c(0, 20, 30, 40, 50), labels = c('0-20', '21-30', '31-40', '41-50')))

print("After Binning Age:\n")
print(df)

# Encoding the 'age_group' column
df <- df %>%
  mutate(age_group_encoded = as.numeric(factor(age_group)))

print("After Encoding Age Group:\n")
print(df)