library(openxlsx)
library(lubridate)
library(tidyverse)
library(naniar)
library(readxl)

data <- read_excel("Thailand_Book.xlsx")
data <- data[,-(9:10)]
data <- na.omit(data)
data$BooktoMarket <- data$BookValue/data$MarketCap
q_marketcap <- quantile(data$MarketCap,.1,na.rm = T)
data_big <- filter(data, data$MarketCap > q_marketcap[1])
data_big$Category <-"Big" 
data_small <- filter(data, data$MarketCap <= q_marketcap[1])
data_small$Category <-"Small"
data<-rbind(data_big,data_small)

q_b2m <- quantile(data_big$BooktoMarket,c(.3,.7),na.rm = T)

data_value<- filter(data, data$BooktoMarket <= q_b2m[1])
data_neutral<-filter(data,data$BooktoMarket < q_b2m[2])
data_neutral<-filter(data_neutral,data_neutral$BooktoMarket > q_b2m[1])
data_growth<-filter(data, data$BooktoMarket >= q_b2m[2] )

data_value$Category2<- "Value"
data_neutral$Category2<- "Neutral"
data_growth$Category2<- "Growth"

data<-rbind(data_value,data_neutral,data_growth)
data$Category<-as.factor(data$Category)
data$Category2<-as.factor(data$Category2)

write.xlsx(data, "Thailand_Categorised.xlsx")
