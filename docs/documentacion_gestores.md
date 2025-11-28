# DOCUMENTACIÓN DE GESTORES:

En los proyectos siempre hay una serie de tareas que se llevan a cabo de forma muy repetitiva, aquí es donde entran los gestores, estos son los encargados de gestionar y realizar estas actividades tan repetitivas. Pero antes de esto se necesita haber escogído el lenguaje , porque cada lenguaje dispone de diferentes opciones en gestores.

Para ello tenemos que partir del lenguaje escogido para este proyecto el cual es **ruby**.

## JUSTIFICACIÓN DEL LENGUAJE:

Para elegir el lenguaje del problema se tuvo en cuenta una serie de lenguajes, entre ellos se comentaron en clase go, typescript, ruby y a parte me llamó la curiosidad Kotlin. Tanto go como typescript fueron descartados debido a que otros compañeros ya lo habían elegido antes, dejando las opciones de ruby y kotlin.

**Kotlin**  era mi idea principal para su uso pero tras largas conversaciones con JJ entendí que al ser de la JVM al igual que java acarrearía el problema de  que los conceptos vistos en la asignatura difieren bastante de como se trabaja en kotlin. Por tanto esto le añadiría un plus de dificultad a la superación en los objetivos. AUnque también al usarlo la experiencia que ganaríamos sería muy buena ya que kotlin es un lenguaje muy usado, multiplataforma y teniendo una buenísima remuneración.

En cambio **Ruby** se asemeja a python, por tanto en cuanto al plus de dificultad de los conceptos se eliminaría, al ser tambien un lenguaje muy usado se dispone de una gran cantidad de documentación. Es un lenguaje con una curva de aprendizaje no muy grande y añadiendole que en la carrera se usa, quitaríamos esa necesidad de aprender desde cero, dejando más tiempo para trabajar los conceptos propuestos de la asignatura.

Tras debatir los pros y contras en un Issue con mi compañero Gabriel Francisco nos decidímos por ruby.

Una vez elegido el lenguaje hay que centrarse en que versión instalar para desplegar la aplicación, en un proyecto es recomendable probar distintas versiones del lenguaje para comprobar que no tenemos problemas en las distintas versiones, aunque a la hora de trabajar usaremos la última versión estable. Aquí es donde entra el **gestor de versiones**.

## GESTOR DE VERSIONES.

El gestor de versiones nos permite tener varias versiones de un mismo lenguaje en la misma máquina podiendo variar entre ellas gracias a él.

Para trabajar con **ruby** a la hora de elegir un gestor de versiones me he fijado en : **rbenv** que es el estandar moderno, **RVM** que es el clásico. Vamos a enumerar pros y contras para decantarnos por uno fijandonos en lo siguientes factores:
    - En la velocidad.
    - Deuda Técnica.
    - Estandar actual

En la velocidad nos fijaremos en que para cambiar de versión Rbenv es muho más rápido que RVM, ya que Rbenv sigue la idea de "hacer una sola cosa bien" haciendolo una herramienta menos pesada, mientras que RVM es una herramienta todo en uno siendo muy pesada.

Hablando de la deuda técnica RVM puede acarrear bastantes problemas de cara al futuro, debido a que para cambiar de versión RVM carga una gran cantidad de variables de entorno que pueden generar conflicto con otras herramientas, mientras que Rbenv modifica el PATH con la versión seleccionada.

