# 3. faza: Vizualizacija podatkov

# Uvoz potrebnih knjižnic
library(tmap)
library(ggplot2)
library(rgdal)
library(rgeos)
library(maptools)
library(tidyverse)
library(rvest)
library(magrittr)
library(ggmap)
library(stringr)
library(dplyr)
library(nlme)
source("https://raw.githubusercontent.com/jaanos/APPR-2019-20/master/lib/uvozi.zemljevid.r")
library(sf)
library(stringr)
library(scales)



# UZemljevid.
world_map <- map_data("world")
a <- data.frame(table(drzave$region))
colnames(a)[1] <- "region"
b <- full_join(a, world_map, by = "region")

c <- ggplot(b, aes(long, lat, group = group))+
  geom_polygon(aes(fill = Freq ), color = "white")+
  scale_fill_gradient2(low = "blue", mid="red", high = "yellow",midpoint = 2 ) + 
  theme_void()



# Graf 1 - leto izdaje, dolžina in rating
graf1 <- ggplot(filmi) + aes(x=imdbRating, y=Budget, color=Runtime) + geom_point(size=6) + 
  scale_color_gradient2(midpoint=150, low="blue", mid="red",high="yellow", space ="Lab" )





#Graf 2 - leto izdaje
seznam2 <- data.frame(table(filmi$Year))
colnames(seznam2) <- c("Year", "Frequency")

graf2 <- ggplot(seznam2) +  aes(x=Year,y = Frequency, fill=Frequency) +geom_bar(stat = "identity") + 
  scale_fill_continuous(type = "viridis")



#Graf 3 - žanr, leto, revenue

graf3 <- ggplot(filmi) + aes(x=imdbRating, y=Budget, size=imdbRating, color=Budget) + geom_point() + 
  scale_color_gradient2(midpoint=2000000, low="white", mid="blue",high="red", space ="Lab" )







