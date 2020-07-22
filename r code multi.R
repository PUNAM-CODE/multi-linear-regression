############multilenear ques150_satrt data############
library(readr)
X50_start <- read_csv("E:/data science r studio/Assignment code 1/muti enear regretion/50_start.csv")
View(X50_start)
X50_start1<-X50_start[,-4]
View(X50_start1)
dim(X50_start1)

X50_start1$State<-factor(x50_start$State,levels = c("New York","California","Florida"),labels=c(1,2,3))
View(X50_start)
dim(X50_start1)
summary(X50_start1)

plot(X50_start1)
pairs(X50_start1)

#find corelatiom fo data
cor(X50_start1)

#corelation matrix
#install pakage corpor
install.packages("corpcor")
library(corpcor)
cor2pcor(cor(X50_start1))

##builed the model
#lm y~x
start<-lm(Profit~.,data = X50_start1)
summary(start)

# in above summary r^2 is 0.95 but administation &marketing is not significant
#hence,check colinearity of administration
modelA<-lm(Profit~Administration,data=X50_start1)
summary(modelA)  ##it is not significant

#check the marrketing spend is significant or not

modelM<-lm(Profit~ Marketing,data=X50_start1)
summary(modelM) ##marketing is significant

#ckeck the both are significant or not<-lm(Profit~)
modelAM<-lm(Profit~ Administration + Marketing,data=X50_start1)
summary(modelAM)##both are significant

#Aply the vif funcation variance inflaction factore
#install a package car check colinearity  
install.packages("car")
library(car)
vif(start)

#ckeck the least conribution added variable plot

avPlots(start)

#influence  obsrvation
 install.packages(cars)
 influence.measures(start)
influenceIndexPlot(start)
influencePlot(start, n=3)
##influence rows is 50  hence delete the 50

model1<-lm(Profit~.,data=X50_start1[-50,])
summary(model1)
# After  the deleting the 50 R^2 is 0.96 but adm & Marketspend is not significant

#delet 50&49 observation

model2<-lm(Profit~.,data=X50_start1[-c(46,50),])
summary(model2)

modelf1<-lm(Profit~RD + Marketing ,data=X50_start1[-c(46,50),])
summary(modelf1)

##cross validation
plot(modelf1)

#trainning testing
modelfinal<-lm(Profit~log(RD)+log(Marketing),data = X50_start1[-c(46,50),])
summary(modelfinal)

mean(modelf1$residuals)
sqrt(mean(modelf1$residuals**2))

library(caTools)
library(caTools)
start1<-X50_start1[-50,]
split<-sample.split(start1$Profit,SplitRatio = 0.70)
split
table(split)

X50_start1.train<-subset(start1,split=TRUE)
X50_start1.test<-subset(start1,split=FLASE)

#builed the moel
model.train<-lm(Profit~RD+Marketing,X50_start1.train)
summary(model.train)

mean(model.train$residuals)
trainrmse<-sqrt(mean(model.train$residuals**2)/nrow(X50_start1))
trainrmse
plot(trainrmse)

#pridictin on test
predtest<-predict(model.train,X50_start1.test)
predtest
testing_error<-X50_start1.test$Profit-predtest

#clculate rmse
test_rmse<-sqrt(mean(testing_error**2))
test_rmse



