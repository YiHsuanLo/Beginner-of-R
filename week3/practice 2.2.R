setwd("C:\\Users\\user\\Desktop\\Hsuan\\Courses\\111-1\\Ecological data analysis in R\\Beginner-of-R\\week3_4")
library(dplyr)
library(tidyr)
rairuoho <- read.table("https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt",header=T)
head(rairuoho)
rairuoho$treatment <- ifelse(rairuoho$treatment=="nutrient","enriched","water")
head(rairuoho)
rairuoho_long <- rairuoho %>% pivot_longer(day3:day8,names_to="day",values_to="length")
head(rairuoho_long)
rairuoho_long_u <- unite(rairuoho_long,"spatial",spatial1:spatial2,remove=T)
head(rairuoho_long_u)
rairuoho_long_u[,c("row","column")] <- NULL
head(rairuoho_long_u)

