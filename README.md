# IV25-26
Repositorio para la realización del proyecto de IV 25-26 de Óscar Fernández Rodríguez.

## DESCRIPCIÓN DEL PROBLEMA: 

Mi tio, cordinador de supermercado, siempre se queja de que pierde demasiado tiempo todos los meses
realizando el horario de cada mes, en lugar de estar haciendo otras tareas para el correcto funcionamiento 
del supermercado. 
Esta tarea es altamente costosa a nivel de tiempo, debido a que tiene que tener en cuenta una serie de factores
para la realización de estos horarios, como son:
- Se dispone de dos turnos uno de mañana y otro de tarde,los cuales no se podrá repetir más de tres semanas en el mismo.
- Hay que tener en cuenta que cada semana se librará un día posterior respecto al dia librado la anterior semana
  ,es decir si la semana pasada se libró el lunes esta semana el martes, teniendo en cuenta que siempre se cierra el domingo.
- Se necesita un número mínimo de dos personas por sección ( Pescadería, Panadería, Frutería, Charcutería y Carnicería)
  en cada turno.

Estos factores son los que le provoca grandes quebraderos de cabeza y la gran perdida de tiempo.

## [Enlace para ver configuración](configu_ssh/config.md)
## [Enlace para ver las historias de usuario](docs/husuario.md)
## [Enlace para ver los milestone](docs/milestone.md)
## [Enlace para ver user-journey](docs/user-journey.md)


## LENGUAJE Y GESTORES USADOS: 

Para más información con justificación de elección y pequeños turiales de como usarlos: [Documento](docs/documentacion_gestores.md).

- Lenguaje usado: Ruby.
- Gestor de versiones: Rbenv.
- Gestor de dependencias: Bundler.
- Gestor de tareas: Rake.

### MINI TUTORIAL DE COMIENZO:

- De cara a instalar las dependencias:
>bundle install

- Para ejecutar todas las tareas
>bundle exec rake 

- Para ejecutar la tarea para comprobar la sintaxis:
>bundle exec rake check


