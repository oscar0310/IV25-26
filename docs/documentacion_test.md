# DOCUMENTACIÓN TEST:

Para asegurarnos de que el desarrollo del proyecto cumple todos los deseos del clientes necesitamos hacer test. Los test son los escargados de verificar que se cumplen estos requisitios. Estas herramientas se dividen en varios niveles de abstracción para ello vamos a ir viendio los diferenetes niveles y nos quedaremos con una herramienta en cada nivel.

## Nivel de Aserciones:
Este es el nivel más bajo de abstracción, son funciones que se encargan de comparar la salida obtenida con la deseada. Como criterio de elección quiero que la herramienta siga el estilo BDD que se asemeja más al lenguaje natural.

En ruby teneemos varias opciones en cuanto a librería de aserciones:

- [Minitest::Assertions](https://docs.ruby-lang.org/en/2.1.0/MiniTest/Assertions.html) es la librería de aserciones que viene por defecto con Minitest pero no sigue el estilo BDD si no que sigue el estilo clásico de aserciones.
- [RSpec Expectations](https://rspec.info/documentation/3.12/rspec-expectations/) es la librería de aserciones que viene con RSpec y sigue el estilo BDD.
- [Test::Unit::Assertions](https://test-unit.github.io/test-unit/en/Test/Unit/Assertions.html) es la librería de aserciones que viene con Test::Unit y no sigue el estilo BDD si no que sigue el estilo clásico de aserciones.

Siguiendo el criterio de elección nos quedamos con RSpec Expectations.

