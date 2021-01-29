library(caret) 
library(dplyr) 
library(ggplot2)
library(scales)

mTit = "Ejemplo Normalización"
mSubTit = "Función de máximo y mínimo"
mCapt = ""
mLeyenda = "--"

mX = "x"
mY = "y"


ggEtiquetas <- labs(title = mTit, subtitle = mSubTit,
                    caption = mCapt, colour = mLeyenda,
                    x=mX, y=mY)


ggTema <- theme(
  plot.title = element_text(color = "red", size = 16, face = "bold"),
  plot.subtitle = element_text(color = "blue", size = 16, face = "bold"),
  axis.title.x = element_text(color = "green", size = 24, face = "bold"),
  axis.title.y = element_text(color = "orange", size = 24, face = "bold"),
  legend.title = element_text(color = "blue", size = 14),
  legend.text = element_text(size = 12),
  axis.text.y = element_text(angle = 0, hjust = 1,size=20),
  axis.text.x = element_text(angle = 0, hjust = 1,size=20)
)

ggEscalaX <- scale_x_discrete(mX)

ggTemaFacet <- theme(
  strip.text.x = element_text(
    size = 12, color = "black", face = "bold"
  )  )


#### Aca empieza el ejercicio

datos <- read.csv2("datos.csv", header = TRUE, sep = ",")
dim(datos)
head(datos,5)

ggplot(data = datos) + geom_line(mapping = aes (x=x, y=y)) + ggEtiquetas + ggTema

datos

datos_norm <- as.data.frame(apply(datos[1:2], 2, function(x) (x - min(x))/(max(x)-min(x))))
dim(datos_norm)
head(datos_norm,10)

ggplot(data = datos_norm) + geom_line(mapping = aes (x=x, y=y)) + ggEtiquetas + ggTema

datos$x_n <- datos_norm$x
datos$y_n <- datos_norm$y
head(datos,10)

ggplot(data = datos) + geom_line(mapping = aes (x=x, y=y)) +  ggEtiquetas + ggTema
ggplot(data = datos) + geom_line(mapping = aes (x=x_n, y=y_n)) +ggEtiquetas + ggTema


