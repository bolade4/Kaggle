# Check working directory
getwd()
setwd('C:/Users/bolad/R/Projects/Kaggle/House Prices')

# Load data
house.train <- read.csv('train.csv', stringsAsFactors = F)
head(house.train)
house.test <- read.csv('test.csv', stringsAsFactors = F)
rbind(head(house.test), tail(house.test))

# Data Structure
dim(house.train)
dim(house.test)

str(house.train)
str(house.test)

# combine the dataset
ncol(house.train)
ncol(house.test)

names(house.train)
names(house.test)

house.test$SalePrice <- NA

house.train$IsTrainSet <- T
house.test$IsTrainSet <- F

house.comb <- rbind(house.train, house.test)

# Analysing the Data
dim(house.comb)
str(house.comb)

# Statistical summary of all variables
summary(house.comb)

# Statistical summary of on the numerical variables
summary(house.comb[ ,sapply(house.comb[ , 1:82], 
                            typeof) == "integer"])

# Table for all variables with < 20 categories 
lapply(
  house.comb, function(var)
  {
    if(dim(table(var))<20) table(var)
  }
)

# Visulaizing the data
install.packages('ggplot2')
library(ggplot2)
library(gridExtra)
library(e1071)

# Function for a bar plot
bar.graph <- function(data_in, i)
{
  data <- data.frame(x=data_in[[i]])
  p <- ggplot(data=data, aes(x=factor(x))) + stat_count() + xlab(colnames(data_in)[i]) + theme_light() + 
    theme(axis.text.x = element_text(angle = 90, hjust =1))
  return (p)
}

# Function for a density plot
dens.graph <- function(data_in, i)
{
  data <- data.frame(x=data_in[[i]], SalePrice = data_in$SalePrice)
  p <- ggplot(data= data) + geom_line(aes(x = x), stat = 'density', size = 1,alpha = 1.0) +
    xlab(paste0((colnames(data_in)[i]), '\n', 'Skewness: ',round(skewness(data_in[[i]], na.rm = TRUE), 2))) + theme_light() 
  return(p)
}

# Function for an histogram
plot.graph <- function(data_in, fun, ii, ncol = 3)
{
  pp <- list()
  for (i in ii) {
    p <- fun(data_in=data_in, i = i)
    pp <- c(pp, list(p))
  }
  do.call("grid.arrange", c(pp, ncol=ncol))
} 

plot.graph(house.comb[1:1460, ], bar.graph, ii = 2:5, ncol = 2)
plot.graph(house.comb[1:1460, ], dens.graph, ii = 2:5, ncol = 2)

ggplot(house.comb, aes(GrLivArea, SalePrice)) + 
  geom_point(aes(color = Neighborhood)) + 
  scale_x_continuous("GrLivArea") +
  scale_y_continuous("SalePrice") +
  theme_bw() + 
  facet_wrap( ~ Neighborhood) + 
  theme(legend.position="none")

# Boxplots
ggplot(house.comb[1:1460, ], aes(x = Neighborhood, y = SalePrice)) +
  geom_boxplot() +
  geom_hline(aes(yintercept=80), 
             colour='red', linetype='dashed', lwd=2) +
  scale_y_continuous() 

ggplot(house.comb[1:1460, ], aes(x = HouseStyle, y = SalePrice)) +
  geom_boxplot() +
  geom_hline(aes(yintercept=80), 
             colour='red', linetype='dashed', lwd=2) +
  scale_y_continuous() 

ggplot(house.comb[1:1460, ], aes(x = SaleType, y = SalePrice)) +
  geom_boxplot() +
  geom_hline(aes(yintercept=80), 
             colour='red', linetype='dashed', lwd=2) +
  scale_y_continuous() 

# Visualizing transformed data with the Gaussian
par(mfrow=c(3,2))
hist(house.train$LotArea, breaks = 50, col = "red");hist(log10(house.train$LotArea+1),breaks=50,col = "red")
hist(house.train$MasVnrArea, breaks = 50,col = "red");hist(log10(house.train$MasVnrArea+1),breaks=50,col = "red")
hist(house.train$BsmtFinSF1, breaks = 50,col = "red");hist(log10(house.train$BsmtFinSF1+1),breaks=50,col = "red")

## to reset graph
resetPar <- function() {
  dev.new()
  op <- par(no.readonly = T)
  dev.off()
  op
}

par(resetPar())
par(bg = "white")

# Pair plot using the gaussian
pairs(log10(house.train$SalePrice) ~ log10(house.train$LotArea + 1) + log10(house.train$MasVnrArea + 1) + log10(house.train$BsmtFinSF1 + 1), 
      cex = 0.1, pch = 19, col = "red")

