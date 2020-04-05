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

filmi[,11] <- round(filmi[,11] / 1000000, 2)
colnames(filmi)[which(names(filmi) == "Gross")] <- "Revenue"




# write.csv(filmi, "C:/Users/Marko/Documents/AMAT/analiza_filmov/APPR-2019-20/podatki/filmi.csv")

#čiščcenje

#države
filmi$Country <- gsub(" ", "", filmi$Country)
drzave <- filmi %>% select(Title, region = Country)
drzave <- separate_rows(drzave, region, sep = ",")
drzave$region <- gsub("([a-z])([A-Z])", "\\1 \\2", drzave$region)
drzave$region <- gsub("UAE", "United Arab Emirates", drzave$region)


#zvrst
filmi$Genre <- gsub("-", "", filmi$Genre)
filmi$Genre <- gsub(" ", "", filmi$Genre)
zvrsti <- filmi %>% select(Title, Genre)
zvrsti <- separate_rows(zvrsti, Genre, sep = ",")


#jezik
filmi$Language <- gsub(" ", "", filmi$Language)
jeziki <- filmi %>% select(Title, Language)
jeziki <- separate_rows(jeziki, Language, sep = ",")



#filmski studijo

paramount <- grep("Paramount", ignore.case = TRUE, filmi$Production)
filmi$Production[paramount] <- "Paramount Pictures"

warner <- grep("Warner", ignore.case = TRUE, filmi$Production)
filmi$Production[warner] <- "Warner Bros."

universal <- grep("Universal", ignore.case = TRUE, filmi$Production)
filmi$Production[universal] <- "Universal Pictures"

fox <- grep("century", ignore.case = TRUE, filmi$Production)
filmi$Production[fox] <- "20th Century Fox"

dream <- grep("dream", ignore.case = TRUE, filmi$Production)
filmi$Production[dream] <- "Dreamworks"

united <- grep("united", ignore.case = TRUE, filmi$Production)
filmi$Production[united] <- "United Artists"

orion <- grep("orion", ignore.case = TRUE, filmi$Production)
filmi$Production[orion] <- "Orion Pictures"

buena <- grep("buena", ignore.case = TRUE, filmi$Production)
filmi$Production[buena] <- "Buena Vista"

sony <- grep("sony", ignore.case = TRUE, filmi$Production)
filmi$Production[sony] <- "Sony Pictures"

mgm <- grep("mgm", ignore.case = TRUE, filmi$Production)
filmi$Production[mgm] <- "MGM"

disney <- grep("disney", ignore.case = TRUE, filmi$Production)
filmi$Production[disney] <- "Walt Disney Pictures"

#ostalo
dolzina <- filmi$Runtime %>% str_match_all("[0-9]+") %>% unlist %>% as.numeric
filmi$Runtime <- dolzina
filmi <- filmi[-c(4:6, 9)]


