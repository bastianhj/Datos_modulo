#########################################
####### Bastián Henríquez ###############
####### Omar Perez ######################
####### FCFM ############################
####### Módulo Interdisciplinario #######
#########################################
install.packages('ggplot2')
install.packages('dplyr')
install.packages('sf')
install.packages('viridis')
library(ggplot2)
library(dplyr)
library(sf)
library(viridis)
########################################################################################################
### LOAD FILES FROM github

## fijar working directory --> importante usar "/", no "\"
setwd('your/path')

data<-read.csv('ExperienceMapsDataset.csv')


## ver columbas
colnames(data)

## explorar variables
data$HRV

## pueden filtar datos de un participante
data_p1<-data%>%filter(Participant==1)

#graficar una variable
plot(data_p1$HRV)


#filtar datos NA
data_p1<-data_p1%>%filter(!is.na(Latitude) & !is.na(Longitude))

## crear mapa base
pts <- st_as_sf(data_p1, coords = c("Longitude","Latitude"),
                crs = 4326, remove = FALSE)

## agregar info a mapa base
ggplot(pts) +
  geom_sf(aes(color = HRV), size = 2, alpha = 0.85) +
  scale_color_viridis_c(name = "HRV") +
  theme_minimal() +
  labs(x = NULL, y = NULL)
