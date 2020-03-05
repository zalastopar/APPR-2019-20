# 4. faza: Analiza podatkov


#Revenue, Budget
analiza1 <- ggplot(filmi, aes(x=Budget, y=Revenue)) +
  geom_point() + geom_smooth() + 
  scale_x_log10() + ylim(0, max(filmi$Revenue))

print(analiza1)

#Revenue, Rating
analiza2 <- ggplot(filmi, aes(x = imdbRating, y = Revenue)) +
  geom_point() + geom_smooth()

print(analiza2)

#Runtime, Budget
analiza3 <- ggplot(filmi, aes(x = Budget, y = Runtime)) +
  geom_point() + geom_smooth() + xlim(0, max(filmi$Budget)) + 
  scale_x_log10()
  
print(analiza3)

#Year, rating
analiza4 <- ggplot(filmi, aes(x=imdbRating, y= Year)) + 
  geom_point() + geom_smooth()

print(analiza4)

analiza5 <- grid.arrange(analiza1, analiza2, analiza3, analiza4)

print(analiza5)
