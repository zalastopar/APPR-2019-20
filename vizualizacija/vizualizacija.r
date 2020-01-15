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

require(viridis)
theme_set(
  theme_void()
)


# Uvozimo zemljevid.
zemljevid <- map_data('world')
colnames(drzave1)[1]= "region"


world_map <- map_data("world")
b <- left_join(drzave1, world_map, by = "region")

c <- ggplot(b, aes(long, lat, group = group))+
  geom_polygon(aes(fill = Freq ), color = "white")+
  scale_fill_gradient2(low = "blue", mid = "blue", high = "red",
                       midpoint = 10)
plot(c)



# Graf 1 - leto izdaje in rating
graf <- ggplot(filmi) + aes(x=imdbRating, y=Budget, size=imdbRating, color=Budget) + geom_point() + 
  scale_color_gradient2(midpoint=2000000, low="white", mid="blue",high="red", space ="Lab" )

print(graf)

                

#Graf 2 - leto izdaje
seznam2 <- data.frame(table(filmi$Year))
  
graf2 <- ggplot(seznam2) +  aes(x=Var1,y = Freq, fill=Freq) +geom_bar(stat = "identity") + 
  scale_fill_continuous(type = "viridis")  


plot(graf2)





