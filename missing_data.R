#lecture of data
train <- read.csv("~/House_Price_Regression/datos/train.csv")
test <- read.csv("~/House_Price_Regression/datos/test.csv")
#dimentions for data train and test
dim(train)
dim(test)
# check missing values for train and test

sort(sapply(train, function(x) { sum(is.na(x)) }), decreasing=TRUE)
sort(sapply(test, function(x) { sum(is.na(x)) }), decreasing=TRUE)

train2<-train #I only create a backup copy for train
test2<-test  # I only create a backup copy for test
test2$SalePrice <- NA # creation of the Saleprice column to assign the value of NA

train2$control<-TRUE #asignement TRUE for control train2
test2$control<-FALSE # asignement FALSE for control test2
#verify names

names(test2)==names(train2) #comparation names train2 and test2
ncol(train)#train number col of train data
ncol(train2) #number col of train + control(TRUE)
ncol(test) #number col of test
ncol(test2) # number col of test + control(FALSE) + prices(NA)
data.full<-rbind(train2,test2) #combining data
dim(data.full) #dimentions of "data.full"
sort(sapply(data.full, function(x) { sum(is.na(x)) }), decreasing=TRUE)
summary(data.full)
datos<-data.full[,-1]
library(corrplot)
str(datos)
sort(sapply(datos, function(x) { sum(is.na(x)) }), decreasing=TRUE)
imp <- mice(datos, m=1, method='cart', printFlag=FALSE)
#al final

train2<-data.full[data.full$control==TRUE,]
test2<-data.full[data.full$control==FALSE,]
datos$SaleType
