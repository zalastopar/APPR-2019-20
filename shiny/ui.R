library(shiny)

shinyUI(fluidPage(
  titlePanel("TOP10"),
  sidebarPanel(
    selectInput(inputId = "kategorija", label="Izberite kategorijo",

                choices = c("Rating" = 4, "Revenue [mio]" = 8, "Budget [mio]" = 7, "Runtime [min]" = 3),
                selected = NULL, multiple = FALSE, selectize = TRUE),
    radioButtons(inputId = "izbira", label = "Izberite dodatno kategorijo",
                 choices = c("Language" = 1, "Genre" = 2, "Country" = 3, "Production" = 4, "Year" = 5))
    ),
  mainPanel(
    h4("Graf najboljših 10 filmov v izbrani kategoriji"),
    plotOutput("graf1"),

                
    plotOutput("graf2")
      )
  
)

)
        
        
        
        
        
        
        
        

  

