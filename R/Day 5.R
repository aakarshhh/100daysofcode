library(openxlsx)
library(lubridate)
library(tidyverse)
library(naniar)
library(readxl)

#Loading
world <- read_excel("World_Returns.xlsx")
annual <- read.csv("ANN_FUND_Bank1.csv")
annual$datadate <- ymd(annual$datadate)
#annual$Year <- year(annual$datadate)+1
world$Year <- year(world$datadate)
wwj <- filter(world,month(world$datadate) == 6)
d3 <- filter(annual,month(annual$datadate) == 12)
d4 <- filter(annual,month(annual$datadate) == 3)
d3$Year <- year(d3$datadate)
d4$Year <- year(d4$datadate)-1
annual <- rbind(d3,d4)

world1 <- left_join(world,annual, by = c("gvkey","Year"))
wwj1 <- left_join(wwj,annual, by = c("gvkey","Year"))

world2 <- world1[,c(1,2,3,4,10,11,12,13,17,18)]
wwj2 <- wwj1[,c(1,2,3,4,10,11,12,13,17,18)]

world2 <- rename(world2, "datadate" = "datadate.x")
wwj2 <- rename(wwj2, "datadate" = "datadate.x")

world2$BookValue <- world2$at - world2$lt
wwj2$BookValue <- wwj2$at - wwj2$lt

write.xlsx(world2, "World_Book_With_July.xlsx")
write.xlsx(wwj2, "World_Book_Without_July.xlsx")

wwj3 <- wwj2[,c(1,2,3,4,9,10,11)]

Thailand <- read_excel("Thailand_Returns.xlsx")
Thailand <- Thailand[,c(1,2,3,4,10,11,12,13)]
Thailand1 <- left_join(Thailand,wwj3, by = c("gvkey","datadate","conm","iid"))
write.xlsx(Thailand1, "Thailand_Book_Without_July.xlsx")

Thailand <- read_excel("Thailand_Book_Without_July.xlsx")
Thailand1 <- filter(Thailand,month(Thailand$datadate) == 6)
Thailand1 <- arrange(Thailand1, Thailand1$iid, Thailand1$conm, Thailand1$datadate)
write.xlsx(Thailand1,"Thailand_Book.xlsx")



