# DOCUMENTACIÓN TEST:

Para asegurarnos de que el desarrollo del proyecto cumple todos los deseos del clientes necesitamos hacer test. Los test son los escargados de verificar que se cumplen estos requisitios. Estas herramientas se dividen en varios niveles de abstracción para ello vamos a ir viendio los diferenetes niveles y nos quedaremos con una herramienta en cada nivel.

## Nivel de Aserciones:
Este es el nivel más bajo de abstracción, son funciones que se encargan de comparar la salida obtenida con la deseada. Como criterio de elección quiero que sea el estandar de facto.

En ruby teneemos varias opciones en cuanto a librería de aserciones:

- [Minitest::Assertions](https://docs.ruby-lang.org/en/2.1.0/MiniTest/Assertions.html) es la librería de aserciones que viene por defecto con Minitest sigue el estilo clásico de aserciones aunque también se puede usar el estilo [BDD](https://minite.st/index.html).
- [RSpec Expectations](https://rspec.info/documentation/3.12/rspec-expectations/) es la librería de aserciones que viene con RSpec y sigue el estilo BDD.
- [Test::Unit::Assertions](https://test-unit.github.io/test-unit/en/Test/Unit/Assertions.html) es la librería de aserciones que viene con Test::Unit y sigue el estilo clásico de aserciones.

Siguiendo el criterio de elección nos quedamos con [Minitest::Assertions](https://www.ruby-toolbox.com/categories/testing_frameworks).





