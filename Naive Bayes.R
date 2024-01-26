data<- read.csv("diabetes.csv")

data$Outcome <- factor(data$Outcome, levels = c(0,1), labels = c("False", "True"))

head(data)

data[, 2:7][data[, 2:7] == 0] <- NA

library(e1071)
library(caret)

# Split data into training and test sets
set.seed(123)
indxTrain <- createDataPartition(y = data$Outcome, p = 0.75, list = FALSE)
training <- data[indxTrain, ]
testing <- data[-indxTrain, ]

# Build a Naive Bayes model
model <- naiveBayes(Outcome ~ ., data = training)

# Model Evaluation
# Predict testing set
predictions <- predict(model, newdata = testing)

# Get the confusion matrix to see accuracy and other parameter values
confusion_matrix <- table(predictions, testing$Outcome)
print(confusion_matrix)

# Calculate accuracy
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
print(paste("Accuracy:", accuracy))

CrossTable(predictions, testing$Outcome,
           prop.chisq = FALSE, prop.t = FALSE,
           dnn = c('predicted', 'actual'))

