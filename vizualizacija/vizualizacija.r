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



# Uvozimo zemljevid.
colnames(drzave1)[1]= "region"
#source("https://raw.githubusercontent.com/jaanos/APPR-2019-20/master/lib/uvozi.zemljevid.r")
#svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip",
                        # "ne_50m_admin_0_countries", encoding="UTF-8")

#tm_shape(merge(svet, drzave1, by.x="region", by.y="region")) + tm_polygons("Freq")





world_map <- map_data("world")
b <- full_join(drzave1, world_map, by = "region")

c <- ggplot(b, aes(long, lat, group = group))+
  geom_polygon(aes(fill = Freq ), color = "white")+
  scale_fill_gradient2(low = "blue", mid = "blue", high = "red",midpoint = 10) + 
  theme_void()
plot(c, axes=FALSE)



# Graf 1 - leto izdaje in rating
graf1 <- ggplot(filmi) + aes(x=imdbRating, y=Budget, size=imdbRating, color=Budget) + geom_point() + 
  scale_color_gradient2(midpoint=2000000, low="white", mid="blue",high="red", space ="Lab" )

print(graf1)

                

#Graf 2 - leto izdaje
seznam2 <- data.frame(table(filmi$Year))
colnames(seznam2) <- c("Year", "Frequency")

graf2 <- ggplot(seznam2) +  aes(x=Year,y = Frequency, fill=Frequency) +geom_bar(stat = "identity") + 
  scale_fill_continuous(type = "viridis")  


plot(graf2)





