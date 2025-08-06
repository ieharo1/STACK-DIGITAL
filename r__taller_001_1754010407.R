install.packages("tidyverse")
library(tidyverse)

url <- "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
df <- read_csv(url)
head(df)

# Paso 4: Explorar y limpiar los datos

glimpse(df)

# Eliminar columnas innecesarias
df <- df %>% select(-Cabin, -Ticket)

# Llenar valores nulos en Age con la media
df$Age[is.na(df$Age)] <- mean(df$Age, na.rm = TRUE)

# Verificar valores faltantes
colSums(is.na(df))

#Paso 5: Visualizar los datos
#Histograma de edades

ggplot(df, aes(x = Age)) +
  geom_histogram(bins = 20, fill = "skyblue", color = "black") +
  labs(title = "Distribución de Edad", x = "Edad", y = "Frecuencia")

#Gráfico de barras por clase

ggplot(df, aes(x = factor(Pclass))) +
  geom_bar(fill = "orange") +
  labs(title = "Cantidad de Pasajeros por Clase", x = "Clase", y = "Cantidad")

