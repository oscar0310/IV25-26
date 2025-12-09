# DOCUMENTACIÓN DE GESTORES:

En los proyectos siempre hay una serie de tareas que se llevan a cabo de forma muy repetitiva, aquí es donde entran los gestores, estos son los encargados de gestionar y realizar estas actividades tan repetitivas. Pero antes de esto se necesita haber escogído el lenguaje, porque cada lenguaje dispone de diferentes opciones en gestores.

Para ello tenemos que partir del lenguaje escogido para este proyecto el cual es **ruby**.

En todo proyecto se instalan una gran cantidad de bibliotecas (en el caso de **ruby gems**), estas bibliotecas tienen versiones y dependencias, con las que hay que tratar y se tienen que instalar de la mejor forma. Para esto hay herramientas que se encargan de hacerlo **los gestores de dependencias**.

## GESTORES DE DEPENDENCIAS.

Un **gestor de dependencias** es el encargado de descargar, instalar y configurar software de terceros que tu proyecto necesita para funcionar, garantizando crear un entorno para que funcione el proyecto.

En **ruby** existe un estandar para especificar las dependencias, este estandar es el archivo [Gemfile](https://tosbourn.com/what-is-the-gemfile/). En el se pude especificar lo siguiente:
- Definir la fuente de donde va a obtener las gemas.
- Las gemas necesarias para el proyecto junto a su versión.
- Se pueden agrupar la gemas por grupos.
- Instalar las gemas desde Git o desde un path local.
- Especificar condiciones para instalar las gemas.

A la hora de elegir el gestor de dependencias en **ruby**, No hay una gran cantidad donde elegir, podemos hablar de [Bundler](https://bundler.io/), el cual viene instalado por defecto en las versiones modernas de **ruby** siendo el [estandar de facto](https://www.ruby-toolbox.com/categories/dependency_management) y usa el estandar para especificar las dependencias. [Gel](https://github.com/gel-rb/gel) que es una gem de ruby, habría que instalarlo con el gestor de paquetes de **ruby** y también usa el estandar para especificar las dependencias. Podemos mencionar a [rv](https://github.com/spinel-coop/rv), que actualmente en la fecha de realización de este proyecto, es solo un gestor de versiones pero en un futuro promete ser una herramienta todo en uno, muy a tener en cuenta, habría que instalarlo desde su repositorio, no siendo una herramienta integra en el ecosistema de ruby y se desconoce si usará el estandar para especificar las herramientas.

Para el gestor de dependencias vamos a usar como Criterio la última vez que se actualizó, una herramienta desactualizada acarreará problemas para gestionar dependencias en las versiones nuevas del lenguaje, Bundler se actualizó por última vez el [3 de diciembre de 2025](https://rubygems.org/gems/bundler/versions?locale=es), mientras que Gel en [2022](https://rubygems.org/gems/gel/versions/0.3.0). Un ejemplo de problema que acarrea Gel es que para gestionar las dependencias de versiones nuevas no funciona:
![Problema](../docs/problemagel.png)

Por tanto nos quedamos con el estandar de facto Bundler.


En cualquier proyecto nos encontramos con el problema de que existen tareas que se repiten como son ejecutar los test, compilar, limpiar archivos temporales, es aquí donde entran los **gestores de tareas**

## GESTORES DE TAREAS
Un **gestor de tareas** es el encargado de ralizar estas tareas tan repetitivas, estas operaciones se definen en un fichero, permitiendo que se ejecuten con un simple comando.

En ruby existen varias opciones en gestores de tareas, **como son Rake, Bake, Task, Just y Make**, a la hora de elegir me he centrado en una herramienta que esté integrada en el ecosistema ruby como son Rake y Bake, ambas cumplen el criterio pero me he decantado por **Rake** por ser el estandar.












