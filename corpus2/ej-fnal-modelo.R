#script preparación trabajo final
#todo lo que empieza con símbolo de numeral, es comentario

rm(list = ls()) #limpio mi entorno de trabajo

getwd() #obtengo mi dirección de trabajo
#si descargan de forma convencional el zip, vayan a la línea sin comentar que sigue

#si quieren descargarlo desde consola, eliminan en las líneas que siguen el simbolo de numeral
#download.file("https://github.com/rominicky/materiales/raw/refs/heads/main/corpus-analisis_textual2025.zip", 
#              destfile="corpus.zip", 
#              "wget") 
# Aclaración para Windows reemplazar 'wget' por "wininet"

##descomprimo el zip
#unzip("corpus-analisis_textual2025.zip")

# Ingresa a la carpeta que se ha creado y le asignamos el nombre 'pathwd'
#recuerda que puedes incluso crear otra carpeta para datos de entrada (input) y datos de salida (output) para cargar y guardar tus archivos
# pathwd <- setwd("corpus2") descomento esta línea si mi carpeta se llama corpus2
pathwd <- getwd() #asigno la dirección de trabajo a la variable pathwd
#listo mis archivos de texto plano
list.files(, pattern='txt') 

#llamo las librerías a utilizar
library(tidytext) #recuerda que si no está instalada la librería primero debes hacerlo mediante install.packages()
library(tidyverse)
library(dplyr)
library(ggplot2)
#crearemos una nueva lista, a la que puedes llamar archivos, cuyos elementos serán los textos planos dentro de la carpeta corpus
#función list.files, y le indicarás que tipo de archivo debe contener, txt, con la declaración pattern.
#Recuerda estar trabajando en la carpeta donde se encuentran tus archivos txt, sino deberás incorporar un declaración que indique la ubicación, path ="corpus2"
#ejemplo sería list.files(path = "corpus", pattern = "\\.txt$")
archivos <- list.files(pattern = ".txt$", full.names = TRUE)

archivos #corroboramos que la lista es correcta

class(archivos) 

#la función 'class()' devuelve el tipo de objeto, en este caso podrás ver que se trata de una lista de caracteres

length(archivos) 

#la función 'length()' permite obtener el tamaño del objeto que se incluye dentro de los paréntesis

#para facilitar la visualización de cada texto en los siguientes pasos, eliminaremos lo que no es necesario del nombre de cada archivo

#función gsub, de gran utilidad para limpieza de datos que está incluida por defecto en R. Los parámetros indicarán, según orden de escritura, caracteres que se eliminarán (\\. será para indicar que se busca un .

textos_archivo <- gsub(".txt", "", archivos, perl = TRUE)

#Ahora llama a la lista para corroborar que se ha realizado la limpieza

textos_archivo

#procedemos a armar un tibble, este objeto es muy similar a los data.frame, pues es rectangular, organizado en filas y columnas, y pertenece al paquete tidyverse

mensajes <- tibble(textos_archivo = character(),
                   parrafo = numeric(),
                   texto = character()) 

#tres columnas, la primera y última tendrán caracteres dentro de sus variables, y parrafo será numérica

mensajes

#Para poder completar el dataframe mensajes que creamos, lo hacemos mediante una iteración con el bucle for, que permite repetir instrucciones, evaluando el mismo código para cada elemento de un vector o lista

#Iteración 
for (i in 1:length(archivos)){
      textos_iteracion <- read_lines(paste( pathwd, # 
                                   archivos[i],
                                   sep = "/"))
      temporal <- tibble(textos_archivo = textos_archivo[i],
                         parrafo = seq_along(textos_iteracion),
                         texto = textos_iteracion)
      mensajes <- bind_rows(mensajes, temporal)
    } 
    
    mensajes #corrobora que se creó correctamente la tabla
#ahora vamos a realizar el proceso de tokenización
#se utilizará la función unnest_tokens que se encuentra dentro del paquete tidytext; se indicará que a cada fila de parrafo, lo separe a nivel de palabra según la columna texto.

#textos_palabras estará formado por tres columnas, una que indicará el texto, la otra el número de párrafo y finalmente, las palabras de cada uno, pero separadas. Recuerda que el operador pipe (%>%) fue presentado en la primera unidad.
textos_palabras <- mensajes %>% 
  unnest_tokens(palabra, texto)
#vemos el resultado
textos_palabras

#si bien, para poder hacer una comparación más limpia con Voyant, deberíamos hacer una limpieza de stopwords, palabas vacías
#vamos directamente a la gráfica de nube de palabras

library("wordcloud") #esta librería permite crear nubes de palabras, si no está instalada debes hacerlo mediante install.packages("wordcloud")
#con los datos ya tokenizados, podemos proceder a crear la nube de palabras
textos_palabras %>% 
  count(palabra, sort = T) %>%
  with(wordcloud(palabra,
                n,
                max.words = 450,
                color = brewer.pal(8, "Paired")))

#ahora vamos a instalar y llamar a la librería wordcloud2, que permite crear nubes de palabras más interactivas
library(wordcloud2)
#vamos a utilizar nuevamente el dataframe textos_palabras y crear la nube de palabras
textos_palabras %>%
  count(palabra, sort = T) %>% #le indico que cuente las palabras y las ordene de mayor a menor
  wordcloud2(data = ., size = 0.85, #tamaño de la nube
                   #maxWords = 300, #máximo de palabras a mostrar, si no quiero limitarlo puedo eliminar este parámetro
                   shape = 'circle', #forma de estrella, podríamos añadir circle, cardioid, diamond, triangle-forward, triangle, pentagon, star
                   color = 'random-dark', #gama de colores, también podríamos usar random-light, u otra paleta recomiendo siempre ver dentro de las opciones de la librería
                   #ellipticity = 0.6, #elipticidad de la nube, para darle una forma más alargada
                   backgroundColor = "white", 
                   minRotation = 0,
                   maxRotation = 0)
                   
#Como último punto, podríamos observar que sucede si eliminamos las stopwords en español
#primero debemos cargar las stopwords en español
stopwords1 <- get_stopwords("es") #la función get_stopwords permite obtener las stopwords en diferentes idiomas, en este caso "es" es español

#vemos las primeras filas    
stopwords1

#procedemos a eliminar las stopwords del dataframe textos_palabras
textos_limpio <- textos_palabras %>% 
  anti_join(stopwords1, by = c("palabra" = "word")) #en esta línea se indica que se eliminen las palabras que coincidan entre ambas tablas, en la columna palabra del dataframe textos_palabras y la columna word del dataframe stopwords1

#la función 'anti_join' permite hacer una unión excluyente, es decir, elimina las coincidencias  

#procedemos a ver el resultado
textos_limpio

#finalmente, creamos la nube de palabras sin las stopwords
textos_limpio %>% #como continuarian el código? 
#en esta parte pueden también añadirlo para que forme parte de la ejercitación final





