# segunda aplicación de ejemplo del Shiny tutorial de RStudio Lesson 2
# Build a user interface
# 
library(shiny)

# fluidPage() permite crear despliegues que se ajuastan automáticamente a las
# dimensiones de la ventana del navegador del usuario

ui <- fluidPage(
  titlePanel("panel del título"),
  
  # sidebarLayout usa como argumento las posición (izquierda -defecto- o derecha) y es
  # el diseño de interfaz más común; navbarPage incluye una barra de navegación y una interfaz
  # multipágina, mientras que fluidRow y column juntas crean un diseña en gradilla
  sidebarLayout(position = "left",
    sidebarPanel("panel de la barra lateral",
                 h3(strong("Installation")),
                 p("Shiny is available on CRAN, so you can install as usual from your R consolo"),
                 br(),
                 code('install.package("shiny")'),
                 br(),
                 img(src = "image-in-app.png", height = 70, width = 200)
    ), # termina sidebarPanel
    # ejemplo del uso de etiquetas HTML
    mainPanel("Panel principal",
              p("p creates a paragraph of text."),
              p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph.", style = "font-family: 'times'; font-si16pt"),
              strong("strong() makes bold text."),
              em("em() creates italicized (i.e, emphasized) text."),
              br(),
              br(),
              code("code displays your text similar to computer code"),
              div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
              br(),
              p("span does the same thing as div, but it works with",
                span("groups of words", style = "color:blue"),
                "that appear inside a paragraph."),
              # imagenes y otros archivos auxiliares deben de almacenarse en un subdir
              # www en la misma ruta donde se encuentra app.R
              # p.e. la imagen que se inserta se encuentra automáticamente es esa ruta
              img(src = "image-in-app.png", height = 140, width = 400)
              ) # termina mainPanel
  ) # termina sidebarLayout

) # termina definición de la ui

# se define la lógica en el servidor de la app

server <- function(input, output) {
  
  
} # termina definición del server

# se ejecuta la aplicación
shinyApp(ui, server)