En el [estandar actual](https://www.ruby-toolbox.com/categories/ruby_version_management) la más utilizada es Rbenv.

Teniendo en cuenta todo esto me he decidico por utilizar Rbenv, ya que es mucho más rápida, de cara al futuro tendremos menos problemas y es el estandar actual.


### INSTALACIÓN Y USO 
- Para instalarlo he seguido la siguiente [referencia](https://github.com/rbenv/rbenv?tab=readme-ov-file).
- Comandos para [usarlo](https://hexmos.com/freedevtools/tldr/common/rbenv/).

### BIBLIOGRAFÍA
He usado dos referencias de comparaciones entre **rvenb y RVM**.
- [Link 1](https://dev.to/lovestaco/rbenv-vs-rvm-picking-your-ruby-version-manager-buddy-4130#:~:text=If%20you%20want%20an%20all,RVM%20is%20a%20solid%20pick.).
- [Link 2](https://www.mindfiresolutions.com/blog/2018/01/rbenv-vs-rvm/)

En todo proyecto se instalan una gran cantidad de bibliotecas ( en el caso de **ruby gems** ), estas bibliotecas tienen versiones y dependencias, con las que hay que tratar y se tienen que instalar de la mejor forma. Para esto hay herramientas que se encargan de hacerlo **los gestores de dependencias**.

## GESTORES DE DEPENDENCIAS.

Un **gestor de dependencias** es el encargado de descargar, instalar y configurar software de terceros que tu proyecto necesita para funcionar, garantizando crear un entorno para que funcione el proyecto.

A la hora de elegir el gestor de dependencias en **ruby**, no hay mucha controversia en cual elegir, siguiendo el [estandar](https://www.ruby-toolbox.com/categories/dependency_management) como en el caso anterior sería **Bundler**. Se puede observar en el enlace que en la gráfica no se usa ningún otro.

Antiguamente había debate en cual usar si Bundler o RVM gemsets, pero RVN gemsets en sí no se puede considerar un gestor de dependencias, lo único que hace es aislar las gemas pero no trata con las dependencias .

### INSTALACION Y USO.

Bundler viene instalado por defecto en en cualquier distribución moderna de Ruby por tanto solo habría que seguir la guía de su uso de la [Documentación oficial](https://bundler.io/).

### BIBLIOGRAFÍA:
- [Referencia de por qué usar Bundler en lugar de RVN Gemsets](https://www.engineyard.com/blog/do-we-still-need-rvm-gemsets/)

En cualquier proyecto nos encontramos con el problema de que existen tareas que se repiten como son ejecutar los test, compilar, limpiar archivos temporales, es aquí donde entran los **gestores de tareas**

## GESTORES DE TAREAS
Un **gestor de tareas** es el encargado de ralizar estas tareas tan repetitivas, estas operaciones se definen en un fichero, permitiendo que se ejecuten con un simple comando.

En ruby existen varias opciones en gestores de tareas, **como son Rake, Thor y Make**, a la hora de elegir me he centrado primero en el estandar, la curva de aprendizaje y como interactuan con el proyecto. En cuanto a la curva de aprendizaje, **Make** sería el más tedioso porque tendríamos que usar el lenguaje de la shell de linux, mientras que **Thor y Rake** usan ruby ganando puntos a favor. A la hora de interactuar con el proyecto **Rake** es lo que buscamos, debido a que con un rakefile en el proyecto podemos automatizar las tareas mientras que **Thor** es más bien una herramienta para usar scripts entre varios proyectos que no es lo que buscamos. En cuanto al estandar [Rake](https://www.ruby-toolbox.com/projects/rake) sigue siendo mucho más usado que [Thor](https://www.ruby-toolbox.com/projects/thor), siendo el estandar actual.

Teniendo en cuenta esto y siguiendo la metodología usada en las otras elecciones me he quedado con el estandar que es **Rake**.

### INSTALACION Y USO.

#### INSTALACIÓN
De cara a la instalación al ser **rake una gema**, podemos usar **bundler**, alteraríamos el **Gemfile** añadiendo la linea:

>gem "rake"

Y ejecutamos el comando para instalarlo:

>bundle install

Para este apartado se han usado el comando de [bundler](https://bundler.io/v2.7/man/bundle-install.1.html)

### USO

Para ello tenemos que crear un Rakefile, yo para crearlo he seguido estas guias:
    - [Rakefile Format](https://ruby.github.io/rake/doc/rakefile_rdoc.html#label-Deprecated+Task+Parameters+Format).
    - [Rake and Project Automatomatitation](https://graceful.dev/courses/the-freebies/modules/rake-and-project-automation/).
    - [What us Rake In Ruby y How To Use it](https://www.rubyguides.com/2019/02/ruby-rake/).

Y ejecutarlo junto a bunler para tener en cuenta las dependencias:

>bundle exec rake < Opcional: nombre de tarea>

Todos las opciones de comandos de Rake vienen [aquí](https://ruby.github.io/rake/doc/command_line_usage_rdoc.html).


### BIBLIOGRAFÍA
- [Link Documentación Rake](https://ruby.github.io/rake/).
- [Link Documentación Thor](http://whatisthor.com/).
- [Comparación entre Rake y Thor](https://stackoverflow.com/questions/3524296/rake-vs-thor-for-automation-scripts)








