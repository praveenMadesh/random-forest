library(randomForest)
#in built data (iris)
data(iris)
View(iris)
str(iris)
summary(iris)

##partition of data into train and test data
set.seed(111)
p <- sample(2,nrow(iris),replace = TRUE,prob = c(0.7,0.3))
train <- iris[p==1,]
test <- iris[p==2,]

##data for developing the model
table(train$Species)
prop.table(table(train$Species))*100 ### to know the percentage of classes
summary(train)

## prediction model for random forest
rf_iris <- randomForest(Species~.,data=train)

####prediction for test data
confusionMatrix(predict(rf_iris,test),test$Species,positive = "1")### 90% accuracy

####prediction for train data
confusionMatrix(predict(rf_iris,train),train$Species,positive = "1")###100%accuracy

###visualization 
plot(fit.forest,lwd=2)
legend("topright", colnames(fit.forest$err.rate),col=1:4,cex=0.8,fill=1:4)
