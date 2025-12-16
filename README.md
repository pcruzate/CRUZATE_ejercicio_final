# CRUZATE_ejercicio_final
Repositorio creado para el ejercicio final de Módulo de actualización técnica y herramientas digitales.

# Estructura del repositorio
- README.md: descripción del proyecto y análisis del corpus.
- corpus2: carpeta que contiene los archivos analizados proporcionados por la profesora.
- img_voyant: carpeta que contiene las capturas de pantalla de las visualizaciones realizadas en Voyant Tools en formato .png, junto con archivos .txt que incluyen la URL de Voyant con los textos cargados, las URLs de los análisis realizados y la lista de palabras utilizadas para la limpieza de los archivos.
- CRUZATE_ejercicio_final.R: script en R con el procesamiento y análisis del corpus. 
  
# Herramientas utilizadas
- RStudio
- Voyant Tools
- GitHub

# Metodología
1. Carga de textos desde la carpeta corpus2.
2. Carga de textos en Voyant Tools, limpieza, exploración de herramientas, capturas de pantalla y copia de URL de las diferentes visualizaciones exploradas. Carga de todos estos elementos en la carpeta img_voyant. 
3. Carga de textos en R, limpieza, tokenización y creación de nube de palabras y gráfico de barras.
4. Análisis del corpus, que se presenta a continuación.
   - Observación: Durante el proceso de limpieza del corpus, tanto en Voyant Tools como en R, se identificaron limitaciones en el tratamiento de caracteres acentuados. En consecuencia, algunos términos incorporados a la lista de palabras a eliminar (como “así”, “allí” o “él”) permanecieron visibles en determinadas visualizaciones. Esto fue mucho más marcado en R. 


# Análisis del corpus
1. ¿Pueden determinar con las visualizaciones realizadas qué temas predominan?

Sí, a partir de las visualizaciones se puede determinar que predominan tres grandes temas: 1) la cultura aborigen, evidenciada por palabras como indios, guaraníes, pueblos y Paraguay; 2) la monarquía española, reflejada en términos como rey, español, españoles y gobernador; y 3) el territorio y el espacio geográfico, representados por palabras como tierras, río, isla, mar y ciudad. Para este análisis fue particularmente útil la herramienta nube de palabras, tanto de Voyant Tools como de RStudio. 

2. ¿Pueden evidenciar diferencias entre los textos del corpus?

Sí, se pueden evidenciar diferencias entre los textos del corpus, a partir del análisis de las Palabras diferenciadas que aparecen en el sumario de Voyant Tools. Aunque todos los textos comparten un contexto histórico de aborígenes, exploración y colonización, las diferencias en el vocabulario reflejan los distintos enfoques y propósitos de cada autor: 

- Azara_Descripcion: Predominan términos relacionados con la cultura guaraní y el territorio, como guaranís, Asunción, río y tierras, lo que sugiere una descripción detallada del entorno y las comunidades aborígenes.
- DiazDeGuzman_ArgManus: En este texto destacan términos como Asunción, río, capitán y Nuflo, reflejando una narración más enfocada en la exploración y la conquista española.
- DuBiscay_RelDeUnViaje: Las palabras mercaderías, salvajes y río indican un enfoque en las experiencias de comercio y la relación con pueblos indígenas en el contexto de un viaje, probablemente hacia el interior del continente. También, se evidencia la perspectiva colonialista despectiva hacia los pueblos aborígenes.
- Hudson_DiasDeOcio: Este texto tiene una terminología más moderna, centrada en la descripción del entorno natural y las sensaciones de viaje, como patagonia, notas y kilómetros, lo que refleja un enfoque más centrado en el paisaje y la experiencia personal.
- LeyendaAraucana: Aquí, las palabras ancali, vilca, suri y curaca sugieren un enfoque más mítico y cultural, vinculado a leyendas aborígenes.
- PHernandez_RelCosas: Los términos comuneros y garcia parecen estar vinculados a la colonización española.
- PMoreno_ViajePatagonia: Predominan términos como mesetas, lago y bote, que indican un enfoque descriptivo y geográfico centrado en el viaje por el territorio sudamericano, con un énfasis en el paisaje natural.
- Pigafetta_PrimerViaje: La presencia de términos como rey, capitán y rajá señala un relato más centrado en la monarquía y la interacción con figuras de autoridad durante el viaje (que se evidencia en la palabra capitán), con un enfoque en las relaciones de poder.
- Schmidl_ViajeAlRdP: En este caso, la palabra capitán sugieren una narración más centrada en la experiencia del viajero y su relación con los eventos ocurridos durante el viaje.
- Viedma_Diario: Las palabras amaneció, pepys y goycochea sugieren un texto más enfocado en la experiencia diaria, con un estilo más personal y observacional, quizás relacionado con la vida cotidiana y la interacción con otros individuos. 


