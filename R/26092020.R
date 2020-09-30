library(openxlsx)
library(lubridate)
library(tidyverse)
library(naniar)
library(readxl)

capr1 <- read_excel("World_capr1.xlsx")
lcuacu <- read_excel("World_lcuacu.xlsx")
pcl <- read_excel("World_pcl.xlsx")
npat <- read_excel("World_npat.xlsx")

capr1na <- na.omit(capr1$capr1)
capr1per <- length(capr1na)/(nrow(capr1))*100

lcuacuna <- na.omit(lcuacu$lcuacu)
lcuacuper <- length(lcuacuna)/(nrow(lcuacu))*100

pclna <- na.omit(pcl$pcl)
pclper <- length(pclna)/(nrow(pcl))*100

npatna <- na.omit(npat$npat)
npatper <- length(npatna)/(nrow(npat))*100

e<-data.frame("Country"=c("World"),"capr1"=capr1per ,"pcl"=pclper ,"npat"=npatper, "lcuacu"= lcuacuper) 
#final <- data.frame()
final <- rbind(final,e)

write.xlsx(final, "Data_Accuracy.xlsx")
