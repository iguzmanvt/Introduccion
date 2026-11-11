# Genera ambos formatos en un directorio vacío fuera del repositorio.
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) stop("Uso: Rscript scripts/renderizar_introduccion.R DIRECTORIO_SALIDA")
script_arg <- grep("^--file=", commandArgs(), value = TRUE)
script <- normalizePath(sub("^--file=", "", script_arg), winslash = "/", mustWork = TRUE)
repo <- dirname(dirname(script))
dir.create(path.expand(args[1]), recursive = TRUE, showWarnings = FALSE)
out <- normalizePath(path.expand(args[1]), winslash = "/", mustWork = TRUE)
canonical <- function(path) if (.Platform$OS.type == "windows") tolower(path) else path
if (canonical(out) == canonical(repo) || startsWith(canonical(out), paste0(canonical(repo), "/"))) {
  stop("La salida debe estar fuera del repositorio.")
}
if (length(list.files(out, all.files = TRUE, no.. = TRUE))) stop("El directorio de salida debe estar vacío.")
for (format in c("ioslides_presentation", "html_document")) {
  destination <- file.path(out, format)
  dir.create(destination)
  if (!file.copy(file.path(repo, "introduction.css"), destination)) stop("No se pudo copiar el CSS.")
  intermediates <- file.path(destination, "intermedios")
  dir.create(intermediates)
  result <- rmarkdown::render(
    file.path(repo, "Crecimiento Economico 1.Rmd"), output_format = format,
    output_file = "Introduccion.html", output_dir = destination,
    intermediates_dir = intermediates, knit_root_dir = repo,
    envir = new.env(parent = globalenv()), clean = TRUE, quiet = TRUE
  )
  cat("Generado:", result, "\n")
}
cat("Conservar cada carpeta completa. Los recursos externos requieren conexión.\n")
