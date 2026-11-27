# G2-P2 - Diseño de Datos | SIGMAVITAL

**Aprendiz:** Juan Miguel Muñoz Castañeda  
**Programa:** Análisis y Desarrollo de Software (ADSO)  
**Ficha:** 3413974  
**Proyecto:** SIGMAVITAL  
**Fase:** Planeación - Arquitectura y diseño de datos  
**Evidencia:** G2-P2 - Diseño de datos  

---

## 1. Objetivo

Esta evidencia documenta el diseño de datos de SIGMAVITAL, desde el modelo conceptual hasta la implementación lógica y la definición de las estructuras de la base de datos. Incluye normalización, diccionario de datos, script SQL, políticas de seguridad y checklist de aceptación.

El propósito es establecer una estructura de datos coherente con los requerimientos y los artefactos de arquitectura previamente desarrollados en G2-P1.

## 2. Relación con G2-P1 - Arquitectura

Esta evidencia complementa los artefactos desarrollados en la evidencia G2-P1 - Arquitectura, especialmente:

- **Requisitos y decisiones tecnológicas:** [A1-Requisitos-Decisiones-Tecnologicas.md](../G2-P1-arquitectura/01-requisitos/A1-Requisitos-Decisiones-Tecnologicas.md).
- **Diagrama y diseño de clases:** carpeta [02-diagrama-clases](../G2-P1-arquitectura/02-diagrama-clases/).
- **Patrones de diseño:** [A3-Patrones-Diseno.md](../G2-P1-arquitectura/03-patrones-diseno/A3-Patrones-Diseno.md).
- **Arquitectura:** carpeta [04-arquitectura](../G2-P1-arquitectura/04-arquitectura/).
- **Componentes:** carpeta [05-componentes](../G2-P1-arquitectura/05-componentes/).
- **Despliegue:** carpeta [06-despliegue](../G2-P1-arquitectura/06-despliegue/).
- **Trazabilidad de requisitos:** [A7-Requirements-Traceability-Matrix.md](../G2-P1-arquitectura/07-trazabilidad/A7-Requirements-Traceability-Matrix.md).

Los artefactos de P1 sirven como referencia para identificar entidades, responsabilidades, relaciones y necesidades de persistencia del sistema. **Decisión de roles:** el diagrama de clases A2 permite una asociación Usuario–Rol extensible; la persistencia del MVP en B1/B2/B5 restringe cada usuario a un único rol principal. El multirol no se declara implementado y exigiría una tabla `UsuarioRol` y actualización coordinada de los modelos y del DDL.

## 3. Artefactos desarrollados

### B1. Modelo conceptual de datos

- [B1-Modelo-Conceptual-Datos.md](B1-Modelo-Conceptual-Datos.md)
- [B1-Diagrama-Conceptual.drawio](B1-Diagrama-Conceptual.drawio)
- [B1-Diagrama-Conceptual.drawio.png](B1-Diagrama-Conceptual.drawio.png)
- [B1-Diagrama-Conceptual.drawio.svg](B1-Diagrama-Conceptual.drawio.svg)
- [B1-Diagrama-Conceptual.dot](B1-Diagrama-Conceptual.dot)
- [B1-Diagrama-Conceptual.html](B1-Diagrama-Conceptual.html)

Se documenta el modelo conceptual, sus entidades, atributos, relaciones y cardinalidades.

### B2. Modelo relacional

- [B2-Modelo-Relacional.md](B2-Modelo-Relacional.md)
- [B2-Diagrama-Relacional.drawio](B2-Diagrama-Relacional.drawio)
- [B2-Diagrama-Relacional.drawio.png](B2-Diagrama-Relacional.drawio.png)
- [B2-Diagrama-Relacional.drawio.svg](B2-Diagrama-Relacional.drawio.svg)
- [B2-Diagrama-Relacional-Actualizado.dot](B2-Diagrama-Relacional-Actualizado.dot)

Se presenta la transformación del modelo conceptual al modelo relacional, con tablas, claves primarias, claves foráneas y relaciones.

### B3. Normalización

- [B3-Normalizacion.md](B3-Normalizacion.md)

Documenta el proceso de normalización y el análisis de dependencias, buscando reducir redundancia y mejorar la consistencia de los datos.

