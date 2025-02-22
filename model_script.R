# Scott Schumacker
# Model Creation

# Loading packages
library(caret)
library(ggplot2)
library(dplyr)

# Split the data set into test and train data
trainIndex <- createDataPartition(bp_data$systolic_bp, p=0.8, list = FALSE)

training_data <- bp_data[trainIndex, ]
test_data <- bp_data[-trainIndex, ]