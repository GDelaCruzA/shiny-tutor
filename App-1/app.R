# primera aplicación de ejemplo del Shiny tutorial de RStudio
# 
library(shiny)

# la aplicación va a mostrar un histograma al que el usuario puede cambiarle
# el número de intervalos mediante un slider

# la primera parte de la aplicación es la definición del la interfaz del usuario
# la UI como página web (esto es, se genera una página en HTML)

ui <- fluidPage(
  # título de la aplicación; no es obligatorio
  titlePanel("Hello World!!"),  # nótese que cada elemento se concatena como argumento de uhna lista
  
  # se define el diseño base de la interfaz
  sidebarLayout(
    
    # se define el panel de la barra lateral para los inputs
    sidebarPanel(
      sliderInput(inputId = "intervalos",
                  label = "Número de intervalos:",
                  min = 5,
                  max = 50,
                  value = 30)
      
    ), # termina definición del sidebarPanel
    
    # se define el panel principal para mostrar las salidas
    mainPanel(
      
      # se despliega la salida del histograma
      plotOutput(outputId = "histograma")
      
    ) # termina definición del mainPanel, no hay más elementos en el sidebarLayout
  ) # termina la definición del sidebarlayout
) # termina definición de la ui

# se define la lógica para dibujar el histograma en el servidor de la app

server <- function(input, output) {
  
  # el histograma es de los datos de los datos de ejemplo
  # con el número de intervalos definido por el usuario
  # la generación del histograma esta incluida en el llamado a la
  # función renderPlot, lo que indica que:
  # es "reactiva" por lo que se actualiza cuando input$intervalos cambia
  # el tipo de salida es una gráfica
  
  output$histograma <- renderPlot({
    
    x <- faithful$waiting  # los datos para la gráfica
    bins <- seq(min(x), max(x), length.out = input$intervalos)
    hist(x, breaks = bins, col = "blue", border = "orange",
         xlab = "Tiempo antes de la siguiente erupción (min)",
         main = "Histograma de los tiempos de espera del geiser")
    
  }) # incluye todas las expresiones para hacer la gráfica
  
} # termina definición del server

# se ejecuta la aplicación
shinyApp(ui, server)

