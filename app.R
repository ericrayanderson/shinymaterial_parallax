library(shiny)
library(shinymaterial)

# UI ---------------------------------------------------------------------
ui <- material_page(
  title = "",
  nav_bar_color = "red darken-4",
  # Parallax ----------------------------------
  # Image in folder www at same level as app.R
  material_parallax(image_source = "bg.jpeg"),
  material_row(
    material_column(
      width = 6,
      material_card(
        title = "faithful",
        plotOutput("faithfulPlot")
      )
    ),
    material_column(
      width = 6,
      material_card(
        title = "iris",
        plotOutput("irisPlot")
      )
    )
  ),
  # Parallax ----------------------------------
  # Image in folder www at same level as app.R
  material_parallax(
    image_source = "bg2.jpeg"
  ),
  material_row(
    material_column(
      width = 6,
      material_card(
        title = "mtcars",
        plotOutput("mtcarsPlot")
      )
    ),
    material_column(
      width = 6,
      material_card(
        title = "airmiles",
        plotOutput("airmilesPlot")
      )
    )
  )
  
)

# SERVER ---------------------------------------------------------------------
server <- function(input, output) {
  output$mtcarsPlot <- renderPlot({
    plot(mtcars)
  })
  output$irisPlot <- renderPlot({
    plot(iris)
  })
  
  output$faithfulPlot <- renderPlot({
    plot(faithful)
  })
  output$airmilesPlot <- renderPlot({
    plot(airmiles)
  })
}

shinyApp(ui = ui, server = server)