# B7 – Checklist de aceptación de Productos 1 y 2 – SIGMAVITAL

**Proyecto:** SIGMAVITAL · **Ficha:** 3413974 – ADSO · **Evidencia:** G2-P2
**Propósito:** verificar de forma medible los artefactos de P1 y P2. Los estados reflejan evidencia documental disponible en el paquete; no sustituyen una evaluación del instructor ni declaran pruebas que no se hayan ejecutado.

## 1. Estados y severidad

- **Cumple:** existe evidencia directa y verificable en el repositorio.
- **Pendiente:** el criterio requiere validación o evidencia todavía no disponible.
- **No cumple:** la evidencia revisada no satisface el criterio.
- **Crítica:** afecta integridad, requisito esencial o seguridad. **Mayor:** afecta consistencia o aceptación. **Menor:** mejora documental/presentación.

## 2. Checklist de P1 – Requisitos y arquitectura

| ID | Criterio medible | Severidad | Estado | Evidencia / verificación |
|---|---|---|---|---|
| P1-01 | A1 contiene al menos 8 RF con identificadores únicos. | Crítica | Cumple | `G2-P1-arquitectura/01-requisitos/A1-Requisitos-Decisiones-Tecnologicas.md`; contar IDs RF. |
| P1-02 | A1 identifica al menos 3 RNF con identificadores. | Mayor | Cumple | A1; sección de requisitos no funcionales. |
| P1-03 | A2 contiene al menos 8 clases con atributos tipados y visibilidad. | Crítica | Cumple | `02-diagrama-clases/A2-Diagrama-Clases.drawio` y PNG; inspeccionar clases. |
| P1-04 | A2 documenta al menos 2 relaciones con multiplicidades y una relación de composición/agregación. | Mayor | Cumple | `A2-Relaciones-Multiplicidades.md` y diagrama. |
| P1-05 | A2 representa herencia o implementación de interfaz. | Mayor | Cumple | `A2-Diagrama-Clases.drawio`; relaciones de generalización/realización. |
| P1-06 | A3 documenta al menos 2 patrones con problema, intención y participantes. | Mayor | Cumple | `03-patrones-diseno/A3-Patrones-Diseno.md` (Strategy y Facade). |
| P1-07 | A4 identifica estilo y responsabilidades de todas las capas. | Crítica | Cumple | `04-arquitectura/A4-Software-Architecture-Decisions.md`, secciones 2–4. |
| P1-08 | A4 relaciona al menos 3 RNF con decisiones arquitectónicas. | Mayor | Cumple | A4, sección 6; tabla RNF-respuesta. |
| P1-09 | A4 presenta una alternativa arquitectónica descartada y al menos 2 razones. | Mayor | Cumple | A4, sección 9; alternativa microservicios. |
| P1-10 | A5 identifica al menos 5 componentes y sus contratos/dependencias. | Crítica | Cumple | `05-componentes/A5-Component-Interface-Specification.md`, secciones 2–5. |
| P1-11 | A5 mapea cada componente a clases A2 y requisitos RF. | Mayor | Cumple | A5, sección 9; tabla de trazabilidad de componentes. |
| P1-12 | A6 muestra al menos 3 nodos de despliegue y artefactos asignados. | Crítica | Cumple | `06-despliegue/A6-Deployment-View-SIGMAVITAL.drawio` y especificación. |
| P1-13 | A6 declara protocolo y puerto de cada enlace de red; llamadas internas se marcan como in-process. | Mayor | Cumple | A6, sección 5; TCP/443, TCP/3306, N/A para llamadas internas. |
| P1-14 | A7 vincula los RF seleccionados con clases y componentes. | Crítica | Cumple | `07-trazabilidad/A7-Requirements-Traceability-Matrix.md`. |
| P1-15 | README enumera A1–A7, enlaces, decisiones, reutilización, autoría y uso de IA. | Mayor | Cumple | `G2-P1-arquitectura/README.md`. |

## 3. Checklist de P2 – Diseño de datos

