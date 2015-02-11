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

# data  <-  meteo
# g  <- gvisColumnChart(data = data , xvar = colnames(data)[1], yvar =colnames(data)[2:3] , option = list(isStacked = 'true', width = 800, height = 600, title = gsub('[.]',' ',colnames(data)[1])))
# print(g, file="g.html")
# system("wkhtmltoimage -n --enable-javascript --javascript-delay 2000 g.html www/image.png", wait = F)
# 
# data  <-  km
# g  <- gvisColumnChart(data = data , xvar = colnames(data)[1], yvar =colnames(data)[2:3] , option = list(isStacked = 'true', width = 800, height = 600, title = gsub('[.]',' ',colnames(data)[1])))
# print(g, file="g.html")
# system("wkhtmltoimage -n --enable-javascript --javascript-delay 2000 g.html www/image1.png", wait = F)
# 
# data  <-  date_fab
# g  <- gvisColumnChart(data = data , xvar = colnames(data)[1], yvar =colnames(data)[2:3] , option = list(isStacked = 'true', width = 800, height = 600, title = gsub('[.]',' ',colnames(data)[1])))
# print(g, file="g.html")
# system("wkhtmltoimage -n --enable-javascript --javascript-delay 2000 g.html www/image2.png", wait = F)
