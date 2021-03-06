library(shiny)
library(ggplot2)


ui <- bootstrapPage(
  h3("URL components"),
  verbatimTextOutput("urlText"),
  
  h3("Parsed query string"),
  verbatimTextOutput("queryText"),
  
  
  plotOutput("ggPlot")
  
)

server <- function(input, output, session) {
  
  # Return the components of the URL in a string:
  output$urlText <- renderText({
    paste(sep = "",
          "protocol: ", session$clientData$url_protocol, "\n",
          "hostname: ", session$clientData$url_hostname, "\n",
          "pathname: ", session$clientData$url_pathname, "\n",
          "port: ",     session$clientData$url_port,     "\n",
          "search: ",   session$clientData$url_search,   "\n"
    )
  })
  
  output$ggPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    ggplot(mtcars) +
       aes(x = mpg, y = cyl) +
       geom_point()
  })
  
  # Parse the GET query string
  output$queryText <- renderText({
    query <- parseQueryString(session$clientData$url_search)
    
    # Return a string with key-value pairs
    paste(names(query), query, sep = "=", collapse=", ")
  })
}

shinyApp(ui, server)
