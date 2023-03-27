library(tidyverse)
library(broom)


# States the file name, null and alternative hypothesis
hypothesis <- function(file_name) {
  data = read_csv(file_name,  show_col_types = FALSE)
  glue::glue("The following dataset is ", file_name," \n Null hypothesis is H0 : β = 0 \n Alternative hypothesis is H1 : β != 0" )
}


# Plots linear model assumptions : three graphs
assumptions <- function(file_name) {
  data = read_csv(file_name,  show_col_types = FALSE)
  lm_model=lm(Y~X,data=data)
  par(mfrow = c(3, 1))
  plot(data$X, data$Y, main = 'scatterplot', xlab = 'X', ylab='Y')
  plot(lm_model$fitted,lm_model$residuals, main = 'scatterplot', xlab = 'fitted values', ylab='residual values')
  hist(lm_model$residuals, main="histogram of residuals")
}


# fitting the linear model
fit <- function(file_name) {
  data = read_csv(file_name,  show_col_types = FALSE)
  lm_model=lm(Y~X,data=data)
  return(lm_model)
}


#prints the linear model summary
lm_summary <- function(fit) {
  summary_table = tidy(fit)
  intercept = summary_table$estimate[1]  #intercept
  slope = summary_table$estimate[2]      #slope value
  tvalue= summary_table$statistic[2]     #t value 
  df = glance(fit)$df.residual           #df
  conflevel= confint(fit)                #confidence interval
  glue::glue("Estimated Regression line : Y = ", intercept, " + (", slope," * X) \n Intercept = ", intercept, "\n Estimated slope β = ", slope ,
             "\n t value = ", tvalue, " \n degree of freedom = ", df, "\n 95% CIs for β = ", conflevel[2,1]," , ", conflevel[2,2],  
             "\n p-value = ", summary_table$p.value[2])
}


# decision of the test, to reject or not to reject the Null Hypothesis, at 5% significance level
decision <- function(fit){
  summary_table = tidy(fit)
  p_value = summary_table$p.value[2]
  if(p_value < 0.05 ){
    glue::glue("Since the p-value is ", p_value," which is less than 0.05, we reject the null hypothesis.")
  }
  else {
    glue::glue("Since the p-value is ", p_value ," which is greater than 0.05, we do not reject the null hypothesis.")
  }
}


#conclusion to the test
conclusion <- function(fit) {
  summary_table = tidy(fit)
  slope = summary_table$estimate[2] #slope value
  p_value = summary_table$p.value[2]
  if (p_value > 0.05) {
    glue::glue("As the p-value is ", p_value ,"\n there is no statistically significant evidence of a linear relationship between the predictor variable X and the response variable Y. ")
  } else if (p_value < 0.05 && slope < 0 ) {
    glue::glue("As the p-value is ", p_value ," and estimated slope is ", slope, "\n there is a statistically significant evidence of a negative linear relationship between the predictor variable X and the response variable Y. ")
  } else {
    glue::glue("As the p-value is ", p_value ," and estimated slope is ", slope, "\n there is a statistically significant evidence of a positive linear relationship between the predictor variable X and the response variable Y. ")
  }
}


#prints the entire linear regression report
mytest<- function(file_name) {
  hypo <- hypothesis(file_name)
  assumptions(file_name)
  fit1 <- fit(file_name)
  lm_report <- lm_summary(fit1)
  dec <- decision(fit1)
  conc <- conclusion(fit1)
  cat(hypo,"\n\n",lm_report,"\n\n", dec, "\n\n", conc)
}
mytest("A1_Ex3_signif.csv")
mytest("A1_Ex3_not_signif.csv")
