# Scott Schumacker
# Data set Creation

# Loading packages
library(caret)
library(ggplot2)
library(dplyr)

# Creating data set
# Creating patients
n <- 100

# Creating age and cholesterol data
age <- sample(30:80, n, replace = TRUE)
cholesterol <- rnorm(n, mean = 200, sd = 30)

# Creating true coefficients
intercept <- 90
age_coef <- 0.5
cholesterol_coef <- 0.1

# Generating error term
error <- rnorm(n, mean = 0, sd = 10)

# Generating response variable
systolic_bp <- intercept + age_coef * age + cholesterol_coef * cholesterol + error

# Creating data frame
bp_data <- data.frame(age = age, cholesterol = cholesterol, systolic_bp = systolic_bp)
