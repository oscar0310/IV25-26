# JUSTIFICACIÓN DE LA ELECCIÓN DE LA IMAGEN BASE 

## CRITERIOS DE LA ELECCIÓN DE LA IMAGEN BASE 

Se establecen como criterios para la elección de la imagen base del contenedor de testeo de la aplicación los siguientes:

- **Permita usar el gestor de dependencias Bundler**: Es necesario que la imagen permita el uso de Bundler ya que es el encargado de instalar las dependencias del proyecto en el entorno de pruebas.

- **Permita usar el gestor de tareas Rake**: Es necesario que la imagen permita el uso de Rake ya que es el encargado de ejecutar las tareas de testeo de la aplicación.

- **Tamaño**: Se evaluará el tamaño final de la imagen base con la infraestructura de testeo, buscando una imagen que sea lo más ligera posible completa, ya que hay muchas imágenes que pueden ser muy ligeras pero no incluyen las herramientas necesarias para el testeo de la aplicación, lo que podría requerir la instalación de paquetes adicionales y aumentar el tamaño final de la imagen.

- **Seguridad**: Buscamos una imagen actualizada y mantenida regularmente para minimizar las vulnerabilidades, priorizando aquellas que tienen un menor número de vulnerabilidades. Para esto se usará la herramienta de análisis de vulnerabilidades Snyk, que nos permitirá evaluar y comparar las imágenes candidatas en términos de seguridad.