# Outliers
summary(house.comb[ ,sapply(house.comb[ , 1:82], 
                            typeof) == "integer"])

# Dealing with numeric variables with zeros
summary(house.comb)
int.zeros <- house.comb[c('X2ndFlrSF', 'LowQualFinSF', 'WoodDeckSF',
                          'OpenPorchSF', 'EnclosedPorch', 'X3SsnPorch',
                          'ScreenPorch', "PoolArea", 'MiscVal')]

int.zeros$X2ndFlrSF[which(int.zeros$X2ndFlrSF == 0)] <- NA
int.zeros$LowQualFinSF[which(int.zeros$LowQualFinSF == 0)] <- NA
int.zeros$WoodDeckSF[which(int.zeros$WoodDeckSF == 0)] <- NA
int.zeros$OpenPorchSF[which(int.zeros$OpenPorchSF == 0)] <- NA
int.zeros$EnclosedPorch[which(int.zeros$EnclosedPorch == 0)] <- NA
int.zeros$X3SsnPorch[which(int.zeros$X3SsnPorch == 0)] <- NA
int.zeros$ScreenPorch[which(int.zeros$ScreenPorch == 0)] <- NA
int.zeros$PoolArea[which(int.zeros$PoolArea == 0)] <- NA
int.zeros$MiscVal[which(int.zeros$MiscVal == 0)] <- NA

# MasVnrArea
subset(house.comb, house.comb['MasVnrArea'] == 0 & house.comb['MasVnrType'] != 'None')
house.comb$MasVnrArea[which(house.comb$MasVnrArea == 0 & house.comb$MasVnrType != 'None')] <- NA

"table(house.comb$MoSold )
boxplot.stats(house.comb$MiscVal)$out
hist(house.comb$BsmtFinSF1, bins = 20)
summary(house.comb$MoSold)
head(house.comb$LotArea, 300)
subset(house.comb, house.comb['WoodDeckSF'] == 0)
min(house.comb$YearRemodAdd)
max(house.comb$YearRemodAdd)
2010 - 1872
ggplot(house.comb[1:1460, ], aes(BsmtFinSF1), fill = as.factor(BsmtFinType1)) +
geom_histogram(bins = 30)
ggplot(house.comb[1:1460, ], aes(as.factor(BsmtFinType1))) +
geom_bar()
count(subset(house.comb, house.comb['BsmtFinSF1'] == 0 & house.comb$BsmtFinType1 != 'Unf' | house.comb$BsmtFinType1 != 'None'))
"

# Find outliers
findOutlier <- function(data, cutoff = 3) {
  ## Calculate the sd
  sds <- apply(data, 2, sd, na.rm = TRUE)
  ## Identify the cells with value greater than cutoff * sd (column wise)
  result <- mapply(function(d, s) {
    which(d > cutoff * s)
  }, data, sds)
  result
}

"int.var <- house.comb[sapply(house.comb[, 1:82], typeof) == 'integer']
names(int.var)
table(is.na(house.comb$MoSold))
table(house.comb$MoSold > 12)
table(house.comb$GarageCars)"

# Graphs to view outliers
hist(house.comb$GarageCars)
boxplot(house.comb$GarageCars)
hist(house.comb$KitchenAbvGr)
boxplot(house.comb$GarageCars)
table(house.comb$KitchenAbvGr)
table(house.comb$GarageCars)

outliers <- findOutlier(int.zeros)

# Remove outliers
removeOutlier <- function(data, outliers) {
  result <- mapply(function(d, o) {
    res <- d
    res[o] <- NA
    return(res)
  }, data, outliers)
  return(as.data.frame(result))
}

int.zeros <- removeOutlier(int.zeros, outliers)

# Cleaning the character variables
summary(house.comb)

# MSZoning
house.comb$MSZoning <- gsub('[[:lower:]]', '', house.comb$MSZoning)
house.comb$MSZoning <- gsub('[[:punct:]]', '', house.comb$MSZoning)
table(house.comb$MSZoning)
table(is.na(house.comb$MSZoning))

# Alley
table(house.comb$Alley)
head(house.comb$Alley, 100)
table(is.na(house.comb$Alley))
house.comb$Alley[which(is.na(house.comb$Alley))] <- 'None'

# Utilities
table(house.comb$Utilities)
house.comb$Utilities[which(is.na(house.comb$Utilities))]
subset(house.comb, is.na(house.comb['Utilities']))
# house.comb$Utilities[which(house.comb['Id'] == 1916)] <- 'NoSewr'
# house.comb$Utilities[which(house.comb['Id'] == 1946)] <- 'ELO'

