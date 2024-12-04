library(tidyverse)
library(sf)
library(stars)

library("rnaturalearth")
library("rnaturalearthdata")
world_map_data <- ne_countries(scale = "medium", returnclass = "sf")

ggplot(data = world_map_data) +
  geom_sf()
