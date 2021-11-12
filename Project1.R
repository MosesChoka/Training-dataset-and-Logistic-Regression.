getwd()
setwd()
install.packages("tidyverse")
library(caTools)
library(readr)
advertising <- read_csv("advertising.csv")
View(advertising)
# Partition data -train data(60%) & test data(40%)
set.seed(1234)
indexSet= sample(2,nrow(advertising),replace= T, prob=c(0.6,0.4))
train_set=advertising[indexSet==1,]
validation_set=advertising[indexSet==0,]

#logistic regression model
train_set
Y= train_set$`Clicked on Ad`
X1= train_set$`Daily Time Spent on Site`
X2= train_set$`Area Income`
X3= train_set$`Daily Internet Usage`
mymodel=glm(Y ~ X1+X2+X3,data=train_set, family='binomial')
summary(mymodel)
#Obtaining significant models use stepAIC() package other than testing single variables,this saves on time!
library(MASS)
mymodel2=stepAIC(mymodel)
summary(mymodel2)