# Exterior1st
library(dplyr)
table(house.comb$Exterior1st)
house.comb$Exterior1st[which(is.na(house.comb$Exterior1st))]
subset(house.comb, is.na(house.comb$Exterior1st))
subset(house.comb, house.comb$YearBuilt == 1940 & house.comb$RoofStyle == 'Flat')
count(subset(house.comb, house.comb$YearRemodAdd > 2004 & house.comb$Exterior1st == 'VinylSd'))
# house.comb$Exterior1st[which(is.na(house.comb$Exterior1st))] <- 'VinylSd'

# Exterior2nd
house.comb$Exterior2nd[which(is.na(house.comb$Exterior2nd))]
subset(house.comb, is.na(house.comb$Exterior2nd))
subset(house.comb, house.comb$YearBuilt == 1940)
tail(subset(house.comb, house.comb$YearBuilt == 1940), 12)
count(subset(house.comb, house.comb$YearRemodAdd > 2004 & house.comb$Exterior2nd == 'VinylSd'))
# house.comb$Exterior2nd[which(is.na(house.comb$Exterior2nd))] <- 'VinylSd'

# BsmtQual
table(house.comb$BsmtQual)
head(house.comb$BsmtQual, 100)
table(is.na(house.comb$BsmtQual))
house.comb$BsmtQual[which(is.na(house.comb$BsmtQual))] <- 'None'

# BsmtCond
table(house.comb$BsmtCond)
head(house.comb$BsmtCond, 100)
table(is.na(house.comb$BsmtCond))
house.comb$BsmtCond[which(is.na(house.comb$BsmtCond))] <- 'None'

# BsmtExposure
table(house.comb$BsmtExposure)
head(house.comb$BsmtExposure, 100)
table(is.na(house.comb$BsmtExposure))
house.comb$BsmtExposure[which(is.na(house.comb$BsmtExposure))] <- 'None'
house.comb$BsmtExposure[which(house.comb$BsmtExposure == 'No')] <- 'None'

# BsmtFinType1
table(house.comb$BsmtFinType1)
head(house.comb$BsmtFinType1, 100)
table(is.na(house.comb$BsmtFinType1))
house.comb$BsmtFinType1[which(is.na(house.comb$BsmtFinType1))] <- 'None'

# BsmtFinType2
table(house.comb$BsmtFinType2)
head(house.comb$BsmtFinType2, 100)
table(is.na(house.comb$BsmtFinType2))
house.comb$BsmtFinType2[which(is.na(house.comb$BsmtFinType2))] <- 'None'

# FireplaceQu
table(house.comb$FireplaceQu)
head(house.comb$FireplaceQu, 100)
table(is.na(house.comb$GarageType))
house.comb$FireplaceQu[which(is.na(house.comb$FireplaceQu))] <- 'None'

# GarageType
table(house.comb$GarageType)
head(house.comb$GarageType, 100)
table(is.na(house.comb$GarageType))
house.comb$GarageType[which(is.na(house.comb$GarageType))] <- 'None'

# GarageFinish
table(house.comb$GarageFinish)
head(house.comb$GarageFinish, 100)
table(is.na(house.comb$GarageFinish))
house.comb$GarageFinish[which(is.na(house.comb$GarageFinish))] <- 'None'

# GarageQual
table(house.comb$GarageQual)
head(house.comb$GarageQual, 100)
table(is.na(house.comb$GarageQual))
house.comb$GarageQual[which(is.na(house.comb$GarageQual))] <- 'None'

# GarageCond
table(house.comb$GarageCond)
head(house.comb$GarageCond, 100)
table(is.na(house.comb$GarageCond))
house.comb$GarageCond[which(is.na(house.comb$GarageCond))] <- 'None'

# PoolQC
table(house.comb$PoolQC)
head(house.comb$PoolQC, 100)
table(is.na(house.comb$PoolQC))
house.comb$PoolQC[which(is.na(house.comb$PoolQC))] <- 'None'

# Fence
table(house.comb$Fence)
head(house.comb$Fence, 100)
table(is.na(house.comb$Fence))
house.comb$Fence[which(is.na(house.comb$Fence))] <- 'None'

# MiscFeature
table(house.comb$MiscFeature)
head(house.comb$MiscFeature, 100)
table(is.na(house.comb$MiscFeature))
house.comb$MiscFeature[which(is.na(house.comb$MiscFeature))] <- 'None'

