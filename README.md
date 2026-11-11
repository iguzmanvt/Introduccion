# Introducción al crecimiento económico

Presentación docente en R Markdown sobre el programa del curso, medición del crecimiento y bienestar, convergencia, hechos del crecimiento e instituciones. El repositorio conserva su edición independiente: una fuente, 19 imágenes y la [licencia MIT original](LICENSE).

La fuente [Crecimiento Economico 1.Rmd](Crecimiento%20Economico%201.Rmd) genera diapositivas ioslides y un HTML de lectura. Incluye una tabla inicial del temario y una tabla final sobre factores del crecimiento. Dieciséis imágenes se leen desde el Rmd; las otras tres imágenes versionadas también se conservan.

## Generar y revisar

Se requieren Python 3, Git, R y Pandoc; en R, los paquetes `rmarkdown`, `knitr`, `plotly`, `shiny`, `png`, `jpeg`, `gridExtra` y `kableExtra`, utilizados por la fuente. Cargar `shiny` no implica iniciar un servidor: los bloques de esta presentación construyen imágenes y tablas estáticas.

Desde la raíz del repositorio, con los ejecutables disponibles en PATH:

```sh
python scripts/verificar_rutas_imagenes.py
Rscript scripts/renderizar_introduccion.R /ruta/fuera/del/repositorio/introduccion
```

En el Windows comprobado, desde PowerShell:

```powershell
python scripts/verificar_rutas_imagenes.py --rscript 'C:\Program Files\R\R-4.3.3\bin\Rscript.exe' --report "$env:TEMP\Introduccion_imagenes.json"
$env:RSTUDIO_PANDOC = 'C:\Program Files\RStudio\resources\app\bin\quarto\bin\tools'
& 'C:\Program Files\R\R-4.3.3\bin\Rscript.exe' --vanilla scripts/renderizar_introduccion.R "$env:TEMP\Introduccion_revision"
```

El directorio de salida debe estar vacío o no existir y encontrarse fuera del repositorio. Se crean `ioslides_presentation/Introduccion.html` y `html_document/Introduccion.html`. Conserva cada carpeta completa, con sus archivos asociados. El generador copia el CSS local, fija el directorio de las lecturas de imagen y mantiene los intermedios fuera del repositorio. En las diapositivas, las flechas permiten avanzar y las láminas largas admiten desplazamiento vertical.

## Corrección del 11 de noviembre de 2026

Se sustituyeron 16 rutas del Escritorio original por los nombres exactos de las imágenes adyacentes: 14 lecturas PNG y dos JPEG. Se retiró `runtime: shiny` de la lista de formatos, se conservó la configuración smaller/widescreen de ioslides y se declaró una dependencia local de jQuery para las tablas. El resto del cuerpo docente permanece idéntico. La fuente conserva sus finales CRLF originales mediante `.gitattributes`.

El [CSS local](introduction.css) adapta el acceso al contenido largo sobre el estilo predeterminado de ioslides y Bootstrap. No se atribuye a este archivo el diseño histórico de `air.css`, que no estaba en el repositorio. Ambos formatos usan `self_contained: false` y se distribuyen con sus recursos.

| Criterio | Alcance de la comprobación |
| --- | --- |
| Rutas e imágenes | 16 destinos con nombre y mayúsculas exactos; lectura de 14 PNG y dos JPEG |
| Contenido docente | Diferencias limitadas a rutas, cabecera y una línea de dependencia jQuery en setup |
| Figuras generadas | Comparación controlada con el original, redirigiendo sus lecturas a las mismas imágenes |
| Presentación y HTML | Generación separada, tablas, estilos locales y navegación |
| Historial y recursos | Se preservan las 19 imágenes y la licencia; corrección por commit normal |

La comprobación en Windows generó ambos formatos: 61 láminas de ioslides incluida la portada, 13 figuras locales y dos tablas. Los 13 PNG coincidieron por SHA-256 con el control; las celdas de ambas tablas coincidieron al interpretar los saltos de línea HTML. Chrome comprobó estilos, teclado y acceso al contenido largo, sin errores de JavaScript, recursos locales ausentes o desbordamiento horizontal. Las 19 imágenes se decodificaron correctamente. Se usaron R 4.3.3, rmarkdown 2.28, knitr 1.46 y Pandoc 3.10; su aviso sobre `--no-highlight` no impidió generar los HTML.

La comparación controlada utiliza el mismo entorno y los mismos gráficos de entrada. No atribuye equivalencia a una generación histórica de otro equipo ni valida las cifras de las imágenes. El verificador de rutas no ejecuta los bloques Rmd ni revisa enlaces externos.

## Dependencias externas y continuidad

La presentación conserva 30 iframes: 13 de Our World in Data y 17 de Chart Studio. Las pruebas locales comprueban imágenes, tablas y navegación con el contenido externo bloqueado. No acreditan disponibilidad de esos gráficos, actualidad de sus cifras ni funcionamiento integral sin conexión. MathJax también puede requerir red.

Los 17 IDs de Chart Studio coinciden con los documentados en el [catálogo de referencias de Crecimiento](https://github.com/iguzmanvt/Crecimiento/tree/df1639e97f20b9e6b386b14d4edfe2ef3b84efac/Clases_Crecimiento_Economico/Introduction/referencias_externas). Ese catálogo conserva metadatos y una solicitud preparada al proveedor; la recuperación numérica permanece pendiente. Sus 32 referencias pertenecen a las variantes del curso completo, mientras esta edición conserva 30.

Para el resto del curso, consulta [iguzmanvt/Crecimiento](https://github.com/iguzmanvt/Crecimiento). Esta entrega corrige el repositorio existente y no cuenta como una selección docente nueva. Las imágenes, textos, cifras y licencia mantienen su estado histórico.
