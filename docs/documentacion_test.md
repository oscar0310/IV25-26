# DOCUMENTACIÓN TEST:

Para asegurarnos de que el desarrollo del proyecto cumple todos los deseos del cliente, necesitamos realizar test. Los test son los encargados de verificar que se cumplen estos requisitios. Estas herramientas se dividen en varios niveles de abstracción para ello vamos a ir viendo los diferenetes niveles y nos quedaremos con una herramienta en cada nivel.

## Nivel de Aserciones:
Como criterio de elección se busca que la librería de aserciones siga el estilo TDD clásico (assert_equal(esperado,valor_actual)) priorizandolo frente al estilo BDD(expect.(actual).to_eq(experado)) ya que añaden complejidad innecesaria alejandose de la forma habitual de programar en ruby.

En ruby tenemos varias opciones en cuanto a librería de aserciones:

- [Minitest::Assertions](https://www.rubydoc.info/gems/minitest/Minitest/Assertions) es la librería de aserciones que viene por defecto con Minitest esta sigue el estilo clásico de las aserciones como podemos ver en funciones como assert_equal(exp, act, msg = nil) o assert_empty(obj, msg = nil) y viene instalada por defecto con ruby al formar parte de la librería estándar.

- [RSpec Expectations](https://rspec.info/documentation/3.12/rspec-expectations/) es la librería de aserciones del ecosistema RSpec. Sigue el estilo BDD, utilizando cadenas que intentas parecerse al inglés como podemos ver en su documentación con ejemplos como: expect(actual).to_be(expected) o expect(actual).to_match(/expresion/).

- [Test::Unit::Assertions](https://test-unit.github.io/test-unit/en/Test/Unit/Assertions.html) es la librería de aserciones que viene con Test::Unit y es el padre del estilo clásico de aserciones TDD en ruby, siguiendo el estilo clásico de las aserciones como podemos ver en funciones como assert_equal(exp, act, msg = nil) o assert_empty(obj, msg = nil). Anteriormente venía incluida en la librería estándar de ruby pero actualmente fue sustituida por Minitest.


Siguiendo los criterio de elección tenemos dos opciones que cumplen los requisitos Minitest::Assertions y Test::Unit::Assertions, pero nos quedamos con Minitest::Assertions ya que nos tenemos que decantar por una.

## Nivel Test runners o frameworks:
Como criterio de elección se busca siga el estilo TDD clásico (assert_equal(esperado,valor_actual)) priorizandolo frente al estilo BDD(expect.(actual).to_eq(experado)), además se prioriza que el framework sea el más rápido (la F del principio FIRST) y se integre correctamente con la librería de aserciones elegida en el nivel anterior.

En ruby tenemos varias opciones en cuanto a frameworks de test:

-[Minitest](https://minite.st/index.html) es el framework de test que viene incluido por defecto en el lenguaje. Este framework sigue el estilo clásico de TDD como podemos ver en su documentación con ejemplos como: assert_equal(expected, actual, message = nil) o assert_match(expected_pattern, actual_string, message = nil) y se integra perfectamente con la librería de aserciones Minitest::Assertions ya que es su propia librería. Además es uno de los frameworks más rápidos disponibles en ruby como podemos observar en las [gráficas de rendimiento](https://minite.st/comparisons.html).

-[Rspec-core](https://rspec.info/documentation/3.13/rspec-core/) framework de test muy popular en ruby que viene con el ecosistema RSpec, este framework sigue el estilo BDD como podemos ver en su documentación con ejemplos como: expect(actual).to_be(expected) o expect(actual).to_match(/expresion/) y dispone de su propia librería de aserciones RSpec Expectations por tanto no se integra con la librería de aserciones elegida en el nivel anterior. Además es un framework más lento en comparación con otros frameworks como se puede observar en las [gráficas de rendimiento](https://minite.st/comparisons.html).

-[Test::Unit](https://test-unit.github.io/test-unit/en/Test.html) framework clásico de ruby, anteriormente era el estándar en ruby. Este framework sigue el estilo clásico de TDD como podemos ver en su documentación con ejemplos como: assert_equal(exp, act, msg = nil) o assert_match(exp_pattern, act_string, msg = nil). Dispone de su propia librería de aserciones Test::Unit::Assertions por tanto no se integra con la librería de aserciones elegida en el nivel anterior. En cuanto a rendimiento es un framework más lento en comparación con otros frameworks como se puede observar en las [gráficas de rendimiento](https://minite.st/comparisons.html).

Siguiendo los criterios de elección nos quedamos con Minitest ya que sigue el estilo TDD clásico, se integra perfectamente con la librería de aserciones Minitest::Assertions y es uno de los frameworks más rápidos disponibles en ruby.

## Nivel Herramientas CLI para ejecutar los tests:
Como criterio de elección se busca que la herramienta sea capaz de automatizar la ejecución de los test de cara a los proximos objetivos de la asignatura y se integre correctamente con el framework de test elegido en el nivel anterior.

A la hora de elegir una herramienta CLI para ejecutar los test en ruby disponemos de las siguientes opciones:

- Ejecución nativa(Ruby):Aunque no sea una herramienta CLI como tal, ruby permite ejecutar los test directamente desde la línea de comandos usando el intérprete de ruby seguido del script que contiene los test como podemos ver en la documentación de [minitest](https://github.com/minitest/minitest?tab=readme-ov-file#running-your-tests).  Para automatizarlo dependeríamos de un gestor de tareas que implemente una tarea con los comandos oportunos para su ejecución. En cuanto a la integración con el framework de test elegido, al ser una funcionalidad nativa de ruby se integra perfectamente con cualquier framework de test incluido en ruby como Minitest.

- [Rake::TestTask](https://ruby.github.io/rake/Rake/TestTask.html) es una herramienta que viene por defecto con el gestor de tareas [Rake](https://ruby.github.io/rake/), el cual ya fue elegido en la documentación del gestor de tareas. Rake::TestTask permite definir tareas para ejecutar los test independientemente del framework de test que se use, permitiendo así su automatización. 

- [mighty_test](https://github.com/mattbrictson/mighty_test) es otra herramienta CLI moderna para ejecutar test en minitest. Esta herramienta prioriza la interacción con el usuario con menús y watch mode para ejecutar los test de manera manual aunque también es capaz de ejecutar los test de manera automática. Esta herramienta se integra perfectamente con el framework de test Minitest ya que está diseñada específicamente para este framework.



Siguiendo los criterios de elección nos quedamos con Rake::TestTask ya que es la herramienta más adecuada para automatizar la ejecución de los test y permite usar cualquier framework entre ellos Minitest.

