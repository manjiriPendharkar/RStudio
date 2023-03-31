#Is there any association between gender and the amount of physical activity?
library(tidyverse)


chiHypothesis <- function(file_name){
  cat("The script is going to read the file", file_name, "and perform chi squared test to see if there is any association between gender and the amount of physical activity.\n\n", sep=" ")
  data <- read.csv(file_name)
  cat("HYPOTHESIS: \n Null hypothesis: The gender and level of physical activity are independent of each other. 
 Alternate hypothesis: The levels of physical activity are dependent on gender\n\n", sep="")
}

chiAssumptions <- function(file_name){
  cat("ASSUMPTIONS:.\n")
  data <- read.csv(file_name)
  sub = table(data$phys, data$gender)
  cat("Expected number of males and females participating in each level of physical activity") 
  chi_test <- chisq.test(sub)
  exp <- chi_test$expected
  print(exp)
}

# Perform the chi squared  test 
chiFit <- function(file_name) {
  data = read_csv(file_name, show_col_types = FALSE)
  sub = table(data$phys, data$gender)
  res <- chisq.test(sub)
  return(res)
}

chiSummary  <- function(test) {
  summary_table = tidy(test)
  x_sq = summary_table$statistic    
  df = summary_table$parameter           
  pvalue = summary_table$p.value
  cat("\n CHI SQUARED TEST SUMMARY REPORT: \n statistics = ", x_sq, " \n degree of freedom = ", df,   
             "\n p-value = ", pvalue)
}


# decision of the test, to reject or not to reject the Null Hypothesis, at 5% significance level
chiDecision <- function(test){
  summary_table = tidy(test)
  p_value = summary_table$p.value
  if(p_value < 0.05 ){
    cat("\n\n DECISION: \n Since the p-value is ", p_value," which is less than 0.05, we reject the null hypothesis.")
  }
  else {
    cat("\n\n DECISION: \n Since the p-value is ", p_value ," which is greater than 0.05, we do not reject the null hypothesis.")
  }
}

#conclusion to the test
chiConclusion <- function(test) {
  summary_table = tidy(test)
  p_value = summary_table$p.value
  if (p_value > 0.05) {
    cat("\n\n CONCLUSION: \n As the p-value is ", p_value ,"\n there is statistically significant evidence that gender and levels of physical activity are independent of each other. Meaning that there exists no association/relationship between the gender and level of physical activity.")
  } else {
    cat("\n\n CONCLUSION: \n As the p-value is ", p_value ,"\n there is statistically significant evidence that gender and levels of physical activity are dependent on each other. Meaning that there is an association between gender and level of physical activity.")
    
  }
}

#prints the entire linear regression report
chiTestsmy<- function(file_name) {
  hypo <- chiHypothesis(file_name)
  #chiAssumptions(file_name)
  test <- chiFit(file_name)
  res <- chiSummary(test)
  dec <- chiDecision(test)
  conc <- chiConclusion(test)
  cat(hypo,"\n\n",res,"\n\n", dec, "\n\n", conc)
}

chiTests<- function(file_name) {
  chiHypothesis(file_name)
  chiAssumptions(file_name)
  test <- chiFit(file_name)
  chiSummary(test)
  chiDecision(test)
  chiConclusion(test)
}

chiTests("project2022.csv")

