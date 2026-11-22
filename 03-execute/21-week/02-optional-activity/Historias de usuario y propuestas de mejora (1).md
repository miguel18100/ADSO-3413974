# Historias de usuario y propuestas de mejora

# Mockup de Gestión de Horarios SENA

## 1. Introducción

Para realizar este análisis se revisó el mockup de Gestión de Horarios, teniendo en cuenta las funciones que presenta actualmente y las necesidades que pueden tener las personas que utilizan el sistema.

El objetivo de aplicar ingeniería inversa es entender primero cómo está planteado el sistema, revisar qué funciones están funcionando correctamente, identificar posibles dificultades y encontrar oportunidades de mejora.

No se busca cambiar completamente el sistema, sino analizarlo y proponer mejoras que permitan que los usuarios puedan realizar sus actividades de una forma más rápida, clara y organizada.

El análisis tiene en cuenta los diferentes roles que pueden interactuar con el sistema:

- Aprendiz.
- Instructor.
- Coordinador.
- Director.
- Administrador.

A partir de esta revisión se plantean historias de usuario, problemas encontrados, posibles soluciones y una priorización utilizando la metodología MoSCoW.

---

# 2. Objetivo del análisis

El objetivo principal es analizar el funcionamiento del mockup de Gestión de Horarios y proponer cambios que mejoren la experiencia de los usuarios.

### Objetivos específicos

- Identificar posibles problemas en las pantallas y procesos.
- Revisar las necesidades de cada tipo de usuario.
- Detectar pasos que puedan simplificarse.
- Proponer nuevas funciones o mejoras.
- Mejorar la organización de la información.
- Evitar errores en la programación de horarios.
- Mejorar la consulta desde dispositivos móviles.
- Organizar las mejoras según su importancia.
- Mantener los controles de seguridad y permisos.

---

# 3. Diagnóstico del sistema actual

Durante la revisión del mockup se identificaron algunos aspectos que pueden ser mejorados para facilitar el uso del sistema.

Entre los principales puntos a tener en cuenta están:

- Algunas consultas pueden requerir varios pasos.
- La información importante podría mostrarse de una manera más directa.
- Se pueden mejorar los filtros y las búsquedas.
- Los cambios de horario deberían ser más fáciles de identificar.
- Es importante diferenciar claramente las funciones de cada rol.
- Los cruces entre horarios, instructores y ambientes deberían detectarse automáticamente.
- La información de configuración puede organizarse mejor.
- La versión para dispositivos móviles puede tener una distribución más sencilla.
- Las acciones importantes deberían quedar registradas.
- Los mensajes de error deberían explicar claramente qué ocurrió.

Estos puntos no significan que el sistema actual esté mal diseñado. Son oportunidades de mejora encontradas durante el análisis y que podrían estudiarse antes de realizar una implementación.

---

# 4. Aplicación de Design Thinking

Para plantear las mejoras se toma como referencia la metodología Design Thinking, buscando entender primero las necesidades de los usuarios antes de decidir qué cambios realizar.

## 4.1 Empatizar

En esta etapa se tienen en cuenta las necesidades de las personas que utilizan el sistema.

### Aprendiz

Necesita consultar rápidamente su horario, saber dónde tiene clase y enterarse de cualquier modificación.

### Instructor

Necesita conocer su programación, las fichas asignadas y los ambientes donde debe realizar sus actividades.

### Coordinador

Necesita organizar los horarios, revisar disponibilidad y evitar cruces entre instructores, ambientes y fichas.

### Director

Necesita consultar información general de la programación y conocer el estado del sistema.

### Administrador

Necesita gestionar usuarios, permisos, configuraciones y revisar las actividades realizadas dentro del sistema.

---

## 4.2 Definir

Después de revisar las necesidades anteriores, se puede plantear el siguiente problema:

> Los usuarios necesitan consultar y gestionar la información de horarios de una manera rápida, clara y organizada, teniendo acceso solamente a las funciones que corresponden a su rol.

