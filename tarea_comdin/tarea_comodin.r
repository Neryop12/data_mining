library(rpart)
library(rpart.plot)

data <- read.csv('C:\\Users\\NOrellana\\Documents\\U\\Maestria\\data mining\\censo\\censo\\MIGRACION_BDP.csv', sep=",")

data$DEPARTAMENTO <- as.factor(data$DEPARTAMENTO)
data$MUNICIPIO <- as.factor(data$MUNICIPIO)
data$ZONA <- as.factor(data$ZONA)
data$AREA <- as.factor(data$AREA)
data$PEI3 <- as.factor(data$PEI3)
data$PEI4 <- as.factor(data$PEI4)
data$PEI5 <- as.factor(data$PEI5)

arbol <- rpart(PEI3 ~ ZONA + AREA , data = data, method = "class")
arbol2 <- rpart(PEI4 ~ DEPARTAMENTO + MUNICIPIO + ZONA, data = data, method = "class")

arbol3 <- rpart(PEI3 ~ ZONA + NUM_HOGAR + AREA, data = data, method = "class")

arbol_mejorado <- rpart(
  PEI4 ~ ZONA + AREA + NUM_VIVIENDA, 
  data = data, 
  method = "class", 
  control = rpart.control(minsplit = 5, cp = 0.01, maxdepth = 10)
)

rpart.plot(
  arbol_mejorado, 
  type = 4, 
  extra = 104, 
  under = TRUE, 
  fallen.leaves = TRUE, 
  box.palette = "BuGn", 
  main = "Árbol de decisión mejorado"
)
