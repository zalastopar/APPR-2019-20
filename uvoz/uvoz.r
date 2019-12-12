# 2. faza: Uvoz podatkov

filmi1 <- read_csv("IMDB_Top250Engmovies2_OMDB_Detailed.csv", na = "N/A")[,c(3, 5:7, 12, 13, 19, 34, 36)]


#colnames(filmi) <- c("a", "b")


filmi2 <- read_csv("movies_budget.csv", na = "N/A")[,c(9)]

tabela <- merge(filmi1, filmi2)

link <- "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating,desc"
stran <- html_