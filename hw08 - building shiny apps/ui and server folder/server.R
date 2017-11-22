server <- function(input, output) {
  
  download.file("https://github.com/vmichalowski/STAT545-hw-Michalowski-Victoria/raw/master/hw08%20-%20building%20shiny%20apps/baby_namesLong.csv", destfile="baby_namesLong.csv")
  baby_namesLong <- read.csv("baby_namesLong.csv")
  library(shiny)
  library(tidyverse)
  
  filtered <- reactive({
    if (is.null(input$NameInput)) {
      return(NULL)
    }
    baby_namesLong %>% 
      filter(Year >= input$YearInput[1],
             Year <= input$YearInput[2],
             Sex == input$SexInput,
             Name == input$NameInput)
  })

  output$PlotOutput <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    
    ggplot(filtered(), aes(x=Year, y=Frequency)) +
      geom_line() +
      labs(x = "Year", y = "Frequency", caption = "Data Source: Ministry of Health - British Columbia Vital Statistics Agency") +
      theme_minimal()
  })
  
  output$TableOutput <- DT::renderDataTable({
    filtered()
  })
  
  output$NameOutput <- renderUI({
    if (input$SexInput == 1)
      return(selectInput("NameInput", "Name",
                         sort(unique(subset.data.frame(baby_namesLong, Sex == 1, select = Name, drop = TRUE))),
                         selected = "AARON",
                         selectize=FALSE))
    if (input$SexInput == 2)
      return(selectInput("NameInput", "Name",
                         sort(unique(subset.data.frame(baby_namesLong, Sex == 2, select = Name, drop = TRUE))),
                         selected = "AUDREY",
                         selectize = FALSE))
  })
}