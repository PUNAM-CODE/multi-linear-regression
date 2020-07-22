#####################multilinear regretion###########
#########toyota#########
library(readr)
toyota <- read_csv("E:/data science r studio/Assignment code 1/muti enear regretion/toyota.csv")
View(toyota)
#
#check the na value
toyota1<-is.na.data.frame(toyota)
sum(is.na.data.frame(toyota))
toyota1# na values
dim(toyota)


#check summary
?dataframe
summary(toyota)
2+2
toyota1<-toyota[-c(1,2)]
View(toyota1)

install.packages("fastDummies")
library(fastDummies)
result<-fastDummies::dummy_cols(toyota$Fuel_Type)
result1<-fastDummies::dummy_cols(toyota$Color)
append(,result,after = 3)
View(result1)
?append
View(toyota1)
toyota2<-concatenate::toyota1+result+result1
View(toyota2)
#toyota1$Fuel_Type<-factor(toyota1$Fuel_Type,levels = c("Petrol","Diesel","CNG"),labels = c(1,2,3),data=nominal)
#View(toyota)
install.packages("concatenate")
library(concatenate)
?concatenate
concatenate(toyota,collapse="result",rm.space =FALSE)
toyota1<-paste(toyota,result,result1)
