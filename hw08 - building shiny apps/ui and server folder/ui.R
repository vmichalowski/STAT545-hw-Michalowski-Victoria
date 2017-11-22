ui <- fluidPage(
    
  titlePanel("Baby Names in British Columbia", windowTitle = "Baby Names in British Columbia"),
    
    sidebarLayout(#inputs go here
       
       sidebarPanel(
          sliderInput("YearInput", "Year", min=1915, max=2014,
                  value = c(2000, 2014), sep = ""),
          radioButtons("SexInput", "Sex", choiceValues = c("1", "2"), choiceNames=c("Boy", "Girl")),
          uiOutput("NameOutput")
          ),
          
        mainPanel(#results go here
          plotOutput("plot"),
          br(),
          br(),
          tableOutput("results")
                  )
    )

)