El problema no solamente está relacionado con la cantidad de funciones, sino también con la forma en que se presenta la información y con la cantidad de pasos necesarios para realizar algunas acciones.

---

## 4.3 Idear

A partir del problema identificado se plantean diferentes ideas:

- Crear una pantalla principal más organizada.
- Mostrar primero la información más importante.
- Agregar filtros.
- Incorporar búsquedas rápidas.
- Utilizar una vista tipo calendario.
- Mostrar alertas cuando cambie un horario.
- Detectar automáticamente los cruces.
- Organizar mejor la parametrización.
- Mejorar la versión móvil.
- Agregar registros de auditoría.
- Mostrar mensajes de error más claros.

---

## 4.4 Prototipar

Las ideas seleccionadas pueden llevarse al mockup mediante modificaciones de las pantallas actuales o mediante nuevas pantallas.

Por ejemplo, se podría crear una vista de horario donde el usuario pueda seleccionar una fecha y consultar directamente las clases correspondientes.

También se pueden agregar botones o filtros que permitan encontrar rápidamente una ficha, instructor, ambiente o programa.

---

## 4.5 Evaluar

Después de realizar los cambios en el mockup, sería conveniente probar las nuevas propuestas con usuarios.

La evaluación permitiría saber:

- Si la información se encuentra fácilmente.
- Si los botones son claros.
- Si los filtros funcionan como se espera.
- Si disminuyen los pasos necesarios.
- Si los mensajes son fáciles de entender.
- Si la versión móvil resulta cómoda.
- Si las funciones corresponden correctamente a cada rol.

Los comentarios obtenidos pueden utilizarse para realizar nuevos ajustes.

---

# 5. Problemas encontrados y posibles soluciones

| Problema | Usuario afectado | Posible solución | Prioridad |
|---|---|---|---|
| Encontrar una clase puede tomar varios pasos | Aprendiz | Mostrar el horario en una sola vista | Must Have |
| Dificultad para encontrar información específica | Aprendiz / Instructor | Agregar filtros y búsqueda | Must Have |
| Los cambios pueden pasar desapercibidos | Aprendiz / Instructor | Implementar notificaciones | Should Have |
| Pueden existir cruces de horarios | Coordinador | Validación automática | Must Have |
| Puede existir demasiada información en algunas secciones | Todos | Organizar la información por categorías | Should Have |
| Consulta desde celular | Aprendiz / Instructor | Mejorar el diseño responsive | Should Have |
| Control de permisos | Administrador | Mantener gestión por roles | Must Have |
| Falta de seguimiento de algunas acciones | Administrador | Implementar auditoría | Must Have |
| Configuraciones difíciles de encontrar | Administrador | Agregar categorías y búsqueda | Should Have |

---

# 6. Necesidades según el usuario

## 6.1 Aprendiz

El aprendiz necesita principalmente consultar su horario sin tener que recorrer muchas opciones.

Las funciones más importantes para este usuario son:

- Consultar horario.
- Consultar información de una clase.
- Recibir cambios.
- Filtrar horarios.
- Consultar desde el celular.

## 6.2 Instructor

El instructor necesita tener una visión clara de su programación y de las fichas que tiene asignadas.

Las funciones principales serían:

- Consultar horario.
- Consultar ficha.
- Recibir modificaciones.
- Consultar disponibilidad de ambientes.
- Consultar seguimiento.

## 6.3 Coordinador

El coordinador necesita administrar la programación y evitar problemas antes de que los horarios sean publicados.

Sus principales necesidades son:

- Consultar programación.
- Detectar conflictos.
- Modificar horarios.
- Consultar ambientes.
- Generar reportes.

## 6.4 Director

El director necesita información general que le permita conocer cómo está distribuida la programación.

Sus necesidades principales son:

- Consultar programación general.
- Consultar indicadores.
- Consultar disponibilidad.

## 6.5 Administrador

El administrador necesita controlar el funcionamiento general del sistema.

Sus funciones principales son:

