# Infarto agudo de miocardio: efecto del sexo en la selección de biomarcadores

En este repositorio está disponible el código generado para realizar el análisis de expresión diferencial realizado en el tfm titulado 
"Infarto agudo de miocardio: efecto del sexo en la selección de biomarcadores". Permite realizar el análisis de RNA-seq.  

La descarga de ficheros se realizó mediante la aplicación SRA Toolkit v2.4.1 utilizando el código SRR de cada una de las muestras seleccionadas para el estudio. 
Esta descarga se puede realizar ejecutando el script samples.sh

Previo al análisis de las secuencias aplicamos un control de calidad para detectar posibles mediante FastQC [79] v0.11.9, herramienta bioinformática que permite 
realizar un análisis sobre el contenido en GC, la presencia de adaptadores, k-meros sobrerrepresentados y lecturas duplicadas, permitiendo la identificación de 
errores en la secuenciación o contaminaciones durante la amplificación.
El análisis de la calidad de las secuencias puede realizarse ejecutando el script fastqc.sh

Si las muestras  poseen suficiente calidad puede obviarse la fase de trimmeado. Sin embargo, en nuestro caso algunas de las muestras presentaban baja calidad y 
decidimos utilizar la herramienta Trim Galore! para mejorar su calidad.
Puede ejecutar esta fase del análisis mediante el script trim2.sh

Una vez que nos hayamos asegurado que la calidad de nuestras secuencias es adecuada, las alinearemos contra el genoma de referencia. En nuestro caso, empleamos 
dos alineadores diferentes HISAT2 y STAR. Estos alineadores difieren en el algoritmo utilizado para mapear los transcritos y generalmente, STAR ofrece mejores 
resultados, aunque el coste computacional es
más elevado que el de HISAT2.
Previamente a este alineamiento, debemos usar el comando `$ hisat2-build -f GRCh38_genome.fa index` para crear el indice a partir del genoma de referencia en formato 
fasta. Una vez generado el índice ejecutaremos el script hisat2.sh para alinear los reads al genoma de referencia. En caso de utilizar STAR, realizaremos el índice 
mediante el script indicestar.sh y el alineamiento mediante staralig.sh

Finalmente utilizaremos SAMtools mediante la línea de código: `| samtools view -Sb | samtools sort -o /desired/path`, obteniendo un fichero BAM ordenado para cada 
par de reads. En este punto, puedes crear un nuevo directorio y mover los ficheros BAM dentro:t `mv eg2.sorted.bam ../alignment/sorted/`. Por último,comprobaremos
el número cuantas reads alineados a cada gen. Existen múltiples herramientas para realizar el conteo, pero nosotros decidimos utilizar featureCounts, del paquete 
subreads. El conteo se realiza mediante la ejecución del scripto count.sh

Las matrices de conteos obtenidas serán las que utilizaremos en el análisis de expresión diferencial (DE) mediante el paquete DESeq2 y posteriormente realizaremos la
anotación de términos GO/KEGG, la identificación de genes HUBB y el análisis de redes de interacción proteína-proteína mediante Cytoscape.


## Credits

Este análisis fue realizado a partir de las muestras de 2 estudios diferentes. 
La selección de las muestras se realizó teniendo en cuenta el tipo de estudio, que fuesen muestras de sangre periférica, que especificase el tipo de IAM sufrido, 
el sexo y la edad del individuo.
El estudio con el identificador GEO GSE103182 contiene muestras de RNA-seq de sangre periférica de pacientes que habían sufrido infarto agudo de miocardio, siendo 
clasificados como pacientes STEMI y pacientes NSTEMI. 
Ante la ausencia de pacientes sanos que actuasen de control en dicho estudio fue necesaria su selección de otro estudio realizado por el mismo grupo de investigación,
incluido en GEO con el identificador GSE120312. 
Todas las muestras incluidas en el estudio fueron secuenciadas por el grupo de Inmunología y Genómica Funcional del Centro Cardiologico Monzino IRCCS mediante la 
máquina AB 550xl Genetic Analyzer.
El estudio fue supervisado por Manuel Franco Nicolás (profesor titular del departamento de Estadística e Investigación Operativa de la Universidad de Murcia) y 
Antonio Manuel Lax Pérez (Investigador principal en el grupo de Cardiología Clínica y Experimental del Instituto Murciano de Investigación Biosanitaria Pascual 
Parrilla). 

