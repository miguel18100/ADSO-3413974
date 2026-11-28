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

- [B5-Creacion-Base-Datos.sql](B5-Creacion-Base-Datos.sql) — DDL principal de entrega; ejecutado en MySQL 8.0.46 dentro de un contenedor aislado.
- [B5-Prueba.sql](B5-Prueba.sql) — copia de prueba que crea `sigmavital_prueba`; ejecutada y verificada.
- [B5-Prueba-Unicidad-AsignacionPersonal.sql](B5-Prueba-Unicidad-AsignacionPersonal.sql) — guion transaccional para probar la UNIQUE compuesta.
- [B5-Evidencia-DDL-Principal-MySQL-20261127-194248.txt](B5-Evidencia-DDL-Principal-MySQL-20261127-194248.txt) — ejecución real del DDL principal: 11 tablas, 12 FK y 7 CHECK.
- [B5-Evidencia-Relaciones-MySQL-20261127-194248.txt](B5-Evidencia-Relaciones-MySQL-20261127-194248.txt) — consulta de las 12 acciones referenciales del DDL principal.
- [B5-Evidencia-Ejecucion-DDL-MySQL-20261127.txt](B5-Evidencia-Ejecucion-DDL-MySQL-20261127.txt) — ejecución de la copia de prueba y conteos 11/12/7.
- [B5-Evidencia-Unicidad-AsignacionPersonal-MySQL-20261127.txt](B5-Evidencia-Unicidad-AsignacionPersonal-MySQL-20261127.txt) — prueba real de la UNIQUE compuesta y comprobación del `ROLLBACK`.
- [B5-Guia-Ejecucion-Evidencias.md](B5-Guia-Ejecucion-Evidencias.md) — registro consolidado de procedimientos, resultados y límites de las pruebas.
- `B5-Evidencia-Checks.txt`, `B5-Evidencia-Relaciones.txt`, `B5-Evidencia-Tablas.txt`, `B5-Evidencia-Ejecucion-Tablas.png`, `B5-Evidencia-Relaciones.png` y `B5-Evidencia-Unicidad-Cierre.txt` — evidencias anteriores conservadas como antecedentes; consultar las evidencias fechadas de MySQL para la versión actual.

El DDL principal se ejecutó sin errores en MySQL 8.0.46 y se verificaron 11 tablas, 12 claves foráneas y 7 restricciones CHECK. La copia de prueba también se ejecutó; la prueba de unicidad compuesta rechazó el segundo INSERT duplicado y revirtió los datos ficticios.

### B6. Políticas de seguridad de datos

- [B6-Politicas-Seguridad-Datos.md](B6-Politicas-Seguridad-Datos.md) — políticas de integridad, confidencialidad, disponibilidad, matriz de permisos y estrategia de respaldo.
- [B6-Evidencia-Restauracion-20261127-193214.txt](B6-Evidencia-Restauracion-20261127-193214.txt) — evidencia de respaldo y restauración lógica aislada con SHA-256 verificado y conteos 11/12/7.

El simulacro de restauración lógica fue ejecutado sobre `sigmavital_prueba` en un contenedor MySQL 8.0.46 aislado. Se comprobó la integridad del archivo de respaldo mediante SHA-256 y se verificaron nuevamente las tablas, FK y CHECK después de restaurar. Esta evidencia no equivale a una prueba de recuperación ante desastre físico ni acredita alta disponibilidad.

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

Las pruebas fechadas de esta versión se ejecutaron en MySQL 8.0.46 dentro del contenedor aislado `sigmavital-mysql-prueba`:

- **DDL principal (`sigmavital`):** importación con código de salida 0; SHA-256 local/remoto coincidente (`da784fd90037596ed206531d76f94414d901cad9aff6e1b42664a9083e41cab6`); 11 tablas, 12 FK y 7 CHECK.
- **Acciones referenciales:** consulta sobre `sigmavital` con 12 relaciones. Las 12 usan `ON UPDATE CASCADE`; en `ON DELETE`, cuatro usan `CASCADE` y ocho `RESTRICT`.
- **Copia de prueba (`sigmavital_prueba`):** 11 tablas, 12 FK y 7 CHECK.
- **UNIQUE compuesta:** salida `CUMPLE`; el segundo INSERT duplicado fue rechazado. El `ROLLBACK` dejó en cero los cuatro contadores de datos ficticios.
- **Restauración:** respaldo lógico con hash SHA-256 coincidente; restauración sin errores y verificación posterior de 11 tablas, 12 FK y 7 CHECK.

Los resultados están respaldados por los archivos `B5-Evidencia-DDL-Principal-MySQL-20261127-194248.txt`, `B5-Evidencia-Relaciones-MySQL-20261127-194248.txt`, `B5-Evidencia-Ejecucion-DDL-MySQL-20261127.txt`, `B5-Evidencia-Unicidad-AsignacionPersonal-MySQL-20261127.txt` y `B6-Evidencia-Restauracion-20261127-193214.txt`. La prueba UNIQUE se ejecutó en la copia `sigmavital_prueba`; el esquema principal fue verificado separadamente en su estructura y acciones referenciales.

El alcance es de pruebas locales aisladas. No se afirma despliegue productivo, alta disponibilidad, recuperación ante desastre físico, pruebas de carga ni validación integral de seguridad en producción.

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

- B1 documenta verbos y cardinalidades mínimas/máximas por extremo. Los diagramas existentes se conservaron sin cambios.
- B2 y los scripts B5 incluyen la restricción UNIQUE compuesta de `AsignacionPersonal`.
- B3 presenta una clave candidata compuesta y dependencia parcial, además de una dependencia transitiva.
- B4 declara el estándar de nomenclatura.
- B5 cuenta con ejecución real del DDL principal y de la copia de prueba en MySQL 8.0.46; los conteos verificados son 11 tablas, 12 FK y 7 CHECK.
- La prueba UNIQUE compuesta fue ejecutada en `sigmavital_prueba`: el segundo INSERT duplicado fue rechazado y el `ROLLBACK` dejó cero registros de prueba persistidos.
- B6 cuenta con evidencia de respaldo y restauración lógica aislada, con hash SHA-256 coincidente y verificación posterior 11/12/7.
- B7 registra los resultados técnicos y mantiene separados los controles documentales de las pruebas de ejecución.
- B2 incluye `RegistroCierre.id_usuario` como FK, consistente con la relación de responsable definida en B1.
- B1/B2 conservan sus fuentes Draw.io, fuentes Graphviz `.dot` y exportaciones disponibles. Ningún diagrama se redibujó ni se regeneró durante esta actualización.

## Estado de ejecución del DDL actual

El DDL principal `B5-Creacion-Base-Datos.sql` y la copia `B5-Prueba.sql` se ejecutaron correctamente en MySQL 8.0.46 dentro de un contenedor aislado. Se comprobaron 11 tablas, 12 claves foráneas y 7 restricciones CHECK. También se consultaron las 12 acciones referenciales del esquema principal, se ejecutó la prueba de unicidad sobre la copia de prueba y se completó una restauración lógica aislada. Los resultados se encuentran en los archivos de evidencia enlazados en este README.

Estas verificaciones no equivalen a una implementación productiva ni a pruebas de recuperación ante desastre físico, alta disponibilidad, carga o seguridad de producción.