- Buscar usuarios.
- Gestionar cuentas.
- Gestionar roles.
- Administrar permisos.
- Gestionar configuraciones.
- Revisar auditorías.

---

# 7. Historias de usuario

## 7.1 Aprendiz

### HU-01 – Consultar horario

**Como aprendiz**, quiero consultar mi horario de forma sencilla para saber rápidamente qué clases tengo, a qué hora son, en qué ambiente y con qué instructor.

**Propuesta:** Mostrar en una sola vista el día, la hora, el ambiente, el programa y el instructor.

### HU-02 – Recibir cambios de horario

**Como aprendiz**, quiero recibir un aviso cuando cambie mi horario para conocer la modificación antes de asistir a clase.

**Propuesta:** Implementar notificaciones para cambios, cancelaciones y modificaciones.

### HU-03 – Consultar una clase

**Como aprendiz**, quiero seleccionar una clase para consultar toda la información relacionada.

**Propuesta:** Mostrar instructor, ambiente, ficha, programa, fecha y duración.

### HU-04 – Filtrar horario

**Como aprendiz**, quiero filtrar mi horario para encontrar rápidamente una clase determinada.

**Propuesta:** Incorporar filtros por fecha, instructor, programa o ficha.

### HU-05 – Consultar desde celular

**Como aprendiz**, quiero consultar mi horario desde el celular para poder acceder a la información sin depender de un computador.

**Propuesta:** Adaptar la interfaz para dispositivos móviles y mostrar primero la información principal.

---

# 8. Historias de usuario del instructor

## HU-06 – Consultar horario

**Como instructor**, quiero visualizar mis clases organizadas por fecha y hora para conocer claramente mi programación.

**Propuesta:** Utilizar una vista de calendario o un listado ordenado.

## HU-07 – Consultar ficha

**Como instructor**, quiero acceder a la información de la ficha desde mi horario para consultar el grupo asignado.

**Propuesta:** Incorporar una opción de acceso directo a la ficha.

## HU-08 – Recibir modificaciones

**Como instructor**, quiero recibir avisos cuando cambie una clase para evitar confusiones con la programación.

**Propuesta:** Mostrar notificaciones cuando una clase sea modificada o cancelada.

## HU-09 – Consultar disponibilidad

**Como instructor**, quiero consultar la disponibilidad de los ambientes para conocer los espacios disponibles.

**Propuesta:** Permitir consultar los ambientes según fecha y hora.

## HU-10 – Consultar seguimiento

**Como instructor**, quiero consultar el estado de la ficha para conocer el avance del proceso de formación.

**Propuesta:** Relacionar el seguimiento con los resultados de aprendizaje y las evidencias registradas.

---

# 9. Historias de usuario del coordinador

## HU-11 – Consultar programación

**Como coordinador**, quiero consultar la programación de las fichas para tener una visión general de los horarios.

**Propuesta:** Permitir filtros por ficha, programa, instructor, ambiente y fecha.

## HU-12 – Detectar conflictos

**Como coordinador**, quiero que el sistema identifique los conflictos de horario para poder corregirlos antes de publicar una programación.

**Propuesta:** Validar automáticamente los cruces de horarios, instructores y ambientes.

## HU-13 – Modificar horarios

**Como coordinador**, quiero modificar un horario para solucionar cambios en la programación.

**Propuesta:** Permitir editar directamente la información necesaria y mostrar una confirmación cuando el cambio sea importante.

## HU-14 – Consultar ambientes

**Como coordinador**, quiero consultar los ambientes disponibles para poder asignarlos correctamente.

**Propuesta:** Mostrar disponibilidad por fecha y hora.

## HU-15 – Generar reportes

**Como coordinador**, quiero generar reportes de la programación para consultar y compartir la información.

**Propuesta:** Incorporar generación de reportes según los filtros seleccionados.

---

# 10. Historias de usuario del director

## HU-16 – Consultar programación general

**Como director**, quiero consultar la programación del centro para conocer cómo están distribuidos los horarios.

