library(tidyr)
plant_height <- data.frame(
  Day = 1:5,
  A = c(0.7, 1.0, 1.5, 1.8, 2.2),
  B = c(0.5, 0.7, 0.9, 1.3, 1.8),
  C = c(0.3, 0.6, 1.0, 1.2, 2.2),
  D = c(0.4, 0.7, 1.2, 1.5, 3.2)
)


plant_height %>% filter( A >= 0.8)
long <- plant_height %>% 
  pivot_longer(
    cols = A:D,
    names_to = "plant",
    values_to = "height"
  )
long %>% ggplot(aes(x = Day, y = height, colour = plant)) + geom_line()