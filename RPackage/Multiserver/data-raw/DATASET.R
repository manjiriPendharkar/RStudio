## code to prepare `DATASET` dataset goes here

library(tidyverse)

bank <- readr::read_csv("data-raw/bank.csv")

usethis::use_data(bank, overwrite = TRUE)
