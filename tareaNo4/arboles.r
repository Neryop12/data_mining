
library(rpart)
library(rpart.plot)

vivienda <- read.csv('C:\\Users\\NOrellana\\Documents\\U\\Maestria\\data mining\\censo\\censo\\VIVIENDA_BDP.csv', sep=",")

# Árbol para predecir el material del techo (PCV3)
arbol_techo <- rpart(PCV3 ~ 
                     DEPARTAMENTO + 
                     MUNICIPIO + 
                     PCV2 + 
                     PCV4, 
                     data = vivienda, method = "class")

# Graficar el árbol
rpart.plot(arbol_techo, type=2, extra=0, under = TRUE, fallen.leaves = TRUE, 
           box.palette = "BuGn", main = "Predicción del material del techo", cex = 0.45)

# Árbol para predecir el material del piso (PCV5)
arbol_piso <- rpart(PCV5 ~ 
                    DEPARTAMENTO + 
                    PCV3 + 
                    PCV2 + 
                    PCV4, 
                    data = vivienda, method = "class")

# Graficar el árbol
rpart.plot(arbol_piso, type=2, extra=0, under = TRUE, fallen.leaves = TRUE, 
           box.palette = "BuGn", main = "Predicción del material del piso", cex = 0.45)

# Árbol para predecir la zona (ZONA)
arbol_zona <- rpart(ZONA ~ 
                    DEPARTAMENTO + 
                    MUNICIPIO + 
                    PCV1 + 
                    PCV2 + 
                    PCV3 + 
                    PCV4 + 
                    PCV5, 
                    data = vivienda, method = "class")

# Graficar el árbol
rpart.plot(arbol_zona, type=2, extra=0, under = TRUE, fallen.leaves = TRUE, 
           box.palette = "BuGn", main = "Predicción de la zona (urbana o rural)", cex = 0.5)