house.comb1 <- house.comb
house.comb1$X2ndFlrSF <- int.zeros$X2ndFlrSF
house.comb1$LowQualFinSF <- int.zeros$LowQualFinSF
house.comb1$WoodDeckSF <- int.zeros$WoodDeckSF
house.comb1$OpenPorchSF <- int.zeros$OpenPorchSF
house.comb1$EnclosedPorch <- int.zeros$EnclosedPorch
house.comb1$X3SsnPorch <- int.zeros$X3SsnPorch
house.comb1$ScreenPorch <- int.zeros$ScreenPorch
house.comb1$PoolArea <- int.zeros$PoolArea
house.comb1$MiscVal <- int.zeros$MiscVal

# convert character variables to category
str(house.comb1)
names(house.comb1[sapply(house.comb1[, 1:82], typeof) == "character"])
house.comb1[c("MSZoning", "Street", "Alley", "LotShape",     
              "LandContour", "Utilities", "LotConfig", "LandSlope",    
              "Neighborhood", "Condition1", "Condition2", "BldgType",     
              "HouseStyle", "RoofStyle", "RoofMatl", "Exterior1st",  
              "Exterior2nd", "MasVnrType", "ExterQual", "ExterCond",    
              "Foundation", "BsmtQual", "BsmtCond", "BsmtExposure", 
              "BsmtFinType1", "BsmtFinType2", "Heating", "HeatingQC",     
              "CentralAir", "Electrical", "KitchenQual", "Functional",   
              "FireplaceQu", "GarageType", "GarageFinish", "GarageQual",   
              "GarageCond", "PavedDrive", "PoolQC", "Fence",        
              "MiscFeature", "SaleType", "SaleCondition")] <- lapply(house.comb1[c("MSZoning", "Street", "Alley", "LotShape",     
                                                                                   "LandContour", "Utilities", "LotConfig", "LandSlope",    
                                                                                   "Neighborhood", "Condition1", "Condition2", "BldgType",     
                                                                                   "HouseStyle", "RoofStyle", "RoofMatl", "Exterior1st",  
                                                                                   "Exterior2nd", "MasVnrType", "ExterQual", "ExterCond",    
                                                                                   "Foundation", "BsmtQual", "BsmtCond", "BsmtExposure", 
                                                                                   "BsmtFinType1", "BsmtFinType2", "Heating", "HeatingQC",     
                                                                                   "CentralAir", "Electrical", "KitchenQual", "Functional",   
                                                                                   "FireplaceQu", "GarageType", "GarageFinish", "GarageQual",   
                                                                                   "GarageCond", "PavedDrive", "PoolQC", "Fence",        
                                                                                   "MiscFeature", "SaleType", "SaleCondition")], as.factor)




str(house.comb1)
dim(house.comb1)

# Missing values
# Percentage of all missing data without the independable column
sum(is.na(house.comb1[-81])) / (nrow(house.comb1[-81]) * ncol(house.comb1[-81]))

# Sum of all NA's in each variable of the dataset 
# without SalePrice column
sapply(house.comb1[-81], function(x) sum(is.na(x)))

# Making the factor variables
str(house.comb1)
table(house.comb1$SalePrice)
table(is.na(house.comb1$SalePrice))

# Impute missing values using randomForest
library(missForest)

house.combNa <- missForest(house.comb1[c(-81, -82)])

house.combNa$ximp
house.combNa$OOBerror

# cleaned data without NA
house.cln <- house.combNa$ximp

summary(house.cln)

# remove the Id column
house.cln$Id <- NULL
ncol(house.cln)
str(house.cln)

# Correlataions
integ <- house.cln[sapply(house.cln, typeof) != "integer"]
table(is.na(integ))
names(integ)
corr <- cor(integ)

# Plotting the correlation graph
library(corrplot)
cor.row <- apply(corr, 1, function(x) sum(x > 0.3 | x < 0.3) > 1)
corr <- corr[cor.row, cor.row]
corrplot(corr, method = 'square')

# Skew the dataset
classes <- lapply(house.cln, function(x) class(x))
integ1 <- names(classes[classes == "integer" | classes == "numeric"])
factor <- names(classes[classes == "factor" | classes == "character"])
house.skew <- sapply(integ1, function(x) skewness(house.cln[[x]]))
house.skew <- house.skew[abs(house.skew) > .75]

# Transform excessively skewed features with log(x + 1)
for (x in names(house.skew)) {
  house.cln[[x]] <- log(house.cln[[x]] + 1)
}

# Add the saleprice and the istrainset variable
house.cln$SalePrice <- house.comb1$SalePrice
house.cln$IsTrainSet <- house.comb1$IsTrainSet