**Propuesta:** Mostrar información resumida de fichas, programas, instructores y ambientes.

## HU-17 – Consultar indicadores

**Como director**, quiero consultar indicadores de la programación para conocer el estado general del sistema.

**Propuesta:** Mostrar datos como fichas activas, ambientes utilizados, conflictos y programación.

## HU-18 – Consultar disponibilidad

**Como director**, quiero consultar la disponibilidad de los ambientes para conocer el uso de los espacios.

**Propuesta:** Mostrar ambientes disponibles y ocupados según fecha y hora.

---

# 11. Historias de usuario del administrador

## HU-19 – Buscar usuarios

**Como administrador**, quiero buscar usuarios rápidamente para consultar su información.

**Propuesta:** Permitir búsqueda por nombre, identificación o correo.

## HU-20 – Gestionar cuentas

**Como administrador**, quiero consultar el estado de una cuenta para identificar posibles problemas de acceso.

**Propuesta:** Mostrar estado de la cuenta, rol y permisos asignados.

## HU-21 – Gestionar permisos

**Como administrador**, quiero administrar los roles y permisos para controlar el acceso a las funciones del sistema.

**Propuesta:** Mantener RBAC y mostrar claramente qué acciones puede realizar cada rol.

---

# 12. Parametrización

## HU-22 – Organizar configuraciones

**Como administrador**, quiero encontrar las configuraciones organizadas para poder modificar los parámetros del sistema fácilmente.

**Propuesta:** Separar la parametrización en categorías como currículo, jornadas, ambientes, estados y permisos.

## HU-23 – Confirmar cambios importantes

**Como administrador**, quiero confirmar cambios importantes antes de guardarlos para evitar modificaciones accidentales.

**Propuesta:** Utilizar confirmaciones únicamente para acciones que puedan afectar información importante.

## HU-24 – Buscar parámetros

**Como administrador**, quiero encontrar rápidamente un parámetro para evitar revisar todas las opciones.

**Propuesta:** Agregar búsqueda y filtros dentro de la parametrización.

---

# 13. Criterios de aceptación

Los criterios de aceptación permiten comprobar si una mejora realmente cumple con lo que se espera.

## HU-01 – Consultar horario

La función se considera cumplida cuando:

- El aprendiz puede consultar su horario.
- Se muestra la fecha.
- Se muestra la hora.
- Se muestra el ambiente.
- Se muestra el instructor.
- La información puede consultarse desde dispositivos móviles.

## HU-04 – Filtrar horario

La función se considera cumplida cuando:

- El usuario puede seleccionar un filtro.
- El sistema muestra únicamente los resultados relacionados.
- Los filtros pueden limpiarse.
- La información se actualiza correctamente.

## HU-12 – Detectar conflictos

La función se considera cumplida cuando:

- El sistema detecta cruces.
- Identifica el horario involucrado.
- Identifica el instructor o ambiente afectado.
- Muestra un mensaje indicando el conflicto.
- Evita guardar una programación incompatible cuando corresponda.

## HU-21 – Gestionar permisos

La función se considera cumplida cuando:

- Cada usuario tiene un rol asignado.
- Las funciones dependen del rol.
- Un usuario no puede acceder a funciones que no le corresponden.
- Los cambios de permisos quedan registrados.

---

# 14. Flujo actual y flujo propuesto

## 14.1 Flujo actual

De forma general, el proceso puede representarse así:

**Ingreso al sistema**

↓

**Buscar la opción necesaria**

↓

**Seleccionar la información**

↓

**Consultar o modificar**

↓

**Finalizar proceso**

Durante la revisión se debe analizar si cada uno de estos pasos es realmente necesario o si alguno puede simplificarse.

## 14.2 Flujo propuesto

El flujo mejorado podría ser:

**Ingreso al sistema**

↓

**Identificación del rol**

↓

**Acceso a la información principal**

↓

**Búsqueda o filtros**

↓

**Consulta o acción**

↓

**Confirmación cuando sea necesaria**

↓

