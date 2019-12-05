# 2. faza: Uvoz podatkov

filmi1 <- read_csv("IMDB_Top250Engmovies2_OMDB_Detailed.csv", na = "N/A")[,c(3, 5:7, 12, 13, 34, 36)]

#colnames(filmi) <- c("a", "b")
