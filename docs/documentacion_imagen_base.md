# JUSTIFICACIÓN IMAGEN BASE DEL CONTENEDOR

## CRITERIOS DE LA ELECCIÓN DE LA IMAGEN BASE

Se establecen como criterios para la elección de la imagen base del contenedor de testeo de la aplicación los siguientes:

-**Seguridad**: Buscamos una imagen actualizada y mantenida regularmente para minimizar las vulnerabilidades, priorizando aquellas que tienen un menor número de vulnerabilidades. Para esto se usará la herramienta de análisis de vulnerabilidades Snyk, que nos permitirá evaluar y comparar las imágenes candidatas en términos de seguridad.

-**Tamaño**: Se evaluará el tamaño final de la imagen base con la infraestructura de testeo, buscando una imagen que sea lo más ligera posible completa, ya que hay muchas imágenes que pueden ser muy ligeras pero no incluyen las herramientas necesarias para el testeo de la aplicación, lo que podría requerir la instalación de paquetes adicionales y aumentar el tamaño final de la imagen.

-**Disponga de una shell**: Es importante que la imagen base disponga de una shell para facilitar la ejecución de comandos y la depuración durante el proceso de testeo, ya que hay muchas imágenes que son muy ligeras pero no incluyen una shell, lo que puede dificultar la interacción con el contenedor y la ejecución de comandos necesarios para el testeo.