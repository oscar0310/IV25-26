# DOCUMENTACIÓN TEST:

Para asegurarnos de que el desarrollo del proyecto cumple todos los deseos del clientes necesitamos hacer test. Los test son los escargados de verificar que se cumplen estos requisitios. Estas herramientas se dividen en varios niveles de abstracción para ello vamos a ir viendio los diferenetes niveles y nos quedaremos con una herramienta en cada nivel.

## Nivel de Aserciones:
Este es el nivel más bajo de abstracción, son funciones que se encargan de comparar la salida obtenida con la deseada. Como criterio de elección se busca que la herramienta sea el estandar de facto.

En ruby teneemos varias opciones en cuanto a librería de aserciones:

- [Minitest::Assertions](https://docs.ruby-lang.org/en/2.1.0/MiniTest/Assertions.html) es la librería de aserciones que viene por defecto con Minitest sigue el estilo clásico de aserciones aunque también se puede usar el estilo [BDD](https://minite.st/index.html).
- [RSpec Expectations](https://rspec.info/documentation/3.12/rspec-expectations/) es la librería de aserciones que viene con RSpec y sigue el estilo BDD.
- [Test::Unit::Assertions](https://test-unit.github.io/test-unit/en/Test/Unit/Assertions.html) es la librería de aserciones que viene con Test::Unit y sigue el estilo clásico de aserciones.

Siguiendo el criterio de elección nos quedamos con [Minitest::Assertions](https://www.ruby-toolbox.com/categories/testing_frameworks).

## Nivel Test runners o frameworks:
Este es el nivel intermedio de abstracción, esta herramienta se encarga de ejecutarlos, agruparlos y planificar los tests. También puede incluir fixtures o funciones para crear objetos que se van a utilizar. Como criterio de eleccion se busca que la herramienta que la herramienta sea el estandar de facto en ruby y que destaque por su velocidad.

En ruby tenemos varias opciones en cuanto a frameworks de test:

-[Minitest](https://minite.st/index.html) framework de test que viene por defecto incluida en el lenguaje, destaca por su velocidad.
-[Rspec-core](https://rspec.info/documentation/3.13/rspec-core/) framework de test muy popular en ruby que viene con el ecosistema RSpec, es bastante más lento que Minitest.
-[Test::Unit](https://test-unit.github.io/test-unit/en/Test.html) framework clásico de ruby, su rendimiento se situa en un punto intermedio es más lento que Minitest y más rápido queRspec.

Para compararlos en cuanto a la velocidad he usado las gráficas que proporciona Minitest en su [documentación](https://minite.st/comparisons.html), donde podemos observar que Minitest es el más rápido de los tres. Además siguiendo el otro criterio de elección el estandar de facto en ruby es [Minitest](https://www.ruby-toolbox.com/categories/testing_frameworks). Por tanto siguiendo los criterios de elección nos quedamos con Minitest.



