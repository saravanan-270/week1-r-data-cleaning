# Week 1: Data Cleaning and Preliminary Analysis with R

library(dplyr)
library(ggplot2)

data <- read.csv("titanic_week1_dataset.csv", stringsAsFactors = FALSE)

# 1. Initial inspection
str(data)
summary(data)
colSums(is.na(data))

# 2. Missing-value treatment
median_age <- median(data$Age, na.rm = TRUE)
mode_embarked <- names(sort(table(data$Embarked), decreasing = TRUE))[1]

data$Age[is.na(data$Age)] <- median_age
data$Embarked[is.na(data$Embarked)] <- mode_embarked

# 3. Outlier detection using IQR
Q1 <- quantile(data$Fare, 0.25, na.rm = TRUE)
Q3 <- quantile(data$Fare, 0.75, na.rm = TRUE)
IQR_value <- Q3 - Q1
lower <- Q1 - 1.5 * IQR_value
upper <- Q3 + 1.5 * IQR_value

cat("IQR lower bound:", lower, "\n")
cat("IQR upper bound:", upper, "\n")

# Cap Fare outliers to the IQR boundaries
data$Fare_Clean <- pmin(pmax(data$Fare, lower), upper)

# 4. Standardization / scaling
data$Age_scaled <- as.numeric(scale(data$Age))
data$Fare_scaled <- as.numeric(scale(data$Fare_Clean))

# 5. Categorical encoding
data$Sex <- factor(data$Sex)
data$Embarked <- factor(data$Embarked)
data$Pclass <- factor(data$Pclass)

# 6. Descriptive statistics
summary(data$Age)
summary(data$Fare_Clean)
table(data$Sex)
table(data$Pclass)
prop.table(table(data$Survived))

# 7. Correlation analysis
numeric_data <- data[, c("Survived", "Age", "SibSp", "Parch", "Fare_Clean")]
print(cor(numeric_data))

# 8. Visualizations
p1 <- ggplot(data, aes(x = Fare)) +
  geom_boxplot() +
  labs(title = "Fare Distribution: Outlier Detection", x = "Fare")
print(p1)

ggsave("fare_outlier.png", p1, width = 7, height = 4.2)

p2 <- ggplot(data, aes(x = Sex, fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(title = "Survival Rate by Sex", y = "Proportion", fill = "Survived")
print(p2)

ggsave("survival_by_sex.png", p2, width = 7, height = 4.2)

p3 <- ggplot(data, aes(x = Fare_Clean)) +
  geom_boxplot() +
  labs(title = "Fare Distribution After Outlier Treatment", x = "Cleaned Fare")
print(p3)

ggsave("fare_after_cleaning.png", p3, width = 7, height = 4.2)

# 9. Save cleaned dataset
write.csv(data, "titanic_cleaned.csv", row.names = FALSE)

# End of analysis
