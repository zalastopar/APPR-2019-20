# 4. faza: Analiza podatkov

#analiza1 - revenue, budget
rev <- head(filmi[c(1, 8)], 30)
colnames(rev)[2] <-"var"
bud <- head(filmi[c(1, 7)], 30)
colnames(bud)[2] <- "var"


analiza1 <- ggplot(NULL, aes(Title, var)) + 
  geom_bar(aes(fill="bud"), data = bud, alpha = 0.5, stat = "identity") + 
  geom_bar(aes(fill="rev"), data = rev, alpha = 0.5, stat = "identity") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  labs(y="") + scale_fill_discrete(name = "", labels = c("Budget", "Revenue"))
  





