library(shiny)

shinyServer(function(input, output, session) {
  
  output$graf1 <- renderPlot({
    colm = as.numeric(input$kategorija)
    top10 <- head(filmi[order(filmi[,colm], decreasing = TRUE),], 10)
    
    
    ggplot(top10, aes(x=factor(Title, level =Title), y=top10[,colm]), group=1) + 
      theme(axis.text.x = element_text(angle = 90, hjust = 1))  +
      geom_col(color="white", fill="red") + labs(x = "Title", y ="") + 
      labs(x="Titles")
  }
  )
  
  output$graf2 <- renderPlot({
    ozn <- as.numeric(input$izbira)
    colm = as.numeric(input$kategorija)
    top10 <- head(filmi[order(filmi[,colm], decreasing = TRUE),], 10)
    
    if (ozn == 1) {
      top10_zvrsti <- left_join(top10, zvrsti)
      ggplot(top10_jeziki, aes(x=factor(Title, level =unique(Title)), y =Language, color=Language)) + 
        geom_point(size=2) + labs(x="Titles") + 
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
      
    }
    
  })
  
  
})
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
  