# Use dummy to for categorical variables
"house.cldum <- house.cln
house.cldum$IsTrainSet <- NULL
house.cldum$SalePrice <- NULL
house.dummy <- dummyVars(~ ., data = house.cldum)
house.dummydf <- data.frame(predict(house.dummy, newdata = house.cldum))
head(house.dummydf)
house.cldum <- house.dummydf
str(house.cldum)"

# Split the dataset back to training and test set
house.train <- house.cln[1:1460, ]
house.test <- house.cln[1461:2919, ]

house.train$IsTrainSet <- NULL
house.test$IsTrainSet <- NULL

str(house.train)
dim(house.train)
dim(house.test)

################################################################
# Building the model
# Cross Validation.
library(caret)
tr.control <- trainControl(method = "repeatedcv", 
                           number = 10, repeats = 10,
                           verboseIter = T)

################################################################
# Linear regression
set.seed(111)
lm_model <- train(SalePrice ~ ., house.train, method = 'lm',
                  trControl = tr.control)

# Results
lm_model$results
lm_model
summary(lm_model)

# Ploting the model
plot(lm_model$finalModel)

################################################################
# Ridge regression model
set.seed(111)
install.packages("glmnet")
library(glmnet)

ridge_model <- train(SalePrice ~ ., data = house.train,
                     method = "glmnet", trControl = tr.control,
                     tuneGrid = expand.grid(alpha = 0, 
                                            lambda = seq(0.0001, 1, length = 5)))

# Plot results  
plot(ridge_model)
ridge_model
plot(ridge_model$finalModel, xvar = 'lambda', label = T)
plot(ridge_model$finalModel, xvar = 'dev', label = T)
plot(varImp(ridge_model, scale = F))

################################################################
# Lasso regression model
set.seed(111)
lasso_model <- train(SalePrice ~ ., data = house.train,
                     method = "glmnet", trControl = tr.control,
                     tuneGrid = expand.grid(alpha = 1, 
                                            lambda = seq(0.0001, 0.5, length = 5)))

# Plot results
plot(lasso_model)
lasso_model
plot(lasso_model$finalModel, xvar = 'lambda', label = T)
plot(lasso_model$finalModel, xvar = 'dev', label = T)
plot(varImp(lasso_model, scale = F))

################################################################
# Elastic net regression
set.seed(111)
elas_model <- train(SalePrice ~ ., house.train,
                    method = 'glmnet', 
                    tuneGrid = expand.grid(alpha = seq(0, 1, length = 10),
                                           lambda = seq(0.0001, 0.5, length = 5)),
                    trControl = tr.control) 

# Plot results
plot(elas_model)
elas_model
plot(elas_model$finalModel, xvar = 'lambda', label = T)
plot(elas_model$finalModel, xvar = 'dev', label = T)
plot(varImp(elas_model, scale = F))

# Compare models
model_comp <- list(LinearModel = lm_model, Ridge = ridge_model, 
                   Lasso = lasso_model, ElasticNet = elas_model)
res <- resamples(model_comp)
summary(res)
bwplot(res)
xyplot(res, metric = 'RMSE')

# Best model
elas_model$bestTune
best <- elas_model$finalModel
coef(best, s = elas_model$bestTune$lambda)

# Save final model for later use
saveRDS(elas_model, 'final_model.rds')
final_model <- readRDS('final_model.rds')
print(final_model)

# Predictions with training data
elas_pred <- predict(final_model, house.train)

# RMSE
sqrt(mean((house.train$SalePrice - elas_pred) ** 2))

# Predictions with test data
elas_pred1 <- predict(final_model, house.test)

# RMSE
sqrt(mean((house.train$SalePrice - elas_pred1) ** 2))

################################################################
# Using Principal Components for regression to cut of dimensionality
library(caret)
PCA <- preProcess(house.train[, -1], method = 'pca')

# Predict with training set
trainPred <- predict(PCA, house.train)
dim(trainPred)

trainPred$SalePrice <- house.train$SalePrice

# Ploting the PC
qplot(x = PC1, y = log(SalePrice), data = trainPred, alpha = I(0.3)) +
  theme_bw()
qplot(x = PC2, y = log(SalePrice), data = trainPred, alpha = I(0.3)) +
  theme_bw()
qplot(x = PC3, y = log(SalePrice), data = trainPred, alpha = I(0.3)) +
  theme_bw()
qplot(x = PC4, y = log(house.train$SalePrice), data = trainPred, alpha = I(0.3)) +
  theme_bw()
qplot(x = PC5, y = log(SalePrice), data = trainPred, alpha = I(0.3)) +
  theme_bw()

