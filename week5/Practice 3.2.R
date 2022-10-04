## week 5 Practice 3.2

#load package
library(tidyverse)

#create initial data frame
before_diet <- c(104,95,87,77,112)
after_diet <- c(96,91,81,75,118)
diet <- data.frame(before_diet,after_diet)
rownames(diet) <- paste("subject_",c(1:5),sep="")
str(diet)

#reformat data frame "diet" 
diet_r <- diet %>% 
  pivot_longer(before_diet:after_diet, names_to="time", values_to="weight") %>%
  as.data.frame()
diet_r$time <- as.factor(diet_r$time)
typeof(diet_r$weight)
str(diet_r)

#create "WEIGHT_LOSS" list
subject <- rownames(diet)
weight_loss <- c((diet[,2]-diet[,1])/diet[,1]*100)
w_data <- data.frame(subject,weight_loss)
WEIGHT_LOSS <- list(subject=subject,weight_loss=weight_loss,w_data=w_data)
str(WEIGHT_LOSS)

#message
text <- "It's challenging but interesting. I wish I could feel the same when manipulating complicated data."

#create "BUBBLE_DIET" list
BUBBLE_DIET <- list(diet_r=diet_r,WEIGHT_LOSS=WEIGHT_LOSS,message=text)
str(BUBBLE_DIET)
BUBBLE_DIET


