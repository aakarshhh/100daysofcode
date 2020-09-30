library(openxlsx)
library(lubridate)
library(tidyverse)
library(naniar)
library(readxl)

capr1<-read_excel("Thailand_capr1.xlsx")
lcuacu<-read_excel("Thailand_lcuacu.xlsx")
npat<-read_excel("Thailand_npat.xlsx")
pcl<-read_excel("Thailand_pcl.xlsx")


capr1<-capr1[,9] 
capr1 <-  na.omit(capr1)
q_capr1<-quantile(capr1,c(.33333,.66666),na.rm = T)

lcuacu<-lcuacu[,9] 
lcuacu <-  na.omit(lcuacu)
q_lcuacu<-quantile(lcuacu,c(.33333,.66666),na.rm = T)

npat<-npat[,9] 
npat <-  na.omit(npat)
q_npat<-quantile(npat,c(.33333,.66666),na.rm = T)

pcl<-pcl[,9] 
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

e<-data.frame("Country"=c("Thailand"),"Ratio 1"=r1 ,"Ratio 2"=r2 ,"Ratio 3"=r3 )
#final<-e
  final<-rbind(final,e)
  
write.xlsx(final,"Ratio.xlsx")  


  