#Load packages 
library(tidypaleo)
library(tidyverse)

#Set theme
theme_set(theme_bw(8))

#Convert data frame to from wide to long format, tell R which columns not to pivot

transects<-pivot_longer(transects, cols=c(-Distance,-Transect,-Total,-Elevation,-Code),names_to="species",values_to="rel_abund")

#Plot lateral foraminifera distribution 
P1<-ggplot(transects, aes(x = Distance,  y = rel_abund,group=1)) +
  geom_col(position="identity",width=2) +
  facet_abundance(vars(species)) +
  labs(x = "Distance (m)", y = "Relative abundance")

P1


#Plot elevation data - use theme element_blank() if you want to get rid of the x axis so it can plot on top of the foraminifera plot

P2<-ggplot(transects,aes(x=Distance, y=Elevation))+
geom_point()+
geom_line(size=0.5)+
geom_point(size=2)+
theme(axis.ticks = element_blank())+
theme(axis.title.x = element_blank())+
theme(axis.text.x = element_blank())+

P2

#Combine the plots together 

library(patchwork)

P2 / P1 + plot_layout(heights = c(0.25, 1)) 



