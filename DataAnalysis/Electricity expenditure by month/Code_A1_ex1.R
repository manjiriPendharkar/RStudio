# importing the library to read the csv file
library(tidyverse)


# 1. Reading the file A1_Ex1.csv in tibble X
X <- read_csv("data.csv")
X


# 2. Showing the structure of X
str(X)


# 3. Compute and show the total sum of the expenditures
# ans= 200516.9
total_expenditure = sum(X$expenditure)
total_expenditure


# 4. Compute and show the sum of the expenditures in March
# ans= 48107.32
total_March_expenditure = sum(X[(X$month == "Mar"), "expenditure"])
total_March_expenditure


# 5. Compute and show the sum of the expenditures in March when the weather is cloudy
# ans= 12920.14
exp = sum(X[(X$month == "Mar" & X$weather == "cloudy" ), "expenditure"])
exp


# 6. Find and show the month with the highest expenditure
# ans = Jan 399
max_month_exp <- X %>%
  arrange(desc(expenditure)) %>%  #arrange expenditure in descending order
  filter(row_number()==1)         #extract the first row to get the month with the highest expenditure
max_month_exp
max_month_exp$month





