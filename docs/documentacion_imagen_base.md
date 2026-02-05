# JUSTIFICACIÓN IMAGEN BASE DEL CONTENEDOR

## CRITERIOS DE LA ELECCIÓN DE LA IMAGEN BASE

Se establecen como criterios para la elección de la imagen base del contenedor de testeo de la aplicación los siguientes:

-**Seguridad**: Buscamos una imagen actualizada y mantenida regularmente para minimizar las vulnerabilidades, priorizando aquellas que tienen un menor número de vulnerabilidades. Para esto se usará la herramienta de análisis de vulnerabilidades Snyk, que nos permitirá evaluar y comparar las imágenes candidatas en términos de seguridad.

-**Tamaño**: Se evaluará el tamaño final de la imagen base con la infraestructura de testeo, buscando una imagen que sea lo más ligera posible completa, ya que hay muchas imágenes que pueden ser muy ligeras pero no incluyen las herramientas necesarias para el testeo de la aplicación, lo que podría requerir la instalación de paquetes adicionales y aumentar el tamaño final de la imagen.

-**Disponga de una shell**: Es importante que la imagen base disponga de una shell para facilitar la ejecución de comandos y la depuración durante el proceso de testeo, ya que hay muchas imágenes que son muy ligeras pero no incluyen una shell, lo que puede dificultar la interacción con el contenedor y la ejecución de comandos necesarios para el testeo.

## IMAǴENES BASE EVALUADAS:

### Imágenes Oficiales(Mantenidas por Docker):
La documentación de estas imágenes oficiales se encuentra en este [enlace](https://hub.docker.com/_/ruby).

- **ruby**: se trata de la imagen por defecto es un sistema linux completo basado en debian. Al tratarse de un sistema completo su tamaño de base es elevado.

- **ruby:slim**: es una versión reducida de la imagen oficial, es la misma base que la anterior pero se eliminan manuales, documentación y paquetes extra para reducir su tamaño.

- **ruby:alpine**: esta versión usa Alpine Linux como base, esta diseñada específicamente para contenedores y en lugar de usar glibc usa musl, esto hace que se reduzca bastante el tamaño. Aunque al usar musl puede provocar problemas de compatibilidad con algunas gemas que esperan glibc.

### Imágenes no oficiales (Creadas por empresas o proyectos de la comunidad):

- **openeuler/distroless-ruby:<version>**: Esta imagen sigue la filosofía del proyecto [Distroless](https://github.com/GoogleContainerTools/distroless) de google pero es mantenida por la comunidad de openeuler. Las imágenes distroless están diseñadas para contener solo la aplicación y sus dependencias, sin incluir un sistema operativo completo. Esto reduce significativamente el tamaño de la imagen y minimiza la superficie de ataque, ya que no hay shell ni herramientas adicionales que puedan ser explotadas. [Documentación](https://hub.docker.com/r/openeuler/distroless-ruby).

- **phusion/passenger-ruby**: Imagen mantenida por Phusion. Esta imagen es al contrario que la anterior es unna imagen todo en uno, incluyendo un sistema operativo basado en ubuntu junto a un servidor web. Esto hace que el tamaño de la imagen sea elevado, aunque incluye muchas herramientas útiles para el desarrollo y testeo de aplicaciones Ruby. [Documentación](https://github.com/phusion/passenger-docker).

- **rubylang/ruby**: Imagen mantenida por los propios desarrolladores de Ruby y su comunidad. Esta  basada en ubuntu y ofrece ventajas en tamaño base frente a la oficial. [Documentación](https://hub.docker.com/r/rubylang/ruby/). 

## EVALUACIÓN DE LAS IMÁGENES BASE

### Evaluación de la shell:

Aplicamos el criterio de la shell a cada una de las imágenes base evaluadas, obteniendo los siguientes resultados:
| Imagen Base | Dispone de Shell |
|-------------|------------------|
| ruby        | Sí               |
| ruby:slim   | Sí               |
| ruby:alpine | Sí               |
| openeuler/distroless-ruby:<version> | No               |
| phusion/passenger-ruby | Sí               |
| rubylang/ruby | Sí               |

La imagen openeuler/distroless-ruby:<version> no dispone de shell, lo que dificulta la interacción con el contenedor y la ejecución de comandos necesarios para el testeo. Por lo tanto, esta imagen no cumple con el criterio de disponer de una shell y se descarta para su uso como imagen base del contenedor de testeo.

