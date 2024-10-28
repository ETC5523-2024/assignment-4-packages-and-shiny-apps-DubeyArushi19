# Load necessary libraries
library(shiny)
library(dplyr)
library(ggplot2)

# Define the Shiny app UI
ui <- fluidPage(
  titlePanel("Tourism GDP Contribution Analysis"),

  sidebarLayout(
    sidebarPanel(
      # Input for selecting a country
      selectInput("country", "Select a Country:",
                  choices = unique(tourism$Entity)),

      # Input for selecting a range of years
      sliderInput("yearRange", "Select Year Range:",
                  min = min(tourism$Year),
                  max = max(tourism$Year),
                  value = c(2008, 2019)),

      # Helper text for guidance
      helpText("This app allows you to explore the contribution of tourism to the GDP of selected countries over time.")
    ),

    mainPanel(
      # Output plot
      plotOutput("gdpPlot"),

      # Interpretation Guide
      hr(),
      h4("Interpretation Guide"),
      p("This plot shows the percentage of GDP generated from tourism for the selected country and time range.
         A higher percentage indicates a larger reliance on tourism within the economy."),
      p("Use the selector and slider to explore changes in tourism GDP contribution over the years.")
    )
  )
)

# Define the server logic for the app
server <- function(input, output) {

  # Reactive data filtered by selected country and year range
  filtered_data <- reactive({
    tourism %>%
      filter(Entity == input$country,
             Year >= input$yearRange[1],
             Year <= input$yearRange[2])
  })

  # Render the plot
  output$gdpPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = Year, y = `GDP from tourism as a share of total GDP`)) +
      geom_line(color = "#0073C2") +
      geom_point(color = "#0073C2") +
      labs(
        title = paste("Tourism GDP Contribution in", input$country),
        x = "Year",
        y = "Tourism GDP as % of Total GDP"
      ) +
      theme_minimal() +
      theme(
        panel.background = element_rect(fill = "#F7F9FC"),
        plot.title = element_text(face = "bold", hjust = 0.5)
      )
  })
}

shinyApp(ui=ui, server = server)

