#KNN Algorithm

wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

head(wbcd)

table(wbcd$Diagnosis)

wbcd$Diagnosis <- factor(wbcd$Diagnosis, levels = c("B", "M"),
                         labels = c("Benign", "Malignant"))

round(prop.table(table(wbcd$Diagnosis)) * 100, digits = 1)

summary(wbcd[c("radius", "area", "smoothness")])

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

wbcd_n <- as.data.frame(lapply(wbcd[1:3], normalize))

summary(wbcd_n$area)
wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

wbcd_train_labels <- wbcd[1:469, 4]
wbcd_test_labels <- wbcd[470:569, 4]

head(wbcd)

library(class)
wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k=21)

library(gmodels)
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq=FALSE)
R