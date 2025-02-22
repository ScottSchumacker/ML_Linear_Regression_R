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

# Training our models
# First model with just age as a feature
train_control <- trainControl(method = "none")
lm_model <- train(systolic_bp ~ age,
                  data = training_data,
                  method = "lm",
                  trControl = train_control)
predictions <- predict(lm_model, newdata = test_data)

# Second model with both age and cholesterol as features
lm_model2 <- train(systolic_bp ~ age + cholesterol,
                   data = training_data,
                   method = "lm",
                   trControl = train_control)
predictions2 <- predict(lm_model2, newdata = test_data)

# Evaluating model performance
postResample(predictions, test_data$systolic_bp)
postResample(predictions2, test_data$systolic_bp)