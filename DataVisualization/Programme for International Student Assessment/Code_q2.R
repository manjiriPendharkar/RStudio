# importing the library to read the csv file
library(tidyverse)
library(ggrepel)

# reading the file A1_Ex1.csv in tibble X
df <- read_csv("pisa_2018.csv")
df


# 1.Average reading against average maths for each country

#calculating average math and reading scores grouped by country
q1 <- df %>%
      group_by(country) %>%
      summarise(mean_math = mean(math), mean_read = mean(read))

#plotting average math and reading scores grouped by country
plot1 <- ggplot(data=q1, aes(x = mean_math, y = mean_read, label=country)) +
         geom_point() +
         geom_label_repel(aes(label = country))

#adding title and subtitle
plot1 + ggtitle(label = "Average reading against average maths for each country",
          subtitle = "Australia has room for improvement!")


# 2. Average gender difference (diff = female minus male) per Country

#dataset grouped by gender and country
a <- df %>%
  group_by(country, gender) %>%
  summarise(mean_math = mean(math), mean_read = mean(read), mean_sci = mean(science))

#making the dataset wider taking names from gender and values from mean of read, math, science
b <- a %>%
  pivot_wider(names_from = gender, values_from =c(mean_math,mean_read,mean_sci) )

#calculating the gender mean difference of each subject
c <- b %>%
  mutate(diff_math= mean_math_female - mean_math_male,
         diff_read = mean_read_female - mean_read_male,
         diff_sci = mean_sci_female - mean_sci_male)

#making the dataset longer so that all the subject differences are in one column and on each row
d <- c %>%
  pivot_longer(cols = starts_with("diff"),names_to = "mean_subjects", values_to = 'diff' )

#creating difference column where if difference is greater than 0 then true otherwise false
e <- d %>%
  mutate( difference  = if_else(diff > 0, TRUE, FALSE)) %>%
  select(country, mean_subjects, diff, difference)

#plotting the graph with geom vline to have vertical line in facet wrap
plot2 <- ggplot(data=e, aes(x=diff, y=country, colour=difference)) +
  geom_point() +
  geom_vline(xintercept = 0) +
  facet_wrap(~mean_subjects)

plot2 + scale_colour_discrete(name = "diff > 0") +
  ggtitle(label = "Average gender difference (diff = female minus male) per Country",
          subtitle = "Gender gap in reading is universal, but the math gap is not.")
