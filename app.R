#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel(h1("My App")),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    
    sidebarPanel(
      fileInput("file", "Ajouter un fichier .csv",
        buttonLabel = "Parcourir...", placeholder = "aucun fichier selectionné",
        accept = c(
          "text/csv",
          "text/comma-separated-values,text/plain",
          ".csv"
        )
      ),
      fluidRow(
        column(
          6,
          selectInput("header", "Header :", choices = c(TRUE, FALSE), selected = TRUE)
        ),
        column(
          6,
          selectInput("sep", "Séparateur :", choices = c(",", "/", ".", ";"), selected = ";")
        )
      ),
      actionButton("read", "Lire", icon = icon("fa-thin fa-check-double"), class = "btn-block btn-success"),
      hr(),
      fluidRow(
        column(
          6,
          selectInput("x", "X :", choices = c(''), selected = '')
        ),
        column(
          6,
          selectInput("y", "Y :", choices = c(""), selected = "")
        )
      ),
      fluidRow(
        column(
          12,
          selectInput("model", "", choices = c("Slectionner votre modèle",'Linear regression','Logiistic regression'), selected = "")
        )
      ),
      actionButton("model_btn", "Appliquer", icon = icon("fa-chart-scatter"), class = "btn-block btn-primary"),
      hr(),

      textInput('predict','Valeurs à prédire :'),
      actionButton('predict_btn','Prédire')
      
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Data", dataTableOutput("Data")),
        tabPanel("Plot", plotlyOutput("plot")),
        tabPanel('Summary',verbatimTextOutput('summary'))
      )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

}

# Run the application 
shinyApp(ui = ui, server = server)
