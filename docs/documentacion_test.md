# DOCUMENTACIÓN TEST:

Para asegurarnos de que el desarrollo del proyecto cumple todos los deseos del cliente, necesitamos realizar test. Los test son los encargados de verificar que se cumplen estos requisitios. Estas herramientas se dividen en varios niveles de abstracción para ello vamos a ir viendo los diferenetes niveles y nos quedaremos con una herramienta en cada nivel.

## Nivel de Aserciones:
Este es el nivel más bajo de abstracción, son funciones que se encargan de comparar la salida obtenida con la deseada.

Como criterio de elección se busca que la librería de aserciones siga el estilo TDD clásico (assert_equal(esperado,valor_actual)) priorizandolo frente al estilo BDD(expect.(actual).to_eq(experado)) y no se requiera instalar gemas externas adicionales para su uso, evitando tener que añadir archivos de configuración adicionales.

En ruby tenemos varias opciones en cuanto a librería de aserciones:

- [Minitest::Assertions](https://www.rubydoc.info/gems/minitest/Minitest/Assertions) es la librería de aserciones que viene por defecto con Minitest esta sigue el estilo clásico de las aserciones como podemos ver en funciones como assert_equal(exp, act, msg = nil) o assert_empty(obj, msg = nil). Esta librería no requiere instalar gemas externas adicionales ya que viene incluida en la librería estándar de ruby.

- [RSpec Expectations](https://rspec.info/documentation/3.12/rspec-expectations/) es la librería de aserciones del ecosistema RSpec. Sigue el estilo BDD, utilizando cadenas que intentas parecerse al inglés como podemos ver en su documentación con ejemplos como: expect(actual).to_be(expected) o expect(actual).to_match(/expresion/). Esta librería requiere instalar gemas externas adicionales y necesita configuración adicional para su uso.

- [Test::Unit::Assertions](https://test-unit.github.io/test-unit/en/Test/Unit/Assertions.html) es la librería de aserciones que viene con Test::Unit y es el padre del estilo clásico de aserciones TDD en ruby. Esta librería anteriormente era el estándar en ruby pero actualmente si se quiere usar se necesita instalar gemas externas adicionales ya que ya no viene incluida en la librería estandar de ruby y necesita configuración adicional para su uso.

Siguiendo los criterios de elección nos quedamos con [Minitest::Assertions](https://www.ruby-toolbox.com/categories/testing_frameworks) ya que sigue el estilo TDD y no requiere instalar gemas externas adicionales, evitando tener que añadir archivos de configuración adicionales.

## Nivel Test runners o frameworks:
Este es el nivel intermedio de abstracción. Esta herramienta se encarga de ejecutarlos, agruparlos y planificar los tests. También puede incluir fixtures o funciones para crear objetos que se van a utilizar. 

Como criterio de eleccion, buscamos  que la herramienta se integre correctamente con la librería de aserciones sin necesidad de configuraciones complejas y que destaque por su velocidad, mejorando la experiencia del programador cuando la use.

En ruby tenemos varias opciones en cuanto a frameworks de test:

-[Minitest](https://minite.st/index.html) es el framework de test que viene incluido por defecto incluida en el lenguaje, se integra de manera nativa con Minitest::Assertions ya que es su propia librería de aserciones y destaca por su velocidad ya que al tener una arquitectura minimalista basada en clases de ruby permite un arranque casi instantaneo.

-[Rspec-core](https://rspec.info/documentation/3.13/rspec-core/) framework de test muy popular en ruby que viene con el ecosistema RSpec, Usarlo con Minitest::Assertions rompe las convenciones del framework ya que está preparado para usar RSpec Expectations. En cuanto a velocidadad es el más lento ya que sigue una arquitectura basada en DSLs (Domain Specific language) que añade una capa de abstracción adicional que penaliza la velocidad de ejecución.

-[Test::Unit](https://test-unit.github.io/test-unit/en/Test.html) framework clásico de ruby, este dispone de su propia librería de aserciones Test::Unit::Assertions, por tanto usar Minitets:Assertions no tendría sentido, ya que implicaría una gran cantidad de configuraciones innecesarias. Su rendimiento se situa en un punto intermedio es más lento que Minitest y más rápido que Rspec.

Para compararlos en cuanto a la velocidad, usamos las gráficas que proporciona Minitest en su [documentación](https://minite.st/comparisons.html), donde podemos observar que Minitest es el más rápido de los tres. Además siguiendo el otro criterio de elección nos quedamos con Minitest ya que se integra de manera nativa con Minitest::Assertions sin necesidad de configuraciones complejas las cuales no son necesarias.

## Nivel Herramientas CLI para ejecutar los tests:

Es el nivel más alto de abstracción, también conocidos como test runners, son los encargados ejecutar los test. Buscan los diferentes scripts que ejecutan los test, analizan la salida y producen un informe.

Como criterio de elección se busca que la herramienta sea capaz de automatizar la ejecución de los test de cara a los proximos objetivos de la asignatura y no se necesite instalar gemas evitando configuraciones innecesarias y reduciendo la deuda técnica.

A la hora de elegir una herramienta CLI para ejecutar los tests en ruby con Minitest tenemos las siguientes opciones:

- [Rake::TestTask](https://ruby.github.io/rake/Rake/TestTask.html) es una herramienta que viene por defecto con el gestor de tareas [Rake](https://ruby.github.io/rake/), el cual ya fue elegido en la documentación del gestor de tareas. Rake::TestTask permite definir tareas para ejecutar los test independientemente del framework de test que se use. Al formar parte de Rake no es necesario instalar ninguna gema adicional para su uso. Esta herramienta permite definir tareas personalizadas para ejecutar los test facilitando la automatización.

- [mighty_test](https://github.com/mattbrictson/mighty_test) es otra herramienta CLI moderna para ejecutar test en minitest. Esta herramienta prioriza la interacción con el usuario con menús y watch mode para ejecutar los test de manera manual aunque también es capaz de ejecutar los test de manera automática. Al igual que la anterior requiere instalar una gema adicional para su uso. 

Siguiendo los criterios de elección nos quedamos con Rake::TestTask ya que es la herramienta más adecuada para automatizar la ejecución de los test y no es necesario instalar ninguna gema adicional.

