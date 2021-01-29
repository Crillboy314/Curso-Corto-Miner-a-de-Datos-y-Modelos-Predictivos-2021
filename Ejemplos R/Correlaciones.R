library(ggplot2)
library(scales)

datos <- read.csv2("datos.csv", header = TRUE, sep = ",")
dim(datos)
head(datos,10)

### CORRELACION

datos <- read.csv2("datos.csv", header = TRUE, sep = ",")
dim(datos)
head(datos,10)

pairs(datos)

View(iris)

pairs(iris)

### GRAFICOS

library(corrplot)

corrplot(corr = cor(x = datos, method = "pearson"), method = "number")

corrplot(corr = cor(x = iris[1:4], method = "kendall"), method = "number")

pairs(iris[1:4], main = "Correlación de Datos IRIS, para 3 especies",
      pch = 21, bg = c("red", "green", "cyan"))


pairs(iris[1:4], main = "Correlación de Datos IRIS, para 3 especies",
      pch = 21, bg = c("red", "green", "cyan")[unclass(iris$Species)])

library(tidyverse)
library(data.table)

Esmeraldas <- fread('http://68.183.117.31/tmp/nvEsmeraldas.csv')
dfE <-  as.data.frame(Esmeraldas)

dim(dfE)
head(dfE,1)
colnames(dfE)


colsTallaPeso <- c("talla","peso")
TallaPeso <- dfE[colsTallaPeso]

head(TallaPeso,5)

pairs(TallaPeso)

pairs(TallaPeso,panel=panel.smooth)

MatrizCorr <- cor(x = TallaPeso, method = "pearson")
head(MatrizCorr)


par(mfrow=c(3,3))
corrplot(MatrizCorr, method = "number")
corrplot(MatrizCorr, method = "circle")
corrplot(MatrizCorr, method = "square")
corrplot(MatrizCorr, method = "ellipse")
corrplot(MatrizCorr, method = "shade")
corrplot(MatrizCorr, method = "color", type = "upper")
corrplot(MatrizCorr, method = "pie", type = "lower")


