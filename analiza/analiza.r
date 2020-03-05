# 4. faza: Analiza podatkov


#Revenue, Budget
analiza1 <- ggplot(filmi, aes(x=Budget, y=Revenue)) +
  geom_point() + geom_smooth() + 
  scale_x_log10() + ylim(0, max(filmi$Revenue))




#Runtime, Budget
analiza3 <- ggplot(filmi, aes(x = Budget, y = Runtime)) +
  geom_point() + geom_smooth() + xlim(0, max(filmi$Budget)) + 
  scale_x_log10()
  




analiza5 <- grid.arrange(analiza1, analiza3, nrow=2)

print(analiza5)
