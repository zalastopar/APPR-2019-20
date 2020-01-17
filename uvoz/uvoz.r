# 2. faza: Uvoz podatkov

filmi1 <- read_csv("podatki/IMDB_Top250Engmovies2_OMDB_Detailed.csv", na = "N/A")[,c(2:3, 6:7, 12, 13, 19, 21, 34, 36)]


filmi2 <- read_csv("podatki/movies_budget.csv", na = "N/A")[, 9]
colnames(filmi2) <- "Budget"




tabela <- cbind(filmi1, filmi2)

filmi_gross <- NULL
for (i in seq(1, 250, 50)) {
  link <- sprintf("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating,desc&start=%d", i)
  stran <- read_html(link)
  imdbID <- stran %>% html_nodes(xpath="//h3[@class='lister-item-header']/a") %>% html_attr("href") %>%
    strapplyc("tt[^/]+") %>% unlist()
  Gross <- stran %>% html_nodes(xpath="//p[@class='sort-num_votes-visible']") %>%
    lapply(. %>% html_nodes(xpath="./span[@name='nv'][2]") %>% html_text() %>% parse_number() %>%
             { ifelse(is.null(.), NA, .) }) %>% unlist()
  filmi_gross <- rbind(filmi_gross, data.frame(imdbID, Gross, stringsAsFactors=FALSE))
}
filmi <- left_join(tabela, filmi_gross)

filmi[,12] <- filmi[,12] * 1000000
colnames(filmi)[which(names(filmi) == "Gross")] <- "Revenue"




# write.csv(filmi, "C:/Users/Marko/Documents/AMAT/analiza_filmov/APPR-2019-20/podatki/filmi.csv")

#čiščcenje

#države
filmi$Country <- gsub(" ", "", filmi$Country)
drzava <- filmi$Country %>% strapplyc("([[:alpha:]]+)")
Title <- lapply(1:nrow(filmi), . %>% { rep(filmi$Title[.], length(drzava[[.]])) })
drzave <- data.frame(Title=unlist(Title), region=unlist(drzava))
drzave <- left_join(filmi[1], drzave, by  = "Title")
drzave$region <- gsub("([a-z])([A-Z])", "\\1 \\2", drzave$region)
drzave$region <- gsub("UAE", "United Arab Emirates", drzave$region)




#zvrst
filmi$Genre <- gsub("-", "", filmi$Genre)
zvrst <- filmi$Genre %>% strapplyc("([[:alpha:]]+)")
Title <- lapply(1:nrow(filmi), . %>% { rep(filmi$Title[.], length(zvrst[[.]])) })
zvrsti <- data.frame(Title=unlist(Title), Genre=unlist(zvrst))
zvrsti <- left_join(filmi[1], zvrsti, by = "Title")


#zvrsti1 <- data.frame(table(zvrsti$Genre))

#jezik
jezik <- filmi$Language %>% strapplyc("([[:alpha:]]+)")
Title <- lapply(1:nrow(filmi), . %>% { rep(filmi$Title[.], length(jezik[[.]])) })
jeziki <- data.frame(Title=unlist(Title), Language=unlist(jezik))
jeziki <- left_join(filmi[1], jeziki, by = "Title")

#ostalo
#filmi <- filmi[,-c(5:7)]
dolzina <- filmi$Runtime %>% str_match_all("[0-9]+") %>% unlist %>% as.numeric
filmi$Runtime <- dolzina


