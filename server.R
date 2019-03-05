library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)
library(readr)




tweets <- read_csv("/Users/john.ekedum@ibm.com/Documents/TWITTER_PROJECT/dashboardTest.csv", col_names = TRUE)
colorByCategory <- colorFactor(palette = c("black", "blue", "red"),
                               level = c("Personal", "News", "Alert: Down Trees"))



server <- function(input, output, session) {
  
  
  
  
  colorpal <- reactive({
    
    tweets  %>% filter(predicted_type == input$colors)  
    
  })
  
  
  output$map <- renderLeaflet({
    leaflet(tweets) %>% addTiles() %>%
      setView(lat=30.1588, lng=-85.6602, zoom=14) 
  })
  

  observe({
    pal <- colorpal()
    
    leafletProxy("map", data = colorpal()) %>%
      clearShapes() %>%
      addCircles(radius = 5, weight = 1, color = "#777777",
                 fillColor = ~colorByCategory(predicted_type), fillOpacity = 0.7, popup = ~paste(text)
      )
  })
  
  
  
  
  
}