################################################################
# Principal Components Regression
install.packages('pls')
library(pls)

set.seed(111)
pcr.model <- pcr(SalePrice ~ ., data = house.train, scale = F,
                 validation = 'CV', ncomp = 170)

summary(pcr.model)

# cross-validation estimated RMSE or MSE scores plot
validationplot(pcr.model, val.type = 'RMSEP')

## to reset graph
resetPar <- function() {
  dev.new()
  op <- par(no.readonly = T)
  dev.off()
  op
}

par(resetPar())
par(bg = "white")

################################################################
# RandomForest regression model with cross validation
library(randomForest)

set.seed(111)
rand_model <- train(SalePrice ~ ., data = house.train, method = "rf", 
                    trControl = trainControl(method = "cv", number = 10)) 

# Results
rand_model

# Function to streamline and plotting training models analyses using Pearson correlation:
rmse.training <- function(pred,observed,method){
  rmse.training = sqrt(mean((pred - observed) ^ 2))
  cor.training = cor(house.train$SalePrice, pred)
  plot(x = pred, y = observed, cex = 0.5, col = "navy", pch = 19, 
       main = method,xlab = "Log(Predicted)", ylab = "Log(Observed)")
  text(x = max(pred), y = min(observed) + 0.4,
       labels = paste0("RMSE: ", rmse.training))
  text(x = max(pred), y = min(observed) + 0.2,
       labels = paste0("Pr.cor: ", cor.training))
}

# Ploting the RMSE training graph
rmse.training(pred = predict(rand_model, house.train),
              observed = house.train$SalePrice, 
              method = " Random Forest")

# Variable importance
var_import <- data.frame(rand_model$finalModel$importance)
var_import[2] <- row.names(var_import)
var_import <- arrange(var_import, IncNodePurity)
head(var_import, 20)

# Predictions
rand_pred <- predict(rand_model, house.test)

# RandomForest variable importance graph
set.seed(111)
var_imp_model <- randomForest(SalePrice ~ ., data = house.train, ntree = 500,
                              mtry = 3, nodesize = 0.01 * nrow(house.train))

# rand_pred <- predict(rand_model, house.test)
# Variable importance
var_importance <- importance(var_imp_model)

# Importance plot
varImpPlot(var_imp_model)

################################################################
# Gradient boosting with cross validation
install.packages('gbm')
library(gbm)

set.seed(111)
grad_model <- train(SalePrice ~ ., data = house.train, method = "gbm", 
                    trControl = trainControl(method = "cv", number = 10), verbose = FALSE)

# Result
grad_model

# Ploting the RMSE training graph
rmse.training(pred = predict(grad_model, house.train), 
              observed = house.train$SalePrice, 
              method = 'Gradient Boosting')

# Variable importance
dotPlot(varImp(grad_model))

# Predictions
grad_pred <- predict(grad_model, house.test)

################################################################
# Extreme Gradient boosting with cross validation
install.packages('xgboost')
library(xgboost)

set.seed(111)
xgrad_model <- train(SalePrice ~ ., data = house.train, method = "xgbLinear", 
                     trControl = trainControl(method = "cv", number = 10), verbose = FALSE)

# Result
xgrad_model

# Ploting the RMSE training graph
rmse.training(pred = predict(xgrad_model, house.train), 
              observed = house.train$SalePrice, 
              method = 'Extreme Gradient Boosting')

# Variable importance
dotPlot(varImp(xgrad_model))

# Predictions
xgrad_pred <- predict(xgrad_model, house.test)

################################################################
# Support vector machines 
# with a radial kernel with cross validation
library(e1071)

set.seed(111)
svm_model <- train(SalePrice ~ ., data = house.train, method = "svmRadial", 
                   trControl = trainControl(method = "cv", number = 10), verbose = FALSE)

# Result
svm_model

# Ploting the RMSE training graph
rmse.training(pred = predict(svm_model, house.train), 
              observed = house.train$SalePrice, 
              method = 'Support Vector Machines')

# Variable importance
dotPlot(varImp(svm_model))

# Predictions
svm_pred <- predict(svm_model, house.test)

###############################################################
# Using log10()
par(mfrow = c(1, 2))
boxplot(house.train$SalePrice, main = 'SalePrice')
boxplot(log10(house.train$SalePrice), main = 'Log10(SalePrice)')

# Missing data
na.status <- is.na(house.comb1)
na.sum <- apply(na.status, 2, sum)
names(na.sum) <- colnames(house.comb1)
most.missing <- which(na.sum > (0.3 * nrow(house.comb1)))
na.sum[most.missing]

