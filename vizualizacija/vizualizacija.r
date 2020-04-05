# 3. faza: Vizualizacija podatkov

# Uvoz potrebnih knjižnic
library(tmap)
library(ggplot2)
library(rgdal)
library(magrittr)
library(stringr)
library(dplyr)
library(nlme)
source("https://raw.githubusercontent.com/jaanos/APPR-2019-20/master/lib/uvozi.zemljevid.r")
library(sf)
library(stringr)
library(scales)
library(maptools)
library(tidyverse)
library(ggmap)
library(maps)



# Zemljevid
world_map <- map_data("world")
a <- data.frame(table(drzave$region))
colnames(a)[1] <- "region"
b <- full_join(a, world_map, by = "region")

c <- ggplot(b, aes(x =long,y= lat, group = group, fill=factor(Freq)))+
  geom_polygon(color="white") + 
  scale_fill_manual(na.value="grey", values = c("firebrick3", "firebrick1", "brown1", "coral1", "gold", "yellow", "chartreuse", "chartreuse3", "aquamarine", "cyan")) +
  theme_void() + coord_equal() + labs(fill="Frequency") + 
  theme(legend.position="bottom")
  



# Graf 1 - dobiček, dolžina in rating
graf1 <- ggplot(filmi) + aes(x=imdbRating, y=Revenue, color=Runtime) + geom_point(size=6) + 
  scale_color_gradient2(midpoint=150, low="blue", mid="red",high="yellow", space ="Lab" ) + 
  labs(y = "Revenue [mio]")



#Graf 2 - leto izdaje
seznam2 <- data.frame(table(filmi$Year))
colnames(seznam2) <- c("Year", "Frequency")

graf2 <- ggplot(seznam2,  aes(x=Year,y = Frequency)) + geom_col(fill="red", color="white") + 
  scale_x_discrete(breaks = c(1925, 1950,1975, 2000))
 
  

#Graf 3 - zanr, leto, rating
zanri <- data.frame(table(zvrsti$Genre))
zanri_doloceni <- zanri %>% filter(Freq >= 30)
zvrsti_dolocene <- zvrsti %>% filter(Genre %in% zanri_doloceni$Var1)

zvrsti_dolocene <- left_join(filmi, zvrsti_dolocene, by  = "Title")[c(1, 2, 4, 9)]
zvrsti_dolocene <- na.omit(zvrsti_dolocene)


graf3 <- ggplot(zvrsti_dolocene,  aes(x = Year, y=imdbRating, color=Genre)) + 
  geom_point(size = 2) + scale_color_manual(values=c("red", "orange", "yellow", "green", "royalblue","deeppink"))



#Graf 4 - studijo, rating, budget
g4 <- data.frame(table(filmi$Production))
g4 <- g4 %>% filter(Freq >=15)
  
graf4 <- ggplot(filmi %>% filter(Production %in% g4$Var1),aes(x = imdbRating, y = Budget, color = Production)) + 
  geom_point(size = 3) + scale_color_manual(values=c("red", "yellow", "green", "royalblue", "deeppink")) + 
  labs(y = "Budget [mio]")

#Graf 5 - jezik
g5 <- data.frame(table(jeziki$Language))
graf5 <- ggplot(g5,  aes(x = Var1, y = Freq, color = Var1)) + geom_point(shape = 15, size = 6) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  scale_y_log10() + theme(legend.position = "none") + 
  labs(x = "Language", y = "Frequency") 












