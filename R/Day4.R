library(openxlsx)
library(lubridate)
library(tidyverse)
library(naniar)
library(readxl)

#Loading
data1 <- read_excel("India_Returns.xlsx")
data2 <- read_excel("Bangladesh_Returns.xlsx")
data3 <- read_excel("China_Returns.xlsx")
data4 <- read_excel("Indonesia_Returns.xlsx")
data5 <- read_excel("Malaysia_Returns.xlsx")
data6 <- read_excel("Pakistan_Returns.xlsx")
data7 <- read_excel("Phillipines_Returns.xlsx")
data8 <- read_excel("Srilanka_Returns.xlsx")
data9 <- read_excel("Taiwan_Returns.xlsx")
data10 <- read_excel("Thailand_Returns.xlsx")

data1<- rename(data1, "Weight" = "Weights")
data2<- rename(data2, "Weight" = "Weights")
data3<- rename(data3, "Weight" = "Weights")
data4<- rename(data4, "Weight" = "Weights")
data5<- rename(data5, "gvkey" = "gvkey.x")
data6<- rename(data6, "Weight" = "Weights")
data7<- rename(data7, "Weight" = "Weights")
data8<- rename(data8, "Weight" = "Weights")
data9<- rename(data9, "Weight" = "Weights")
data10<- rename(data10, "Weight" = "Weights")


data <- rbind(data,data10)

y<-year(data$datadate)
uy<-unique(y)
loop <- length(uy)
dworld <- vector()

for (i in 1:loop) {
  a<-filter(data,year(data$datadate)==uy[i])
  #sum(a$Weight)
  m<-month(a$datadate)
  um<-unique(m)
  loop2<-length(um)
  for (j in 1:loop2) {
    a1<-filter(a,month(a$datadate)==um[j])
    a1$RS<- sum(a1$MarketCap)
    a1 <-mutate(a1,Weight=a1$MarketCap/a1$RS)%>%
      select(-c("RS"))
    dworld <- rbind(dworld,a1)
  }
}

dworld <- arrange(dworld,dworld$iid,dworld$conm,dworld$datadate)

for (i in 4406:nrow(dworld)){
  if (dworld[i,12] == 0) {dworld[i,12] <- NA}
}

dworld$WeightedReturn <- dworld$Weight*dworld$Return

write.xlsx(dworld, "World_Returns.xlsx")