ui <- fluidPage(
    
  titlePanel("Baby Names in British Columbia", windowTitle = "Baby Names in British Columbia"),
    
    sidebarLayout(#inputs go here
       
       sidebarPanel(
         sliderInput("YearInput", "Year", min=1915, max=2014,
                     value = c(1935, 2014), sep = ""),
         radioButtons("SexInput", "Sex", choiceValues = c("1", "2"), choiceNames = c("Boy", "Girl"), selected = "2"),
         uiOutput("NameOutput")
          ),
        
          
        mainPanel(#results go here
          tabsetPanel(
            tabPanel("Graph", plotOutput("PlotOutput")),
            tabPanel("Table", DT::dataTableOutput("TableOutput")))
          )
    )

)