install.packages("arules")
library(arules)


data <- read.csv('C:\\Users\\NOrellana\\Documents\\U\\Maestria\\data mining\\censo\\censo\\PERSONA_BDP.csv', sep=",")
# Función que selecciona las columnas con más de dos valores únicos
guardar_columnas_unicas <- function(data) {
  # Identificar las columnas con más de 2 valores únicos
  columnas_seleccionadas <- sapply(data, function(col) length(unique(col)) > 2)
  
  # Filtrar las columnas que cumplen la condición
  nuevo_dataset <- data[, columnas_seleccionadas]
  
  return(nuevo_dataset)
}

nuevo_data <- guardar_columnas_unicas(data)


nuevo_data[0:10]
print(nuevo_data)


reglas <- apriori(nuevo_data, parameter = list(support=0.2, confidence=0.5 ))
inspect(reglas[0:100])