**Registro de la acción**

La intención es reducir pasos innecesarios y mostrar primero la información que realmente necesita cada usuario.

---

# 15. Seguimiento de formación

Uno de los puntos que también debe revisarse mediante ingeniería inversa es la manera en que el sistema representa el proceso de formación.

La información debería mantener una relación clara entre:

**Ficha → Programa → Competencia → Resultado de aprendizaje → Actividad → Evidencia → Evaluación → Avance.**

## Problema

Si el avance se registra manualmente y no está relacionado con los resultados de aprendizaje evaluados, puede generarse información poco precisa.

## Propuesta

El sistema debería calcular o actualizar el avance a partir de la información académica registrada.

Por ejemplo:

- Resultados de aprendizaje: 10.
- Resultados evaluados: 6.
- Avance: 60 %.

La forma exacta de calcular el porcentaje debe validarse con las reglas correspondientes del proceso de formación.

---

# 16. Simplificación de pantallas

Durante la ingeniería inversa también es importante revisar si existen pantallas que cumplen funciones similares.

## Horarios

Si varias pantallas solamente muestran diferentes formas de consultar el horario, se puede estudiar la posibilidad de utilizar una vista principal con filtros.

## Confirmaciones

Las confirmaciones deberían mantenerse para acciones importantes, pero evitarse en consultas sencillas.

## Información repetida

Cuando dos pantallas presentan la misma información, se puede analizar la posibilidad de unificarlas.

## Parametrización

Las configuraciones relacionadas pueden organizarse dentro de categorías para evitar una navegación demasiado extensa.

**Importante:** una pantalla no debería eliminarse solamente porque parezca innecesaria. Primero se debe comprobar qué función cumple y qué rol la utiliza.

---

# 17. Protección de la información

Como el sistema maneja información de aprendices, instructores y funcionarios, es importante proteger los datos y controlar quién puede acceder a ellos.

También se deben tener en cuenta las normas colombianas relacionadas con la protección de datos personales, como la Ley 1581 de 2012.

## Propuestas

- Limitar el acceso según el rol.
- Proteger las credenciales.
- Evitar mostrar información personal innecesaria.
- Registrar acciones importantes.
- Controlar las sesiones.
- Mantener trazabilidad de modificaciones.
- Aplicar permisos sobre información sensible.

---

# 18. Auditoría

La auditoría debe permitir conocer qué ocurrió dentro del sistema y quién realizó una determinada acción.

Se recomienda registrar:

- Usuario.
- Acción realizada.
- Fecha y hora.
- Módulo.
- Registro afectado.
- Resultado de la operación.

Esto permite identificar cambios, investigar errores y mantener una mayor trazabilidad del sistema.

---

# 19. Accesibilidad y usabilidad

También se pueden realizar mejoras para que la información sea más fácil de entender y para que el sistema sea cómodo de utilizar.

## Propuestas

- Utilizar textos claros.
- Mantener botones fáciles de identificar.
- No depender únicamente de colores para indicar estados.
- Mostrar mensajes de error comprensibles.
- Adaptar el sistema a dispositivos móviles.
- Mantener una navegación consistente.
- Evitar saturar las pantallas con demasiada información.
- Mantener una estructura similar entre las diferentes secciones.

---

# 20. Priorización MoSCoW

Para organizar las mejoras se utiliza la metodología MoSCoW, que permite determinar qué funciones son indispensables y cuáles pueden desarrollarse posteriormente.

## Must Have – Debe tener

Son las funciones necesarias para que el sistema cumpla correctamente su objetivo.

- Consulta clara de horarios.
- Filtros.
- Detección de conflictos.
- Control de roles y permisos.
- Protección de datos.
- Auditoría.
- Seguimiento relacionado con el proceso de formación.
- Validación de disponibilidad.

## Should Have – Debería tener

Son funciones importantes que mejorarían bastante la experiencia:

- Notificaciones.
- Reportes.
- Indicadores.
- Mejor organización de la parametrización.
- Adaptación para dispositivos móviles.
- Mejoras de accesibilidad.

