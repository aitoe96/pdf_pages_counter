
################################################################################

# Función para obtener el número de páginas en un PDF
#Como input recibe la ruta al archivo pdf que quieres contar sus páginas


getNumPagesInPDF <- function(filePath) {
  if (!file.exists(filePath))
    return(0)
  
  if (!file.info(filePath)$isdir) {
    if (is.null(con <- file(filePath, "r")))
      return(0)
    
    i <- 0
    type <- "/Contents"
    
    while (length(line <- readLines(con, n = 1)) > 0) {
      x <- unlist(strsplit(line, type))
      
      if (length(x) > 1) {
        i <- i + 1
      }
    }
    
    close(con)
    return(as.integer(i))
  } else {
    return(0)
  }
}

################################################################################

#Si quieres hacerlo de forma iterativa y que te de el numero total de páginas 
#de todos los archivos que hay en una carpeta:

# Ruta a la carpeta con los archivos PDF
folderPath <-  "/RUTA/A/TU/CARPETA"

# Listar archivos PDF en la carpeta
pdfFiles <- list.files(folderPath, pattern = "\\.pdf$", full.names = TRUE)

# Inicializar variable para el número total de páginas
totalPages <- 0

# Iterar a través de los archivos PDF y obtener el número de páginas
for (pdfFile in pdfFiles) {
  numPages <- getNumPagesInPDF(pdfFile)
  cat("Archivo:", gsub(pdfFile, pattern = "/RUTA/A/TU/CARPETA", replacement = "")
, "- Número de páginas:", numPages, "\n") #OJO LEER SIGUIENTE LÍNEA

# Aquí para que el resultado salga más bonito le he quitado la ruta del archivo
# Sustituye "/RUTA/A/TU/CARPETA" por la ruta real que has usado para folderPath
  
  # Agregar el número de páginas al total
  totalPages <- totalPages + numPages
}

# Imprimir el número total de páginas
cat("Número total de páginas en todos los archivos:", totalPages, "\n")








