library(shiny)

shinyUI(fluidPage(
  titlePanel("TOP10"),
  sidebarPanel(
    selectInput(inputId = "kategorija", label="Izberite kategorijo",
                choices = c("Rating" = 7, "Revenue [mio]" = 12, "Budget [mio]" = 11, "Runtime [min]" = 3),
                selected = NULL, multiple = FALSE, selectize = TRUE),
    radioButtons(inputId = "izbira", label = "Izberite dodatno kategorijo",
                 choices = c("Language" = 1, "Genre" = 2, "Country" = 3, "Production" = 4, "Year" = 5, "DVD"=6))
    ),
  mainPanel(
    plotOutput("graf1")
    plotOutput("graf2")
      )
  
)

)
        
        
        
        
        
        
        
        

  

