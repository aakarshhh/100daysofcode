library(openxlsx)
library(lubridate)
library(tidyverse)
library(naniar)
library(readxl)

#Loading
world <- read_excel("Thailand_Book.xlsx")
annual <- read_excel("24092020.xlsx")
annual$datadate <- ymd(annual$datadate)
annual$Year <- year(annual$datadate)+1
world$Year <- year(world$datadate)
wwj <- filter(world,month(world$datadate) == 6)
d3 <- filter(annual,month(annual$datadate) == 12)
d4 <- filter(annual,month(annual$datadate) == 3)
d3$Year <- year(d3$datadate)
d4$Year <- year(d4$datadate)-1
annual <- rbind(d3,d4)

world1 <- left_join(world,annual, by = c("gvkey","Year"))
world2 <- world1[,-c(5:8,11:15)]
world2 <- rename(world2, "datadate" = "datadate.x")
world2$capr1 <- (world2$at - world2$lt)/world$at
world2 <- world2[,-(5:6)]
world2 <- distinct(world2)
world2 <- na.omit(world2)

capr1<-world2[,8] 
capr1 <-  na.omit(capr1)
q_capr1<-quantile(capr1,c(.33333,.66666),na.rm = T)

lcuacu<-world2[,6] 
lcuacu <-  na.omit(lcuacu)
q_lcuacu<-quantile(lcuacu,c(.33333,.66666),na.rm = T)

npat<-world2[,5] 
npat <-  na.omit(npat)
q_npat<-quantile(npat,c(.33333,.66666),na.rm = T)

pcl<-world2[,7] 
pcl <-  na.omit(pcl)
q_pcl<-quantile(pcl,c(.33333,.66666),na.rm = T)


capr1_q1<- filter(capr1 , capr1 <= q_capr1[1])
capr1_q2<- filter(capr1 , capr1 >= q_capr1[2])


lcuacu_q1<- filter(lcuacu , lcuacu <= q_lcuacu[1])
lcuacu_q2<- filter(lcuacu , lcuacu >= q_lcuacu[2])


npat_q1<- filter(npat , npat <= q_npat[1])
npat_q2<- filter(npat , npat >= q_npat[2])


pcl_q1<- filter(pcl , pcl <= q_pcl[1])
pcl_q2<- filter(pcl , pcl >= q_pcl[2])

sum_capr1_q1 <- sum(capr1_q1)
sum_capr1_q2 <- sum(capr1_q2)

sum_pcl_q1 <- sum(pcl_q1)
sum_pcl_q2 <- sum(pcl_q2)

sum_lcuacu_q1 <- sum(lcuacu_q1)
sum_lcuacu_q2 <- sum(lcuacu_q2)

sum_npat_q1 <- sum(npat_q1)
sum_npat_q2 <- sum(npat_q2)

a<-sum_npat_q1
b<-sum_lcuacu_q1
c<-sum_npat_q2
d<-sum_lcuacu_q2
r1<-(a/b)-(c/d) 


a<-sum_pcl_q2
b<-sum_lcuacu_q2
c<-sum_pcl_q1
d<-sum_lcuacu_q1

r2<- a/b-c/d

a<-sum_capr1_q2
b<-1
c<-sum_capr1_q1
d<-1

r3<- a/b-c/d

loss <- (nrow(world2)/nrow(world1))*100

e<-data.frame("Country"=c("Thailand"),"Ratio 1"=r1 ,"Ratio 2"=r2 ,"Ratio 3"=r3,"Accuracy"=loss)
# final<-e
final<-rbind(final,e)
final<-distinct(final)


write.xlsx(final, "Data_Final_With_Accuracy.xlsx")