4. ¿Qué palabras son las más frecuentes? ¿cuáles luego de eliminar palabras vacías?

Las palabras más frecuentes, según el sumario de Voyant Tools, son:

- Antes de la limpieza: a (10579); no (3823); más (2175); le (1549); indios (1255)
- Luego de la limpieza: indios (1255); río (1175); tierra (919); españoles (511); pueblo (480) (esto es coincidente con el gráfico de barras obtenido con RStudio, si obviamos las palabras que no pudieron ser limpiadas como día, allí, después y así). 

6. ¿Qué hipótesis inicial podrían formular?

Mi hipótesis es que el corpus analizado aborda de manera transversal los procesos de contacto entre pueblos aborígenes y europeos, la colonización y la exploración del territorio sudamericano, pero desde perspectivas diversas. Mientras algunos textos se centran en las experiencias personales de viaje y en la observación del entorno natural, otros enfatizan la autoridad y la supremacía de la monarquía española, y otros se enfocan en la descripción de los pueblos aborígenes, sus costumbres y sus leyendas. Asimismo, es posible suponer que los textos pertenecen a distintas épocas históricas y fueron producidos por autores de diferentes regiones y tradiciones culturales, lo que explicaría la variedad de enfoques, vocabularios y objetivos discursivos presentes en el corpus.

7. ¿Qué pueden decir respecto a este sencillo análisis comparativo entre R y Voyant Tools?

Respecto a este análisis comparativo entre R y Voyant Tools, considero que ambas herramientas son muy potentes para el análisis de corpus y que cada una tiene sus ventajas y desventajas. Por un lado, Voyant Tools permite limpiar los corpus de forma más sencilla que R, algo fundamental para este tipo de análisis, y además ofrece muchas herramientas en una interfaz muy amigable, lo que facilita obtener resultados de manera rápida e intuitiva.

Por otro lado, R resulta más laborioso, ya que es necesario programar cada gráfico o resultado que se quiere obtener. Sin embargo, esto también es una ventaja, porque permite adaptar las visualizaciones al gusto personal del programador, por ejemplo elegir la cantidad de palabras o los colores de una nube de palabras. Una desventaja que encontré es que R no limpia correctamente las palabras con acentos (si bien esto también ocurrió en Voyant Tools, en R la limpieza fue notablemente peor). En mi caso, pude resolverlo quitando los acentos de todo el corpus, lo que dio resultados muy limpios, pero considero que, aunque una nube de palabras sea más exacta, la ausencia de acentos puede no ser apropiada para un trabajo de análisis literario, por eso presenté el resultado de la nube de palabras con acentos aunque perdí limpieza del corpus en el proceso.

En conclusión, ambas herramientas son útiles y pueden usarse según lo que uno esté buscando: Voyant Tools ofrece un análisis más inmediato, mientras que R permite un mayor nivel de personalización.
Como trabajo futuro, me queda encontrar la forma de realizar una limpieza más exhaustiva del corpus de datos, tanto en Voyant Tools como en R, para mejorar la calidad y la precisión de los análisis obtenidos.
