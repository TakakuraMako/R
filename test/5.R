library(ggplot2)
library(tidyverse)
library(readxl)
data <- read_excel(here::here("data", "北京月均气温.xlsx"))
data %>% head(5)

ggplot(data = data %>% filter(AverageTemperature >= 10), aes(x = Time, y = AverageTemperature)) + 
  geom_point(aes(color = AverageTemperature)) + 
  geom_smooth(method = "lm") +
  xlab("year") + ylab("Tempreture") + 
  ggtitle("温度")

# ggsave(
#   plot = p1,
#   filename = "my_plot.pdf",
#   width = 8,
#   height = 6,
#   dpi = 300
# )