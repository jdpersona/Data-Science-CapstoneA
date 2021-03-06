library(leaflet)

# Choices for drop-downs

navbarPage("Hurricane Comand Center", id="nav",
           
           tabPanel("Interactive map",
                    div(class="outer",
                        
                        tags$head(
                          # Include our custom CSS
                          includeCSS("styles.css"),
                          includeScript("gomap.js")
                        ),
                        
                        # If not using custom CSS, set height of leafletOutput to a number instead of percent
                        leafletOutput("map", width="100%", height="100%"),
                        
                        # Shiny versions prior to 0.11 should use class = "modal" instead.
                        absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                                      draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto",
                                      width = 330, height = "auto",
                                      
                                      h2("Alerts explorer"),
                                
                                      selectInput("colors", "Alert Type",c("Personal", "News", "Alert: Down Trees") )
                              
                                      
                        ),
                        
                        
                        
            
                        tags$div(id="cite",
                                 'Data compiled for ', tags$em('Hurricane and disaster tweets exploration')
                        )
                    )
           ),
           
           tabPanel("Data explorer")
                   
)