## Could Have – Podría tener

Son funciones que pueden aportar comodidad, pero no son indispensables:

- Personalización de la pantalla de inicio.
- Filtros adicionales.
- Atajos de navegación.
- Mejoras visuales secundarias.

## Won't Have por ahora – No se tendrá por ahora

Por el momento se pueden dejar fuera:

- Funciones que no tengan relación directa con el objetivo del sistema.
- Elementos duplicados.
- Funciones que no tengan un requerimiento o necesidad identificada.

---

# 21. Matriz de priorización

| Función | Importancia | Impacto | Prioridad |
|---|---|---|---|
| Consulta de horarios | Alta | Alto | Must Have |
| Detección de conflictos | Alta | Alto | Must Have |
| Gestión de roles | Alta | Alto | Must Have |
| Filtros | Alta | Alto | Must Have |
| Protección de datos | Alta | Alto | Must Have |
| Auditoría | Alta | Alto | Must Have |
| Notificaciones | Media | Alto | Should Have |
| Reportes | Media | Medio | Should Have |
| Indicadores | Media | Medio | Should Have |
| Adaptación móvil | Media | Alto | Should Have |
| Personalización | Baja | Bajo | Could Have |
| Atajos | Baja | Bajo | Could Have |
| Mejoras visuales secundarias | Baja | Bajo | Could Have |

---

# 22. Propuesta general de mejora

Después de realizar el análisis, la propuesta principal consiste en mejorar la experiencia del usuario sin modificar innecesariamente las funciones que ya cumplen su objetivo.

Las mejoras deberían enfocarse en:

### Organización

La información debe estar distribuida de forma lógica y cada sección debe tener una función clara.

### Rapidez

Las consultas frecuentes deberían poder realizarse con la menor cantidad de pasos posible.

### Seguridad

Cada usuario debe tener acceso solamente a las funciones y datos que correspondan a su rol.

### Prevención de errores

El sistema debería detectar problemas antes de guardar una programación incorrecta.

### Comunicación

Los cambios importantes deben comunicarse de manera clara a las personas involucradas.

### Accesibilidad

La información debe poder consultarse desde diferentes dispositivos y ser fácil de entender.

---

# 23. Resultado esperado

La ingeniería inversa debe permitir pasar de analizar el sistema actual a diseñar una propuesta mejorada.

El proceso sería:

**Sistema actual**

↓

**Revisión de funciones y procesos**

↓

**Identificación de problemas**

↓

**Análisis de necesidades**

↓

**Propuestas de solución**

↓

**Priorización con MoSCoW**

↓

**Diseño mejorado**

↓

**Evaluación con usuarios**

El resultado esperado es un sistema más organizado, fácil de utilizar y adaptado a las necesidades de cada rol.

La intención no es cambiar todo el sistema, sino identificar qué partes pueden mejorarse y cuáles deben mantenerse porque son necesarias para el proceso.

---

# 24. Conclusión

Después de revisar el mockup de Gestión de Horarios y analizar las necesidades de los diferentes usuarios, se encontraron varias oportunidades para mejorar el sistema.

Las principales mejoras están relacionadas con la consulta de horarios, los filtros, la detección de conflictos, las notificaciones, la organización de la información, la seguridad y la adaptación a dispositivos móviles.

La ingeniería inversa permite entender primero cómo funciona el sistema antes de realizar cambios. Esto ayuda a evitar modificaciones innecesarias y permite enfocarse en los problemas que realmente pueden afectar al usuario.

Por otra parte, Design Thinking permite plantear las mejoras teniendo en cuenta las necesidades de las personas que utilizan el sistema, mientras que MoSCoW ayuda a decidir cuáles funciones deben desarrollarse primero.

En conclusión, la propuesta busca que el sistema sea más sencillo, organizado y rápido de utilizar, manteniendo las funciones necesarias y mejorando aquellas partes que pueden generar confusión, errores o pérdida de tiempo.