| ID | Criterio medible | Severidad | Estado | Evidencia / verificación |
|---|---|---|---|---|
| P2-01 | B1 contiene al menos 6 entidades con identificador y atributos. | Crítica | Cumple | `B1-Modelo-Conceptual-Datos.md`, sección 3 (11 entidades). |
| P2-02 | Cada relación B1 tiene verbo y cardinalidades mínimas/máximas por extremo. | Mayor | Cumple | B1, sección 4; corroborar con Draw.io. |
| P2-03 | B1 resuelve la relación N:M mediante entidad asociativa con atributos propios. | Crítica | Cumple | B1, sección 5; `AsignacionPersonal`. |
| P2-04 | B2 contiene al menos 8 tablas con PK. | Crítica | Cumple | `B2-Modelo-Relacional.md`, sección 2 (11 tablas). |
| P2-05 | Las relaciones entre tablas se implementan con FK documentadas. | Crítica | Cumple | B2, sección 3; DDL principal y `B5-Evidencia-Relaciones-MySQL-20261127-194248.txt` (12 relaciones consultadas). |
| P2-06 | La tabla asociativa impide duplicar una pareja asignación-personal. | Crítica | Cumple | UNIQUE `uq_asignacionpersonal_asignacion_personal`; prueba real en `sigmavital_prueba`, evidencia `B5-Evidencia-Unicidad-AsignacionPersonal-MySQL-20261127.txt`. |
| P2-07 | B3 demuestra 0FN, 1FN, 2FN y 3FN para una relación con clave candidata compuesta. | Mayor | Cumple documental | `B3-Normalizacion.md`, sección 2; revisar FDs y descomposición. |
| P2-08 | B3 identifica una dependencia transitiva y su descomposición a 3FN. | Mayor | Cumple documental | B3, sección 3; Usuario/Rol. |
| P2-09 | B4 documenta todas las tablas y columnas, con tipos y restricciones. | Crítica | Cumple documental | `B4-Diccionario-Datos.md`; comparar contra B2/B5 antes de implementar. |
| P2-10 | B4 declara un estándar de nombres para tablas, columnas y restricciones. | Menor | Cumple | B4, sección “Estándar de nomenclatura”. |
| P2-11 | B5 crea el conjunto de tablas definido en B2. | Crítica | Cumple | DDL principal ejecutado en MySQL 8.0.46; 11 tablas verificadas. `B5-Evidencia-DDL-Principal-MySQL-20261127-194248.txt`. |
| P2-12 | B5 incluye PK, FK, NOT NULL, UNIQUE y al menos 3 CHECK. | Crítica | Cumple | DDL principal ejecutado; `information_schema` confirmó 11 tablas, 12 FK y 7 CHECK. La UNIQUE compuesta se probó en la copia de prueba. Evidencias B5 fechadas. |
| P2-13 | B5 define acciones referenciales para las relaciones documentadas. | Mayor | Cumple | Consulta real de las 12 relaciones del esquema principal; evidencia `B5-Evidencia-Relaciones-MySQL-20261127-194248.txt`. |
| P2-14 | Existe evidencia de prueba de unicidad para la pareja Asignacion/Personal. | Crítica | Cumple | Salida real `CUMPLE`; el segundo INSERT duplicado fue rechazado y el `ROLLBACK` no dejó fixtures. `B5-Evidencia-Unicidad-AsignacionPersonal-MySQL-20261127.txt`. |
| P2-15 | B6 contiene al menos 2 políticas de integridad, 2 de confidencialidad y 2 de disponibilidad. | Crítica | Cumple documental | `B6-Politicas-Seguridad-Datos.md`; verificar secciones de políticas. |
| P2-16 | B6 define una matriz de acceso con al menos 3 roles y el uso de hash/salt y TLS. | Crítica | Cumple documental | B6; matriz de roles y controles de seguridad. |
| P2-17 | B6 define frecuencia, almacenamiento y control de respaldos. | Mayor | Cumple documental | B6; política de respaldo. |
| P2-18 | Se ejecutó y documentó una restauración en ambiente aislado. | Crítica | Cumple | Restauración lógica de `sigmavital_prueba`; SHA-256 coincidente y verificación posterior de 11 tablas, 12 FK y 7 CHECK. `B6-Evidencia-Restauracion-20261127-193214.txt`. |
| P2-19 | B7 verifica al menos 20 criterios medibles de P1 y P2. | Mayor | Cumple | Este checklist contiene 35 criterios enumerados P1/P2. |
| P2-20 | B7 relaciona los criterios con archivos o verificaciones concretas. | Mayor | Cumple | Columna Evidencia / verificación de cada fila. |

