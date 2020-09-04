library(openxlsx)
library(lubridate)
library(tidyverse)
library(naniar)

#loading data
data_csv<-read.csv("Bangladesh_ER.csv",header = F, na = "#VALUE")
data_csv<- as.data.frame(data_csv)
data_csv<-data_csv[,-(9:11)]
  colnames(data_csv)<-c("gvkey","iid","datadate","conm","cshoc","ajexdi","prccd","trfd","Exch Rate")
						
#processing
data_csv$datadate <-ymd(data_csv$datadate)
data_csv<-arrange(data_csv,data_csv$datadate)
colSums(is.na(data_csv))  #issey NA dekhna h

#Checking for exchange rates
rate<-data_csv$`Exch Rate`
urate<- length(rate)
for (i in 1:urate){
  if(!(data_csv[i,9] == 1 && data_csv[i+1,9] == 1)){
    d <- year(data_csv$datadate[i])
    break
    }
  }


tt<-is.na(data_csv$`Exch Rate`)

for (i in nrow(data_csv):1){
  
  if(tt[i]== TRUE){
    data_csv[i,9]<-data_csv[i+1,9]
  }
}
data_csv<-na.omit(data_csv) #Deleting NA

y<-year(data_csv$datadate)
uy<-unique(y)
loop <- length(uy)
data <- vector()

for (i in nrow(data_csv):1){
  if(data_csv[i,9] == 1){
    if(y[i] > d){
      data_csv$`Exch Rate`[i]<-data_csv$`Exch Rate`[i+1]
    }
  }
}

data_csv<-mutate(data_csv,MarketCap=data_csv$cshoc*data_csv$`Exch Rate`*data_csv$prccd)




for (i in 1:loop) {
a<-filter(data_csv,year(data_csv$datadate)==uy[i])
#sum(a$Weight)
m<-month(a$datadate)
um<-unique(m)
loop2<-length(um)
for (j in 1:loop2) {
  a1<-filter(a,month(a$datadate)==um[j])
  a1$RS<- sum(a1$MarketCap)
  a1 <-mutate(a1,Weight=a1$MarketCap/a1$RS)%>%
  select(-c("RS"))
  data <- rbind(data,a1)
}
}
data<-arrange(data,data$conm)
write.xlsx(data,'Bangladesh_ER_sorted.xlsx')##

