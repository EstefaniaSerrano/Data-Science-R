library(xgboost)
library(readr)
library(stringr)
library(caret)
library(car)

set.seed(100)
setwd("C:\\Pagc\\MDS\\Course 4 Predictive Analytics 2\\R\\XGBoast")
# load data
df_train = read.csv("train.csv")
df_test = read.csv("test.csv")

str(df_train)
str(df_test)

df_train1 <- df_train[,-95]
df_test1 <- df_test[,-95]
str(df_train1)


new_tr <- model.matrix(~.+0,data = df_train1) 
new_ts <- model.matrix(~.+0,data = df_test1)


help(xgb.DMatrix)
dtrain <- xgb.DMatrix(data = new_tr, label = df_train$target ) 
dtest <- xgb.DMatrix(data = new_ts, label = df_test$target)

params <- list(booster = "gbtree", objective = "binary:logistic", eta=0.3, gamma=0, max_depth=6, 
               min_child_weight=1, subsample=1, colsample_bytree=1)


xgb <- xgboost(data = dtrain, 
               label = n, 
               eta = 0.1,
               max_depth = 15, 
               nround=25, 
               subsample = 0.5,
               colsample_bytree = 0.5,
               seed = 1,
               eval_metric = "merror",
               objective = "multi:softprob",
               num_class = 12,
               nthread = 3)
summary(xgb)

y_pred <- predict(xgb, data.matrix(new_ts))
y_pred
                  
