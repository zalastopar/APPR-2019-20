# 3. faza: Vizualizacija podatkov

# Uvoz potrebnih knjižnic
library(tmap)
source("https://raw.githubusercontent.com/jaanos/APPR-2019-20/master/lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
zemljevid <- data("World")



filmi$Country <- gsub("New Zealand", "Newzealand", filmi$Country)
filmi$Country <- gsub(" ", "", filmi$Country)
drzava <- filmi$Country %>% strapplyc("([[:alpha:]]+)")

Title <- lapply(1:nrow(filmi), . %>% { rep(filmi$Title[.], length(drzava[[.]])) })

drzave <- data.frame(Title=unlist(Title), drzava=unlist(drzava))

a <- left_join(filmi[,-7], drzave, by  = "Title")
a$drzava <- gsub("USA", "United States" , a$drzava) 
a$drzava <- gsub("Newzealand", "New Zealand" , a$drzava) 
