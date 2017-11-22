server <- function(input, output) {
  
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

  output$plot <- renderPlot({
    if (is.null(filtered())) {
      return()
    }
    
    ggplot(filtered(), aes(x=Year, y=Frequency)) +
      geom_line()
  })
  
  output$results <- renderTable({
    filtered()
  })
  
  output$NameOutput <- renderUI({
    selectInput("NameInput", "Name",
                sort(unique(baby_namesLong$Name)),
                selectize=FALSE)
  })
}