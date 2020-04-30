#  Course          : Knowledge Discovery and Data Mining
#  First Name      : Zechen
#  Last Name       : Feng
#  Id              : 10452166
#  purpose         : Homework 3
library(kknn)

rm(list = ls())

data <- read.csv('breast-cancer-wisconsin.data.csv', header = TRUE, na.strings = "?")
data <- na.omit(data)

data$Class <- factor(data$Class, levels = c(2, 4), labels = c("benign", "malignant"))
idx <- sort(sample(nrow(data), as.integer((.70 * nrow(data)))))
training <- data[idx, ]
test <- data[-idx, ]

accuracy <- function(x) {
  accuracy <- sum(diag(x)/(sum(rowSums(x)))) * 100
  return(accuracy)
}

# k = 3
predict <- kknn(formula=Class~., training[, -1], test, k=3, kernel="rectangular")
fit <- fitted(predict)
result <- table(kknn = fit, test$Class)
result
a3<-accuracy(result)
a3

# k = 5
predict <- kknn(formula=Class~., training[, -1], test, k=5, kernel="rectangular")
fit <- fitted(predict)
result <- table(kknn = fit, test$Class)
result
a5<-accuracy(result)

# k = 10
predict <- kknn(formula=Class~., training[, -1], test, k=10, kernel="rectangular")
fit <- fitted(predict)
result <- table(kknn = fit, test$Class)
result
a7<-accuracy(result)