### B4. Diccionario de datos

- [B4-Diccionario-Datos.md](B4-Diccionario-Datos.md)

Define las tablas y sus atributos, tipos de datos, convenciones, restricciones y dominios.

### B5. Creación de la base de datos

- [B5-Creacion-Base-Datos.sql](B5-Creacion-Base-Datos.sql) — DDL de entrega.
- [B5-Prueba.sql](B5-Prueba.sql) — copia del DDL vigente que crea la base aislada `sigmavital_prueba`.
- [B5-Evidencia-Checks.txt](B5-Evidencia-Checks.txt)
- [B5-Evidencia-Relaciones.txt](B5-Evidencia-Relaciones.txt)
- [B5-Evidencia-Tablas.txt](B5-Evidencia-Tablas.txt)
- [B5-Evidencia-Ejecucion-Tablas.png](B5-Evidencia-Ejecucion-Tablas.png)
- [B5-Evidencia-Relaciones.png](B5-Evidencia-Relaciones.png)
- [B5-Evidencia-Unicidad-Cierre.txt](B5-Evidencia-Unicidad-Cierre.txt) — evidencia histórica de VT-07 sobre una versión anterior del esquema.
- [B5-Prueba-Unicidad-AsignacionPersonal.sql](B5-Prueba-Unicidad-AsignacionPersonal.sql) — guion automático con datos ficticios transaccionales; pendiente de ejecutar y capturar.
- [B5-Guia-Ejecucion-Evidencias.md](B5-Guia-Ejecucion-Evidencias.md) — instrucciones para verificar DDL, UNIQUE compuesta y restauración aislada.

Se incluye el script de creación de tablas, restricciones y relaciones. Las evidencias de ejecución adjuntas documentan una versión anterior del DDL. La versión actual agrega la FK `RegistroCierre.id_usuario` y la restricción UNIQUE compuesta de `AsignacionPersonal`; por ello, las evidencias históricas no certifican por sí solas la ejecución del esquema actualizado.

**Pendiente antes de declarar validada esta versión:** ejecutar `B5-Prueba.sql` (copia de prueba del DDL vigente) sobre MariaDB/MySQL, repetir las verificaciones de 11 tablas, 12 claves foráneas y 7 restricciones CHECK, y ejecutar `B5-Prueba-Unicidad-AsignacionPersonal.sql`. Adjuntar el resultado real de consola y fecha del entorno. La guía reproducible está en `B5-Guia-Ejecucion-Evidencias.md`.

### B6. Políticas de seguridad de datos

- [B6-Politicas-Seguridad-Datos.md](B6-Politicas-Seguridad-Datos.md) — incluye procedimiento de simulacro de restauración y plantilla de registro.

Documenta políticas de integridad, confidencialidad y disponibilidad, matriz de permisos, tratamiento de datos personales, protección de credenciales, comunicaciones seguras y estrategia de respaldo. El simulacro de restauración está especificado, pero aún no ejecutado; debe registrarse el resultado real antes de marcar ese criterio como cumplido.

### B7. Checklist de aceptación

- [B7-Checklist-Aceptacion.md](B7-Checklist-Aceptacion.md)

Contiene criterios de aceptación, niveles de severidad, estado de validación, verificaciones técnicas y registro de hallazgos y correcciones documentadas.

## 4. Organización de los archivos

| Artefacto | Archivo principal |
|---|---|
| B1 - Conceptual | B1-Modelo-Conceptual-Datos.md |
| B2 - Relacional | B2-Modelo-Relacional.md |
| B3 - Normalización | B3-Normalizacion.md |
| B4 - Diccionario | B4-Diccionario-Datos.md |
| B5 - SQL | B5-Creacion-Base-Datos.sql |
| B5 - Evidencias | B5-Evidencia-* |
| B6 - Seguridad | B6-Politicas-Seguridad-Datos.md |
| B7 - Aceptación | B7-Checklist-Aceptacion.md |

## 5. Reutilización, ajustes y elaboración

Los artefactos de esta evidencia se desarrollaron tomando como referencia los requerimientos, diagramas de clases, decisiones de arquitectura y trazabilidad de G2-P1.

