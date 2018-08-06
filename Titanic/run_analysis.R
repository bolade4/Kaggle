getwd()

setwd("C:/Git_Root/Kaggle/Titanic")

rm(titanic_gender, titanic_test, titanic_train)
rm(Titanic)
rm(TitanicSurvival)

str(Titanic)
rm(Titanic)
str(TitanicSurvival)

head(Titanic)
Titanic
class(Titanic)
class(TitanicSurvival)

rm(list = ls()[grepl("Tit", ls())])
ls()

titanic.train <- read.csv(file = "train.csv", stringsAsFactors = F, header = T)
tail(titanic.train)
str(titanic.train)
titanic.test <- read.csv(file = "test.csv", stringsAsFactors = F, header = T)
str(titanic.test)

median(titanic.train$Age, na.rm = T)
median(titanic.test$Age, na.rm = T)

titanic.train$IsTrainSet <- T
titanic.test$IsTrainSet <- F

ncol(titanic.train)
ncol(titanic.test)
names(titanic.train)
names(titanic.test)

titanic.test$Survived <- NA

titanic.full <- rbind(titanic.train, titanic.test)
tail(titanic.full)

table(titanic.full$IsTrainSet)
table(titanic.full$Embarked)

titanic.full[titanic.full$Embarked == "", "Embarked"] <- "S"
table(titanic.full$Embarked)

is.na(titanic.full$Age)
table(is.na(titanic.full$Age))
table(titanic.full$Age)

age.median <- median(titanic.full$Age, na.rm = T)
titanic.full[is.na(titanic.full$Age), "Age"] <- age.median
table(is.na(titanic.full$Age))

## clean missing values of fare
summary(titanic.full)
table(is.na(titanic.full$Fare))
fare.median <- median(titanic.full$Fare, na.rm = T)
fare.median
titanic.full[is.na(titanic.full$Fare), "Fare"] <- fare.median
table(is.na(titanic.full$Fare))

## making titanic.full categorical
titanic.full[c("Pclass", "Sex", "Embarked")] <- lapply(titanic.full[c("Pclass", 
                                                                      "Sex", 
                                                                      "Embarked")], 
                                                       as.factor)
str(titanic.full)

## split dataset into train and test
titanic.train <- titanic.full[titanic.full$IsTrainSet == T, ]
tail(titanic.train)
str(titanic.train)
titanic.test <- titanic.full[titanic.full$IsTrainSet == F, ]
tail(titanic.test)
t <- titanic.full[!titanic.full$IsTrainSet == T, ]
tail(t)
str(titanic.test)

str(titanic.train$Survived)
titanic.train$Survived <- as.factor(titanic.train$Survived)

## predictive model
library(randomForest)
str(titanic.train)
survived.equation <- "Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked"
survived.formula <- as.formula(survived.equation)
titanic.model <- randomForest(survived.formula, data = titanic.train, ntree = 500, mtry = 3, 
             nodesize = 0.01 * nrow(titanic.test))

features.equation <- "Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked"
survived <- predict(titanic.model, newdata = titanic.test)
survived

PassengerId <- titanic.test$PassengerId
output.df <- as.data.frame(PassengerId)
output.df
output.df$survived <- survived
rbind(head(output.df), tail(output.df))

write.csv(output.df, file = "Kaggle_submission.csv", row.names = F)
