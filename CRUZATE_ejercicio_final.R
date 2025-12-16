# Ejercicio final en R

# Paso 1: limpiar el entorno y obtener la dirección de trabajo. También, cargué los archivos .txt en la misma carpeta en la que estoy guardando estos archivos, con el nombre "corpus2". 
rm(list = ls()) 
getwd() 

# Paso 2: llamo las librerías a utilizar, previamente instaladas
library(tidytext) 
library(tidyverse)
library(dplyr)
library(ggplot2)
library(tm)
library(wordcloud2)

# Paso 3: verifico que los archivos estén bien cargados (en efecto, están bien), los listo y le pido que me de los nombres sin .txt para poder trabajarlos
list.files("corpus2") 
archivos <- list.files(path = "corpus2", pattern = "\\.txt$", full.names = TRUE)

archivos
class(archivos)
length(archivos)
textos_archivo <- gsub("\\.txt$", "", basename(archivos))
textos_archivo

# Paso 4: creé una tabla de datos para poder trabajar el texto de forma ordenada, utilizando la herramienta "tibble" que me arma cada línea como “parrafo” 
mensajes <- tibble(textos_archivo = character(),
                   parrafo = integer(),
                   texto = character())

for (i in seq_along(archivos)) {
  textos_iteracion <- read_lines(archivos[i])
  
  temporal <- tibble(
    textos_archivo = textos_archivo[i],
    parrafo = seq_along(textos_iteracion),
    texto = textos_iteracion
  )
  
  mensajes <- bind_rows(mensajes, temporal)
}

mensajes

# Paso 5: separo cada texto en palabras para luego calcular frecuencias y realizar visualizaciones (tokenización!!)
textos_palabras <- mensajes %>%
  unnest_tokens(palabra, texto)

textos_palabras

# Paso 6: limpio los textos con la misma lista que utilicé para Voyant Tools y elimino números y  palabras de una sola letra (de esta forma elimino á, é, etc.)

limpieza_voyant <- read_lines("limpieza_voyant.txt") %>%
  str_to_lower()

stop_es <- stopwords("spanish")

stop_total <- unique(c(stop_es, limpieza_voyant))

textos_palabras_limpio <- textos_palabras %>%
  filter(!palabra %in% stop_total) %>%
  filter(!str_detect(palabra, "^[0-9]+$")) %>%  
  filter(!str_detect(palabra, "^.$"))          


# Paso 7: vamos a crear la nube de palabras!!! =)

textos_palabras_limpio %>%
  count(palabra, sort = TRUE) %>% 
  slice_head(n = 60) %>%
  wordcloud2(
    data = .,
    size = 0.8,
    shape = "circle",
    color = "random-light",
    backgroundColor = "white",
    minRotation = 0,
    maxRotation = 0
  )

# Paso 8: vamos a crear un gráfico de frecuencias con las 20 palabras más repetidas

textos_palabras_limpio %>%
  count(palabra, sort = TRUE) %>%
  slice_head(n = 20) %>%
  ggplot(aes(x = reorder(palabra, n), y = n)) +
  geom_col(fill = "#C77DBB") +   # rosa suave
  coord_flip() +
  labs(
    title = "Gráfico de frecuencias",
    x = "Palabra",
    y = "Frecuencia"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", color = "#6A1B9A"),
    axis.text = element_text(size = 11),
    axis.title = element_text(size = 12)
  )

