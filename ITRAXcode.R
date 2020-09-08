#Load libraries and set theme
library(tidyr)
library(tidyverse)
library(tidypaleo)
theme_set(theme_bw(8))

#Change data from wide to long format and tell R which columns to exclude

ITRAX<-pivot_longer(ITRAX, -1, names_to="parameter", values_to = "value")

ggplot(ITRAX, aes(x = Depth , y = value))+
  labs(x = "Depth (cm)")+
  geom_line() +
  coord_flip() +
  scale_x_reverse() +
  facet_wrap(vars(parameter), nrow=1, scales = "free_x")
