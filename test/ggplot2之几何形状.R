library(tidyverse)
df <- read_csv("./data/datasaurus.csv")

df %>%
  group_by(dataset) %>%
  summarise(
    across(everything(), list(mean = mean, sd = sd), .names = "{fn}_{col}")
  ) %>%
  mutate(
    across(is.numeric, round, 3)
  )