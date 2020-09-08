#Load packages and set theme
library(tidypaleo)
library(tidyverse)
theme_set(theme_bw(8))

#Change data from wide format to long format and tell R which columns to exclude

core<-pivot_longer(lgcore, -1, names_to="species", values_to = "rel_abund")

core_plot <- ggplot(core, aes(x = rel_abund, y = Depth,fill=species)) +
  geom_colh(width=0.15) +
  scale_y_reverse() +
  facet_abundanceh(vars(species)) +
labs(x = "Relative abundance (%)", y = "Depth (cm)")

core_plot

