# Cargar la librería fim4r
# Instalar el paquete arules si no está instalado

# Cargar la librería arules
library(arules)

# Leer los datos
data <- read.csv('C:\\Users\\NOrellana\\Documents\\U\\Maestria\\data mining\\db_2018_\\db_csv_\\MIGRACION_BDP.csv', sep=",")

# Filtrar los datos
data <- subset(data, DEPARTAMENTO == 9)
data_filtrada <- data[, c(2,5,7,8,9,10)]  # Ajusta las columnas según tus necesidades


# Convertir a transacciones para aplicar FPGrowth
transacciones <- as(data_filtrada, "transactions")

# Generar reglas usando FPGrowth
reglas <- apriori(transacciones, parameter = list(supp = 0.2, conf = 0.5, target = "rules"))

# Convertir las reglas a data.frame
reglasframe <- as(reglas, "data.frame")

#Regla 1: {AREA=[1,2], PEI4=[0,19)} => {PEI3=[1,2]}

#personas que se fueron de un área (1 = Urbano, 2 = Rural) y tenían edades entre 0 y 19 años. Además, todos estos casos corresponden a personas de ambos sexos (1 = Masculino, 2 = Femenino).


#Regla 2: {PEI3=[1,2], PEI4=[0,19)} => {AREA=[1,2]}

#personas de ambos sexos (1 = Masculino, 2 = Femenino) que se fueron cuando tenían entre 0 y 19 años, y todos ellos provenían de áreas urbanas o rurales.

#Regla 3: {NUM_HOGAR=[1,4], PEI4=[0,19)} => {ID_EMIGRACION=[1,5]}

#personas de hogares con un número de hogar entre 1 y 4, que se fueron cuando tenían entre 0 y 19 años. Todos estos casos tenían un número de identificación de emigrante entre 1 y 5.
