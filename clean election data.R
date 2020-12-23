library(haven)
library(tidyverse)
library(dplyr)
setwd("C:/Users/livia/Desktop/school/sta304/final")
raw_data= read_dta("2019 Canadian Election Study - Online Survey v1.0.dta")
raw_data <- labelled::to_factor(raw_data)
reduced_data <- 
  raw_data %>% 
  select(cps19_age,
         cps19_gender,
         cps19_votechoice)
reduced_data <- 
  reduced_data %>% 
  select(cps19_age,
         cps19_gender,
         cps19_votechoice)
reduced_data<-reduced_data[complete.cases(reduced_data), ]
reduced_data<-
  reduced_data %>%
  filter(cps19_votechoice!= "Don't know/ Prefer not to answer" ) %>% 
  mutate(voteliberal = 
           ifelse(cps19_votechoice=="Liberal Party", 1, 0))  %>% 
  mutate(votecon = 
         ifelse(cps19_votechoice=="Conservative Party", 1, 0)) %>%
filter(cps19_gender!= "Other (e.g. Trans, non-binary, two-spirit, gender-queer)" )

reduced_data<-reduced_data%>%
  rename(SEX = cps19_gender) %>%
  rename(age= cps19_age ) 
reduced_data<-reduced_data%>%
  mutate(SEX = ifelse(SEX== "A man",1,0))
reduced_data<-reduced_data%>%
  mutate(SEX = ifelse(SEX == 1,"Male","Female"))
write_csv(reduced_data, "elecdata.csv")