El diseño de datos se adaptó a las necesidades de SIGMAVITAL mediante la identificación y organización de entidades, relaciones, tablas, restricciones, documentación técnica y políticas de seguridad.

Las modificaciones y verificaciones se documentan en los archivos correspondientes de esta evidencia. Los criterios que no cuentan con validación directa se mantienen pendientes de verificación.

## 6. Verificaciones técnicas efectuadas

Existen evidencias históricas de ejecución en MariaDB para una versión anterior del esquema: 11 tablas, 11 claves foráneas, 7 restricciones CHECK y una prueba real de unicidad de `RegistroCierre.id_servicio`. El DDL de entrega se actualizó después con la FK `RegistroCierre.id_usuario` y la UNIQUE compuesta de `AsignacionPersonal`; por eso, la evidencia histórica **no acredita la ejecución integral del DDL actual**.

Para cerrar la versión vigente se prepararon `B5-Prueba.sql`, `B5-Prueba-Unicidad-AsignacionPersonal.sql` y `B5-Guia-Ejecucion-Evidencias.md`. Se deben ejecutar en una base aislada y conservar los logs reales antes de actualizar los estados pendientes. La prueba de restauración sigue igualmente pendiente.

## 7. Autoevaluación

La evidencia se revisó tomando como referencia los criterios de diseño conceptual, modelo relacional, normalización, diccionario de datos, implementación SQL, políticas de seguridad y checklist de aceptación.

Los aspectos comprobados se respaldan mediante los archivos de documentación y evidencias disponibles en esta carpeta. Los criterios que requieren validaciones adicionales se conservan como pendientes, evitando declarar resultados que no hayan sido comprobados.

## 8. Uso de herramientas de inteligencia artificial

Se utilizó inteligencia artificial como herramienta de apoyo para la revisión documental, organización de la evidencia, análisis de consistencia, asistencia en comandos y revisión de aspectos técnicos.

Los artefactos y cambios fueron revisados por el aprendiz, quien realizó verificaciones sobre el script SQL, la estructura de las tablas, las relaciones, las restricciones y las evidencias de ejecución.

La herramienta de inteligencia artificial se utilizó como apoyo y no sustituye la revisión, comprensión y responsabilidad del aprendiz sobre los resultados entregados.

## 9. Declaración de autoría

Declaro que revisé los artefactos que conforman esta evidencia, comprendí su contenido y realicé las verificaciones documentadas. Las herramientas utilizadas fueron de apoyo para el desarrollo y revisión del trabajo, manteniendo la responsabilidad sobre los resultados y su presentación.

---

**Proyecto:** SIGMAVITAL  
**Evidencia:** G2-P2 - Diseño de Datos  
**Ficha:** 3413974 - ADSO


## Ajustes de revisión

- B1 documenta verbos y cardinalidades mínimas/máximas por extremo. El diagrama Draw.io que ya existía se conserva sin cambios en este paquete.
- B2 y los scripts B5 incluyen la restricción UNIQUE compuesta de `AsignacionPersonal`.
- B3 presenta una clave candidata compuesta y dependencia parcial, además de una dependencia transitiva.
- B4 declara el estándar de nomenclatura.
- B6 incorpora un procedimiento para prueba de restauración y un registro de ejecución.
- B7 verifica criterios medibles de P1/P2 y señala como pendientes las pruebas que todavía deben ejecutarse.

**Importante:** la prueba de unicidad de la pareja Asignacion/Personal y el simulacro de restauración están preparados, pero deben ejecutarse en MariaDB/MySQL y registrarse antes de declararlos como pruebas superadas.

- B2 ahora incluye `id_usuario` como FK de `RegistroCierre`, consistente con la relación de responsable definida en B1. La evidencia de ejecución anterior debe repetirse porque el esquema cambió.
- B1/B2 conservan sus fuentes Draw.io, fuentes Graphviz `.dot` y exportaciones disponibles. Ningún diagrama se redibujó ni se regeneró durante esta corrección.


## Estado de ejecución del DDL actual

La evidencia anterior corresponde a una versión previa del script. La ejecución de la copia vigente, la prueba de la UNIQUE compuesta y la restauración aislada están preparadas, pero no se marcan como superadas hasta disponer de los resultados reales de MariaDB/MySQL.
