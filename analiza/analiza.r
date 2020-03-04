# 4. faza: Analiza podatkov

#analiza - revenue,budget


analiza1 <- ggplot(head(filmi, 100), aes(Title, group=1)) + 
  geom_point(aes(y = Budget, color = "Budget")) +
  geom_point(aes(y = Revenue, color = "Revenue")) + 
  scale_colour_manual("", breaks = c("Budget", "Revenue"), values = c("red", "blue")) + 
  theme(axis.text.x = element_blank()) + labs(x = "Movies") +
  geom_smooth(aes(y = Budget), color = "red", span = 0.3, fill = "red", alpha = 0.2)+
  geom_smooth(aes(y = Revenue), color = "blue", span = 0.3, fill = "blue", alpha = 0.2)




