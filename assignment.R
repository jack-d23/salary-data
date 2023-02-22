library(dplyr)
library(lattice)
library(tidyverse)
library(ggplot2)
library(plyr)
df <- read.csv('datascience_salaries.csv')
df$job_title<-as_factor(df$job_title)
df$job_type<-as.factor(df$job_type)
df$experience_level<-as.factor(df$experience_level)
df$location<-as_factor(df$location)
df$salary_currency<-as_factor(df$salary_currency)
df$salary<-as_factor(df$salary)
View(df)
summary(df)
glimpse(df)
colSums(is.na(df))

df$salary_currency[df$salary_currency=='EUR']= 'USD'
df$salary_currency[df$salary_currency== 'GBP']= 'USD'

df %>% ggplot(aes(job_type))+
  geom_bar(stat="Count",fill="#059033")

df2=subset(df,job_type=="Full Time")
View(df2)

df2 %>% ggplot(aes(job_title))+
  geom_bar(stat="Count",fill="#059033")

d3=subset(df2,job_title=="Data analyst")
d4=subset(df2,job_title=="Data scientist")
d5=subset(df2,job_title=="Machine learning")

d6=rbind(d3,d4,d5)
d6 %>% ggplot(aes(experience_level))+
  geom_bar(stat="Count",fill="#059033")

d7=subset(d6,experience_level=='Mid')
d8=subset(d6,experience_level=="Senior")
d9=rbind(d7,d8)

count(d9,'experience_level')
histogram(~salary|experience_level,data=d9)

d10=subset(d9,experience_level=="Senior")

count(d10,"job_title")
histogram(~salary|job_title,data=d10)
View(df)



