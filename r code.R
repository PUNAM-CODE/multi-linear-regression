##################################computer data mutilinear regresstion#########
library(readr)
computedata <- read_csv("E:/data science r studio/Assignment code 1/muti enear regretion/computedata.csv")
View(computedata)
colnames(computedata)
summary(computedata)
str(computedata)
################EDA#################
####create a dummy variable
computedata$cd<-ifelse(computedata$cd=="no",0,1)
computedata$multi<-ifelse(computedata$multi=="no",0,1)
computedata$premium<-ifelse(computedata$premium=="no",0,1)

View(computedata)

cor(computedata)
plot(computedata)
pairs(computedata)

install.pakages("GGally")
librrary(ggally)
ggpairs(copmputedata)