sapply(house.comb1, function(x) sum(is.na(x)))

# Alley boxplot
ggplot(house.comb1, aes(Alley, log(SalePrice), fill = Alley)) +
  geom_boxplot()
ggplot(house.comb1, aes(Alley, SalePrice, fill = Alley)) +
  geom_boxplot()
ggplot(house.comb1, aes(Alley, log10(SalePrice), fill = Alley)) +
  geom_boxplot()

# FireplaceQu boxplot
ggplot(house.comb1, aes(FireplaceQu, SalePrice, fill = FireplaceQu)) +
  geom_boxplot()
ggplot(house.comb1, aes(FireplaceQu, log10(SalePrice), fill = FireplaceQu)) +
  geom_boxplot()

# Log10() for gaussian method
par(mfrow=c(1,2))
hist(house.comb1$SalePrice)
hist(log10(house.comb1$SalePrice)) # Looks more gaussian

# Fitting FireplaceQu column
FirePlaceFit <- lm(log10(house.comb1$SalePrice) ~ FireplaceQu, house.comb1)
summary(FirePlaceFit)

# Plot FirePlaceFit
par(mfrow = c(2, 2))
plot(FirePlaceFit)

# Continuous variables in the dataset
cont.var <- NULL
for(i in 1:ncol(house.comb1)){
  if(class(house.comb1[, i]) == "integer" | class(house.comb1[, i]) == "numeric"){
    cont.var <- c(cont.var, i)
  }
}

# Part1: transforming LotArea to make it more gaussian
pairs(log10(house.comb1$SalePrice) ~ ., data = house.comb1[, cont.var[1:10]], 
      cex = 0.05, pch = 19, col = "navy")
# Part2: Area related features generally explain variation in the SalePrice
pairs(log10(house.comb1$SalePrice) ~ ., data = house.comb1[, cont.var[11:20]], 
      cex = 0.05, pch = 19, col = "navy")
# Part3: Size of the garage and number of rooms are good predictors
pairs(log10(house.comb1$SalePrice) ~ ., data = house.comb1[,cont.var[22:31]], 
      cex = 0.05, pch = 19, col = "navy")
# Part4: fairly weak predictors
pairs(log10(house.comb1$SalePrice) ~ ., data = house.comb1[,cont.var[32:38]], 
      cex = 0.05, pch = 19, col = "navy")

################################################################
## Using Principal Components along 
## with Mechine Learning Algorithms.
# Gradient boosting with cross validation, Principal Components.
set.seed(111)
grad_pca <- train(SalePrice ~ ., data = trainPred, method = "gbm", 
                  trControl = trainControl(method = "cv", number = 10), verbose = FALSE)

# Result
grad_pca

# Ploting the RMSE training graph
rmse.training(pred = predict(grad_pca, trainPred), 
              observed = house.train$SalePrice, 
              method = 'Gradient Boosting with PCs')

# Variable importance
dotPlot(varImp(grad_pca))

# Prepare principal components of the test set
library(caret)

PCA.test <- preProcess(house.test[, -80], method = "pca")
PCAtest <- predict(PCA.test, newdata = house.test)

# Predictions with test data
PCAtest$MSSubClass <- house.test$MSSubClass
grad_pred <- predict(grad_pca, PCAtest)

################################################################
# SVM with a radial kernel, CV using PCs
set.seed(111)
svm_pca <- train(SalePrice ~ ., data = trainPred, method = "svmRadial", 
                 trControl = trainControl(method = "cv", number = 10), verbose = FALSE)

# Result
svm_pca

# Ploting the RMSE training graph
rmse.training(pred = predict(svm_pca, trainPred), 
              observed = house.train$SalePrice, 
              method = 'Support Vector Machines with PCs')

# Variable importance
dotPlot(varImp(svm_pca))

# Prepare principal components of the test set
library(caret)

svmpca.test <- preProcess(house.test[, -80], method = "pca")
svmPCAtest <- predict(svmpca.test, newdata = house.test)

# Predictions with test data
svmPCAtest$MSSubClass <- house.test$MSSubClass
svm_pca_pred <- predict(svm_pca, svmPCAtest)

################################################################
# RandomForest with CV using PCs
set.seed(111)
rf_pca <- train(SalePrice ~ ., data = trainPred, method = "rf", 
                trControl = trainControl(method = "cv", number = 10), verbose = FALSE)

# Result
rf_pca

# Ploting the RMSE training graph
rmse.training(pred = predict(rf_pca, trainPred), 
              observed = house.train$SalePrice, 
              method = 'Random Forest with PCs')

