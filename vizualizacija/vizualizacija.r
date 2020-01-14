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

# Uvozimo zemljevid.






# Graf 1 - leto izdaje in rating

                
plot(graf1)

#Graf 2 - leto izdaje
seznam2 <- data.frame(table(filmi$Year))
graf2 <- ggplot(seznam2 %>% 
                  aes(x=Var1, y=Freq, size=MathAch) + geom_point())

plot(graf2)

zala <- table(filmi$Year)

