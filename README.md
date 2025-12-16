# CRUZATE_ejercicio_final
Repositorio creado para el ejercicio final de Módulo de actualización técnica y herramientas digitales

# Estructura del repositorio
- README.md: descripción del proyecto
- corpus2: contiene los archivos analizados que dio la profesora
- img_voyant: capturas de pantalla de las visualizaciones realizadas en Voyant Tools en formato .png y archivos con la URL de Voyant con los textos cargados, URLs de los análisis realizados y lista de palabras utilizadas para la limpieza de los archivos en formato .txt
- CRUZATE_ejercicio_final.R: script en R con el procesamiento y análisis del corpus 
                 Observación: Durante el proceso de limpieza del corpus, tanto en Voyant Tools como en R, se identificaron limitaciones en el tratamiento de caracteres acentuados. En consecuencia, algunos términos incorporados a la lista de palabras a eliminar (como “así”, “allí” o “él”) permanecieron visibles en determinadas visualizaciones.
- Analisis de los corpus: documento .txt con el análisis de los corpus realizado 

# Herramientas utilizadas
- RStudio
- Voyant Tools
- GitHub

# Metodología
1. Carga de textos desde la carpeta corpus2.
2. Carga de textos en Voyant Tools, limpieza, exploración de herramientas, capturas de pantalla y copia de URL de las diferentes visualizaciones exploradas. Carga de todos estos elementos en la carpeta img_voyant. 
3. carga de textos en R, limpieza, tokenización y creación de nube de palabras y gráfico de barras.
4. Análisis de los corpus, que se presenta a continuación.

# Análisis de los corpus
1. ¿Pueden determinar con las visualizaciones realizadas que temas predominan?
- Sí, a partir de las visualizaciones se puede determinar que predominan tres grandes temas: 1) la cultura aborigen, evidenciada por palabras como indios, guaraníes, pueblos y Paraguay; 2) la monarquía española, reflejada en términos como rey, español, españoles y gobernador; y 3) el territorio y el espacio geográfico, representados por palabras como tierras, río, isla, mar y ciudad. Para este análisis fue particularmente útil la herramienta nube de palabras, tanto de Voyant Tools como de RStudio. 

2. ¿Pueden evidenciar diferencias entre los textos del corpus?
- Sí, se pueden evidenciar diferencias entre los textos del corpus, a partir del análisis de las Palabras diferenciadas que aparecen en el sumario de Voyant Tools. Aunque todos los textos comparten un contexto histórico de aborígenes, exploración y colonización, las diferencias en el vocabulario reflejan los distintos enfoques y propósitos de cada autor: 

Azara_Descripcion: Predominan términos relacionados con la cultura guaraní y el territorio, como guaranís, Asunción, río y tierras, lo que sugiere una descripción detallada del entorno y las comunidades aborígenes.

DiazDeGuzman_ArgManus: En este texto destacan términos como Asunción, río, capitán y nuflo, reflejando una narración más enfocada en la exploración.

DuBiscay_RelDeUnViaje: Las palabras mercaderías, salvajes y río indican un enfoque en las experiencias de comercio y la relación con pueblos indígenas en el contexto de un viaje, probablemente hacia el interior del continente. También, se evidencia la perspectiva colonialista despectiva hacia los pueblos aborígenes, con palabras como salvajes. 

Hudson_DiasDeOcio: Este texto tiene una terminología más moderna, centrada en la descripción del entorno natural y las sensaciones de viaje, como patagonia, notas y kilómetros, lo que refleja un enfoque más centrado en el paisaje y la experiencia personal.

LeyendaAraucana: Aquí, las palabras ancali, vilca, suri y curaca sugieren un enfoque más mítico y cultural, vinculado a leyendas aborígenes.

PHernandez_RelCosas: Los términos comuneros y garcia parecen estar vinculados a la colonización española. 

PMoreno_ViajePatagonia: Predominan términos como mesetas, lago y bote, que indican un enfoque descriptivo y geográfico centrado en el viaje por la Patagonia, con un énfasis en el paisaje natural.

Pigafetta_PrimerViaje: La presencia de términos como rey, capitán y rajá señala un relato más centrado en la monarquía y la interacción con figuras de autoridad durante el viaje (que seevidencia en la palabra capitán), con un enfoque en las relaciones de poder.

Schmidl_ViajeAlRdP: En este caso, las palabras capitán sugieren una narración más centrada en la experiencia del viajero y su relación con los eventos ocurridos durante el viaje.

Viedma_Diario: Las palabras amaneció, pepys y goycochea sugieren un texto más enfocado en la experiencia diaria, con un estilo más personal y observacional, quizás relacionado con la vida cotidiana y la interacción con otros individuos. 


4. ¿Qué palabras son las más frecuentes? ¿cuáles luego de eliminar palabras vacías?
- 

6. ¿Qué hipótesis inicial podrían formular?

7. ¿Qué pueden decir respecto a este sencillo análisis comparativo entre R y Voyant Tools?

