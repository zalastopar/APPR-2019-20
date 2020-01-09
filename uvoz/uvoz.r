# 2. faza: Uvoz podatkov

filmi1 <- read_csv("podatki/IMDB_Top250Engmovies2_OMDB_Detailed.csv", na = "N/A")[,c(2:3, 5:7, 12, 13, 19, 21, 34, 36)]


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

filmi[,13] <- filmi[,13] * 1000000
colnames(filmi)[which(names(filmi) == "Gross")] <- "Revenue"

filmi1 <-filmi1(Genre = unlist(Genre))


# write.csv(filmi, "C:/Users/Marko/Documents/AMAT/analiza_filmov/APPR-2019-20/podatki/filmi.csv")

 