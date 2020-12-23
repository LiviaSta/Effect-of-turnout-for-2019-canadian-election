library(haven)
library(tidyverse)
library(dplyr)
setwd("C:/Users/livia/Desktop/school/sta304/final")
rawdata= read_csv("gss.csv")
rawdata <- labelled::to_factor(raw_data)
reduceddata <- 
  rawdata %>% 
  select(age,
         sex)

reduceddata<-
  reduceddata %>%
  filter(age> 16 ) 

reduceddata$age <- as.integer(reduceddata$age)

reduceddata <- 
  reduceddata %>%
  count(age,sex) %>%
  group_by(age,sex) 
reduceddata<-reduceddata%>%
  rename(SEX = sex)
write_csv(reduceddata, "gss18.csv")