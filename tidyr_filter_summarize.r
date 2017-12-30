#import libraries
library(dplyr)
library(tidyr)
library(knitr)

#import dataset
data <- read.csv("growth.csv",,check.names=FALSE, sep=";")

#gather the data from the dataset
data_g <- data %>% 
  gather(key   = year,
         value = growth,
         2:3)
# exclude NA and group by country and 
# summarize by the mean from the growth
data_g %>% 
filter(!is.na(growth)) %>%
group_by(Country) %>%
summarize(means = mean(growth)) %>%
arrange(desc(means))
