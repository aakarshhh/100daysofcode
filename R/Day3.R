#library(openxlsx)
#library(lubridate)
#library(tidyverse)
#library(naniar)
#library(readxl)

#Loading
data <- read_excel("Malaysia.xlsx", sheet = 2)
d <- read_excel("Malaysia_sorted.xlsx")

#Filtering
data <- data[,-(8:10)]
data$datadate <- ymd(data$datadate)
data$Returns[is.na(data$Returns)] <- 0
data <- na.omit(data)

#Merge
d1 <- vector()
d1 <- left_join(d,data)

d1$datadate <- ymd(d1$datadate) 
d1 <- arrange(d1,d1$iid,d1$conm,d1$datadate)
write.xlsx(d1, "Malaysia_Returns.xlsx")
