# https://r-graph-gallery.com/95-violin-plot-with-ggplot2.html
library(ggplot2)
library(tidyverse)
library(dplyr)
# create a dataset
data <- data.frame(
  name=c( rep("A",500), rep("B",500), rep("B",500), rep("C",20), rep('D', 100)  ),
  value=c( rnorm(500, 10, 5), rnorm(500, 13, 1), rnorm(500, 18, 1), rnorm(20, 25, 4), rnorm(100, 12, 1) ) %>% round(2)
)

data %>% group_by(name) %>% summarise(n = n())

# Most basic violin chart
p <- ggplot(data, aes(x=name, y=value, fill=name)) + # fill=name allow to automatically dedicate a color for each group
  geom_violin()
p

# From wide format
# wide data -> long data
data_wide <- iris[ , 1:4]
data_wide %>% 
  gather(key="MesureType", value="Val") %>%
  ggplot( aes(x=MesureType, y=Val, fill=MesureType)) +
  geom_violin()