# Prepare principal components of the test set
library(caret)

rfpca.test <- preProcess(house.test[, -80], method = "pca")
rfPCAtest <- predict(rfpca.test, newdata = house.test)

# Predictions with test data
rfPCAtest$MSSubClass <- house.test$MSSubClass
rf_pca_pred <- predict(rf_pca, rfPCAtest)

################################################################
################################################################
################################################################
# Running further analysis
# Converting categorical variables to dummy variables
library(caret)

house.cldum <- house.cln
house.dummy <- dummyVars(~ ., data = house.cldum[c(-80, -81)])
house.dummydf <- data.frame(predict(house.dummy, newdata = house.cldum))
head(house.dummydf)
house.clnum <- house.dummydf
str(house.clnum)

# Split the dataset back to training and test set
house.clnum$SalePrice <- house.cldum$SalePrice
hou.train <- house.clnum[1:1460, ]
hou.test <- house.clnum[1461:2919, ]

str(hou.train)
dim(hou.train)
dim(hou.test)

################################################################
# Building the model
# Cross Validation.
library(caret)
dumtr.control <- trainControl(method = "repeatedcv", 
                              number = 10, repeats = 10,
                              verboseIter = T)

################################################################
# Linear regression
set.seed(111)
dumlm_model <- train(SalePrice ~ ., hou.train, method = 'lm',
                     trControl = dumtr.control)

# Results
dumlm_model$results
dumlm_model
summary(dumlm_model)

# Ploting the model
plot(dumlm_model$finalModel)

################################################################
# Ridge regression model
set.seed(111)
install.packages("glmnet")
library(glmnet)

dumridge_model <- train(SalePrice ~ ., data = hou.train,
                        method = "glmnet", trControl = dumtr.control,
                        tuneGrid = expand.grid(alpha = 0, 
                                               lambda = seq(0.0001, 1, length = 5)))

# Plot results  
plot(dumridge_model)
dumridge_model
plot(dumridge_model$finalModel, xvar = 'lambda', label = T)
plot(dumridge_model$finalModel, xvar = 'dev', label = T)
plot(varImp(dumridge_model, scale = F))

################################################################
# Lasso regression model
set.seed(111)
dumlasso_model <- train(SalePrice ~ ., data = hou.train,
                        method = "glmnet", trControl = dumtr.control,
                        tuneGrid = expand.grid(alpha = 1, 
                                               lambda = seq(0.0001, 0.5, length = 5)))

# Plot results
plot(dumlasso_model)
dumlasso_model
plot(dumlasso_model$finalModel, xvar = 'lambda', label = T)
plot(dumlasso_model$finalModel, xvar = 'dev', label = T)
plot(varImp(dumlasso_model, scale = F))

################################################################
# Elastic net regression
set.seed(111)
dumelas_model <- train(SalePrice ~ ., hou.train,
                       method = 'glmnet', 
                       tuneGrid = expand.grid(alpha = seq(0, 1, length = 10),
                                              lambda = seq(0.0001, 0.5, length = 5)),
                       trControl = dumtr.control) 

# Plot results
plot(dumelas_model)
dumelas_model
plot(dumelas_model$finalModel, xvar = 'lambda', label = T)
plot(dumelas_model$finalModel, xvar = 'dev', label = T)
plot(varImp(dumelas_model, scale = F))

# Compare models
dummodel_comp <- list(LinearModel = dumlm_model, Ridge = dumridge_model, 
                      Lasso = dumlasso_model, ElasticNet = dumelas_model)
dumres <- resamples(dummodel_comp)
summary(dumres)
bwplot(dumres)
xyplot(dumres, metric = 'RMSE')

# Best model
dumelas_model$bestTune
dumbest <- dumelas_model$finalModel
coef(dumbest, s = dumelas_model$bestTune$lambda)

# Save final model for later use
saveRDS(dumelas_model, 'dumfinal_model.rds')
dumfinal_model <- readRDS('dumfinal_model.rds')
print(dumfinal_model)

# Predictions with training data
dumelas_pred <- predict(dumfinal_model, hou.train)

# RMSE
sqrt(mean((hou.train$SalePrice - dumelas_pred) ** 2))

# Predictions with test data
dumelas_pred1 <- predict(dumfinal_model, hou.test)

# RMSE
sqrt(mean((hou.train$SalePrice - dumelas_pred1) ** 2))
# sqrt(mean((hou.test$SalePrice - dumelas_pred1) ** 2))

write.csv(data.frame(Id=test$Id,SalePrice=elas_pred1),"elast.csv",row.names = F)