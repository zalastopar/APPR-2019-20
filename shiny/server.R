library(shiny)

shinyServer(function(input, output, session) {
  
  output$graf1 <- renderPlot({
    colm = as.numeric(input$kategorija)
    top10 <- head(filmi[order(filmi[,colm], decreasing = TRUE),], 10)

    ggplot(top10, aes(x=factor(Title, level =Title), y=top10[,colm]), group=1) + 
      theme(axis.text.x = element_text(angle = 90, hjust = 1))  +
      geom_col(color="white", fill="red") + labs(x = "Title", y ="") + 
      scale_color_gradient(low="blue", high="red") + 
      coord_cartesian(ylim = c(min(top10[,colm])*(1 - 1/50), max(top10[,colm])*(1 + 1/50)))

  }
  )
  
  output$graf2 <- renderPlot({

    oznaka <- as.numeric(input$izbira)
    colm = as.numeric(input$kategorija)
    top10 <- head(filmi[order(filmi[,colm], decreasing = TRUE),], 10)
    
    if (oznaka == 1) {
      top10_jeziki <- left_join(top10, jeziki)
      ggplot(top10_jeziki, aes(x=factor(Title, level =unique(Title)), y =Language, color=Language)) + 
        geom_point(size=4) + labs(x="Titles") + 
        theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none")
    } else if (oznaka == 2) {
      top10_zvrsti <- left_join(top10, zvrsti)
      ggplot(top10_zvrsti, aes(x=factor(Title, level =unique(Title)), y =Genre, color=Genre)) + 
        geom_point(size=4) + labs(x="Titles") + 
        theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none")
    } else if (oznaka == 3){
      top10_drzave <- left_join(top10, drzave)
      ggplot(top10_drzave, aes(x=factor(Title, level =unique(Title)), y =region, color=region)) + 
        geom_point(size=4) + labs(x="Titles", y="Country") + 
        theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none")
    } else if (oznaka == 4){
      ggplot(top10, aes(x=factor(Title, level =unique(Title)), y =Production, color=Production)) + 
        geom_point(size=4) + labs(x="Titles") + 
        theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none")
    } else {
      ggplot(top10, aes(x=factor(Title, level =unique(Title)), y =Year, color=Year)) + 
        geom_point(size=4) + labs(x="Titles") + 
        theme(axis.text.x = element_text(angle = 90, hjust = 1), legend.position = "none") + 
        scale_color_gradient(low="blue", high="red")
    } 
  })
  
 
  

  
})
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
  