## 4. Hallazgos y correcciones

| ID | Hallazgo | Corrección incorporada | Verificación posterior | Estado |
|---|---|---|---|---|
| H-01 | La tabla asociativa no impedía de forma explícita repetir una pareja asignación-personal. | Se añadió UNIQUE compuesta a B2 y a los dos scripts SQL. | Prueba real MySQL 8.0.46: segundo INSERT rechazado; `ROLLBACK` comprobado. | Verificado con DDL y prueba de ejecución. |
| H-02 | B3 no demostraba una dependencia parcial sobre una clave compuesta. | Se incorporó el ejemplo de AsignacionPersonal con FDs parciales y descomposición a 2FN/3FN. | Revisión lógica de FDs y claves en B3. | Verificado documentalmente. |
| H-03 | El diccionario no declaraba convención de nombres. | Se declaró PascalCase, snake_case y prefijos de restricciones. | Comparar nombres contra B2 y B5. | Verificado documentalmente. |
| H-04 | La restauración se mencionaba como política sin pasos de ejecución reproducibles. | Se añadió procedimiento de respaldo, restauración aislada, verificaciones y formato de registro. | Respaldo y restauración lógica ejecutados; hash SHA-256 coincidente y conteos 11/12/7 después de restaurar. | Verificado en contenedor aislado; no acredita recuperación ante desastre físico. |
| H-05 | Las cardinalidades B1 se expresaban como 1:N sin mínimo/máximo en ambos extremos. | Se reescribió la tabla con verbos y multiplicidades `0..1`, `1..1`, `0..*`, `1..*`. | Revisar tabla y conectores editables B1. | Verificado documentalmente; revisar exportación gráfica. |
| H-06 | Algunos criterios del checklist anterior se mantenían “pendientes” de forma genérica. | Se sustituyeron por 35 criterios medibles con evidencia y estado por criterio. | Se comprobaron rutas y evidencias asociadas; las pruebas técnicas ejecutadas se enlazan en B5/B6. | Verificado documentalmente y actualizado con resultados técnicos. |

## 5. Resultado de aceptación

Los criterios documentales y técnicos se evalúan según las evidencias identificadas en este checklist. Para el alcance de base de datos, el DDL principal y la copia de prueba se ejecutaron en MySQL 8.0.46; se verificaron 11 tablas, 12 claves foráneas y 7 CHECK, las 12 acciones referenciales, la UNIQUE compuesta en la copia de prueba y una restauración lógica aislada. Esto no sustituye la evaluación del instructor ni declara implementados en producción los controles de puertos, TLS, autorización, rendimiento, alta disponibilidad o recuperación ante desastre físico.

## 6. Control de los cambios de última versión

El guion `B5-Prueba-Unicidad-AsignacionPersonal.sql` se ejecutó con datos ficticios dentro de `sigmavital_prueba`. El segundo INSERT de la misma pareja fue rechazado por UNIQUE y la transacción se revirtió, sin dejar fixtures persistidos. El DDL principal `B5-Creacion-Base-Datos.sql` se ejecutó separadamente en `sigmavital`; las consultas reales confirmaron los conteos estructurales y las 12 acciones referenciales. La restauración lógica se realizó sobre la base aislada y se verificó después de importar el respaldo.

Las evidencias fechadas están enlazadas en las filas P2-06 y P2-11 a P2-14, y P2-18. El alcance de la restauración es lógico y local; no representa una prueba de recuperación ante desastre físico ni de alta disponibilidad.
