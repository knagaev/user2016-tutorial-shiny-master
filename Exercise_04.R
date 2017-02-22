library(shiny)

ui <- fluidPage(
  h1("Example app 4"),
  sidebarLayout(
    sidebarPanel(
      actionButton("rnorm", "Normal"),
      actionButton("runif", "Uniform")
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session) {
  # Assignment: When "rnorm" button is clicked, the plot should
  # show a new batch of rnorm(100). When "runif" button is clicked,
  # the plot should show a new batch of runif(100).
  
  distr_kind <- reactiveValues()

  observeEvent(input$rnorm,{
    distr_kind$a <-  "rnorm"
  })
  
  observeEvent(input$runif,{
    distr_kind$a <-  "runif"
  })
  
  distr <- reactive({
    req(distr_kind$a)

    if (distr_kind$a == "runif")
    {
      runif(100)
    }
    else if (distr_kind$a == "rnorm")
    {
      rnorm(100)
    }

    
  })
  
  output$plot <- renderPlot({
    
    hist(distr())
  
  })
}

shinyApp(ui, server)
