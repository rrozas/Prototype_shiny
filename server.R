shinyServer(function(input, output){
  reactive({print(input$select1)})
  output$a  <- renderGvis({if(input$select1 != '')
    gvisBarChart(features[order(features$sum, decreasing = T),], yvar = colnames(features)[2:5],
                                       xvar = "Variable",
                                       options = list(width = 500, height = 250, chartArea = "{width: '40%'}", isStacked = 'true'))})
  
  output$b  <- renderGvis({if(input$select1 != '')
                              gvisGeoChart(map, locationvar="Pays", 
                                       colorvar= paste0('X',input$slider),
                                       options=list(projection="kavrayskiy-vii",
                                                    magnifyingGlass.enable = TRUE, width=500, height=300))})
  
  output$c  <- renderGvis({if(input$select1 != '')
                              gvisAreaChart(roc, xvar = "x", yvar = c("value_ROC",'value_y'),
                                        options = list(width=500, height=300,legend="none",
                                                       hAxis='{minValue:0, maxValue:101}',
                                                       vAxis='{minValue:0, maxValue:100}'))})
  
  output$d <- renderGvis({if(input$select1 != '')
                                  gvisBubbleChart(words, idvar="Mot_cle", 
                                         xvar="Gravite", yvar="Accidents",
                                         colorvar="Importance", sizevar="Occurrences",
                                         options=list(
                                           width=500, height=300,
                                           hAxis='{minValue:0, maxValue:100}',
                                           vAxis='{minValue:0, maxValue:100}',legend="none"))})
  
  output$text  <-  renderText({if(input$select1 != '')
                        paste0('Aire sous la courbe de ROC : ',as.character(round(AUC)/100))
                        })
  output$text1  <-  renderText({if(input$select1 != '') 'Segments impactés et facteurs discriminants' })
  output$text2  <-  renderText({if(input$select1 != '') 'Zoom par segment'  })
  output$text3  <-  renderText({if(input$select1 != '') 'Répartition géographique des accidents' })
  output$text4  <-  renderText({if(input$select1 != '') 'Mots-clés rattachés' })
  output$text5  <-  renderText({if(input$select1 != '') 'Performance prédictive du modèle' })
  
  output$out1  <- renderUI({
                  if(input$select1 != '')
                    carouselPanel(
                 img(src="image.png", height = 450, width = 350),
                 img(src="image1.png", height = 450, width = 350),
                 img(src="image2.png", height = 450, width = 350)
               )})
  
  output$out2  <- renderUI({
    if(input$select1 != '')
    sliderInput(inputId = 'slider', min = 2001, max = 2014, step = 1, value = 2014, label = 'Année',format = '####')
  })
  
})