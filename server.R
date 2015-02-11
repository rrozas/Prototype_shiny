require(shiny)
require(googleVis)
require(xlsx)
setwd("/Users/rrozas/Documents/Renault")
features <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 1)
roc <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 2)
alerts <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 3)
meteo <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 4)
km <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 5)
date_fab <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 6)
map <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 7)
words <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 8)
AUC <- sum(roc$value_ROC)/100


shinyServer(function(input, output){
  output$a  <- renderGvis(gvisBarChart(features[order(features$sum, decreasing = T),], yvar = colnames(features)[2:5],
                                       xvar = "Variable",
                                       options = list(width = 500, height = 250, chartArea = "{width: '40%'}", isStacked = 'true')))
  
  output$b  <- renderGvis(gvisGeoChart(map, locationvar="Pays", 
                                       colorvar= paste0('X',input$slider),
                                       options=list(projection="kavrayskiy-vii",
                                                    magnifyingGlass.enable = TRUE, width=500, height=300)))
  
  output$c  <- renderGvis(gvisAreaChart(roc, xvar = "x", yvar = c("value_ROC",'value_y'),
                                        options = list(width=500, height=300,legend="none",
                                                       hAxis='{minValue:0, maxValue:101}',
                                                       vAxis='{minValue:0, maxValue:100}')))
  
  output$d <- renderGvis(gvisBubbleChart(words, idvar="Mot_cle", 
                                         xvar="Gravite", yvar="Accidents",
                                         colorvar="Importance", sizevar="Occurrences",
                                         options=list(
                                           width=500, height=300,
                                           hAxis='{minValue:0, maxValue:100}',
                                           vAxis='{minValue:0, maxValue:100}',legend="none"))) 
  
}
)