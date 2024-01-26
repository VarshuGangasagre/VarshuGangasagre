#Decision trees
credit <- read.csv("credit.csv")

str(credit)

table(credit$checking_balance)

table(credit$savings_balance)
summary(credit$months_loan_duration)
summary(credit$amount)

table(credit$class)

set.seed(12345)
credit_rand <- credit[order(runif(1000)), ]

summary(credit$amount)
summary(credit_rand$amount)

head(credit$amount)
head(credit_rand$amount)

credit_train <- credit_rand[1:900, ]
credit_test <- credit_rand[901:1000, ]

prop.table(table(credit_train$class))
prop.table(table(credit_test$class))

library(C50)
BiocManager::install("C50")

credit_train$class <- factor(credit_train$class)

dim(credit_train)

# Now you can build the C5.0 model
credit_model <- C5.0(credit_train[-22], credit_train$class)
credit_model

summary(credit_model)

credit_pred <- predict(credit_model, credit_test)

BiocManager::install("gmodels")
library(gmodels)

CrossTable(credit_test$class, credit_pred,
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
           dnn = c('actual default', 'predicted default'))

credit_train$class <- factor(credit_train$class)
credit_boost10 <- C5.0(credit_train[-22], credit_train$class,
                       trials = 10)

credit_boost10

summary(credit_boost10)

credit_boost_pred10 <- predict(credit_boost10, credit_test)
CrossTable(credit_test$class, credit_boost_pred10,
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
           dnn = c('actual default', 'predicted default'))