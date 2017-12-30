
#import library
library(dplyr)
library(ggplot2)
library(tidyr)
library(knitr)

#read data from csv file
data <- read.csv("growth.csv",check.names=FALSE, sep=";")

#tranforming column in lines.
data_g <- data %>% 
  gather(key   = year,
         value = growth,
         2:3)
#filtering the data.         
datagroup <- data_g %>%
filter(!is.na(growth)) %>%
group_by(Country) 

# ploting the boxplot chart 
ggplot(aes(x = Country,y=growth),data=subset(datagroup, Country %in% c("Austria", "Brazil", "Greece", "Italy", "Japan","Philippines","Portugal","Spain","Taiwan"))) + 
  geom_boxplot(aes(color = Country))  +
  ggsave("bestgrowth.png")