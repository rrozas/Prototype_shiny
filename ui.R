require(xlsx)
setwd("/Users/rrozas/Documents/Renault")
alerts <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 3)
roc <-  read.xlsx(file = 'Data prototype Renault.xlsx', sheetIndex = 2)
source('carousel.R')
AUC <- sum(roc$value_ROC)/100


shinyUI(fluidPage(
  HTML('<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
       <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
       <span class="sr-only">Toggle navigation</span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       </button>
       <a class="navbar-brand" href="#">Accueil</a>
       </div>
       
       <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
       <ul class="nav navbar-nav">
       <li class="active"><a href="#">Alertes EICPS<span class="sr-only">(current)</span></a></li>
       <li><a href="#">Segments usage</a></li>
       <li class="dropdown">
       <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">D?tails <span class="caret"></span></a>
       <ul class="dropdown-menu" role="menu">
       <li><a href="#">Action</a></li>
       <li><a href="#">Another action</a></li>
       <li><a href="#">Something else here</a></li>
       <li class="divider"></li>
       <li><a href="#">Separated link</a></li>
       <li class="divider"></li>
       <li><a href="#">One more separated link</a></li>
       </ul>
       </li>
       </ul>
       <form class="navbar-form navbar-left" role="search">
       <div class="form-group">
       <input type="text" class="form-control" placeholder="Rechercher">
       </div>
       <button type="submit" class="btn btn-default">OK</button>
       </form>
       <ul class="nav navbar-nav navbar-right">
       <li><a href="#">Se d?connecter</a></li>
       </ul>
       </div>
       </div>
       </nav>'),
  theme = 'bootstrap.css',
  column(3, img(src="logo_renault.jpeg", height = 80, width = 80)),
  hr(),
  column(9, h3('Alertes EICPS d?tect?es')),
  hr(),
  #column(7,  selectInput('select1',choices = unlist(strsplit(paste(as.character(alerts$Anomalie), collapse = ' '),' ')), multiple = T, label ="")),
  column(12, selectInput(inputId = 1,choices = as.character(alerts$Anomalie) , label = '')),
  column(6,
         h4('Segments impact?s et facteurs discriminants'),
         htmlOutput(outputId = 'a', inline = T)),
  column(6,
         h4('Zoom par segment'),
         carouselPanel(
           img(src="image.png", height = 450, width = 350),
           img(src="image1.png", height = 450, width = 350),
           img(src="image2.png", height = 450, width = 350),
           img(src="image3.png", height = 450, width = 350),
           img(src="image4.png", height = 450, width = 350),
           img(src="image5.png", height = 450, width = 350)
         )),   
  column(6,
         h4('R?partition g?ographique des accidents'),
         htmlOutput(outputId = 'b', inline = T),
         sliderInput(inputId = 'slider', min = 2001, max = 2014, step = 1, value = 2014, label = 'Ann?e',format = '####')),
  column(6,
         h4('Mots-cl?s rattach?s'),
         htmlOutput(outputId = 'd')),    
  hr(),
  column(6,
         h4('Performance pr?dictive du mod?le'),
         htmlOutput(outputId = 'c', inline = T),
         h6(paste0('Aire sous la courbe de ROC : ',as.character(round(AUC)/100)))
  )
))