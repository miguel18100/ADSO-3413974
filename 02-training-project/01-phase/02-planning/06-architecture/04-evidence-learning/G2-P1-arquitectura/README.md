# G2-P1 – Arquitectura de software SIGMAVITAL

## 1. Datos de la entrega

| Campo | Valor |
|---|---|
| Producto | P1 – Artefactos de diseño |
| Usuario de GitHub del autor | `miguel18100` |
| Ficha | 3413974 – ADSO |
| Caso elegido (nombre del proyecto) | SIGMAVITAL – Sistema Gestor de Ambulancias (SGA) |
| Informe de análisis / SRS del caso (ruta en el fork) | [Matriz de requisitos y casos de uso G1-P1](../../../../../../02-training-project/01-phase/01-analysis/03-conceptual-model/04-evidence-learning/G1-P1-Plan-Analisis/05-matriz-requisitos-casos-uso/Matriz-Requisitos-Casos-Uso.md) |
| Cuenta de GitHub con la que se hacen los commits | `miguel18100` |

## 2. Origen del insumo y trabajo en equipo

| Pregunta | Respuesta |
|---|---|
| ¿El SRS / informe de análisis lo elaboró un equipo? ¿Cuántas personas? | La línea base de análisis del proyecto se trabajó en equipo de cuatro integrantes. El archivo fuente consultado no distribuye la autoría por requisito o apartado. |
| ¿Qué parte del SRS es tuya? | No atribuyo a mi autoría exclusiva la matriz base. Mi aporte en esta evidencia consiste en seleccionar los 12 RF y 10 RNF usados para el diseño P1 y elaborar los artefactos A1–A7. |
| ¿Los artefactos de esta entrega los hiciste tú solo? | Sí. Los artefactos de diseño A1–A7 de esta carpeta fueron elaborados individualmente, tomando como insumo la línea base del proyecto y declarando las fuentes reutilizadas. |
| ¿Otro aprendiz usó o te compartió archivos de esta entrega? | No se declara como propio material de entrega de otro aprendiz. Las fuentes reutilizadas se limitan a la documentación del proyecto indicada en la sección 3; no se atribuye a terceros la autoría de los artefactos A1–A7. |

## 3. Qué reutilicé, qué ajusté y qué hice nuevo

| Artefacto | Archivo en esta carpeta | Origen (ruta en el fork o «nuevo») | Qué ajusté o agregué |
|---|---|---|---|
| A1 – Requisitos y decisión tecnológica | `01-requisitos/A1-Requisitos-Decisiones-Tecnologicas.md` | `02-training-project/01-phase/01-analysis/03-conceptual-model/04-evidence-learning/G1-P1-Plan-Analisis/05-matriz-requisitos-casos-uso/Matriz-Requisitos-Casos-Uso.md` | Selección explícita de 12 RF y 10 RNF, actores, alcance, restricciones y justificación de plataforma y tecnologías. |
| A2 – Diseño de clases | `02-diagrama-clases/A2-Plan-Diagrama-Clases.md`; `A2-Diagrama-Clases.drawio`; `A2-Diagrama-Clases.png`; `A2-Trazabilidad-Clases-Requisitos.md` | Nuevo, basado en A1, la matriz G1-P1 indicada arriba y MD-01 (`02-training-project/01-phase/02-planning/05-prototype/04-evidence-learning/03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md`) como insumos | Diseño de clases, atributos, operaciones, relaciones, multiplicidades y trazabilidad de clases a requisitos. |
| A3 – Patrones de diseño | `03-patrones-diseno/A3-Patrones-Diseno.md` | Nuevo, basado en `02-diagrama-clases/A2-Plan-Diagrama-Clases.md` y `02-diagrama-clases/A2-Diagrama-Clases.drawio` | Aplicación y justificación de Strategy y Facade, con sus participantes y responsabilidades. |
| A4 – Arquitectura y decisiones | `04-arquitectura/A4-Software-Architecture-Decisions.md` | Nuevo, basado en A1 y A3 de esta carpeta | Arquitectura por capas, decisiones AD, respuesta a RNF, comunicación entre capas y alternativa de microservicios descartada para el alcance inicial. |
| A5 – Vista de componentes | `05-componentes/A5-Component-Interface-Specification.md` | Nuevo, basado en A2 y A4 de esta carpeta | Componentes, contratos provistos/requeridos, dirección de dependencias y mapeo a clases y RF. |
| A6 – Vista de despliegue | `06-despliegue/A6-Deployment-Specification.md` | Nuevo, basado en A4 y A5 de esta carpeta | Tres nodos propuestos, artefactos desplegados, conexiones, protocolos/puertos y consideraciones de seguridad. |
| A7 – Matriz de trazabilidad | `07-trazabilidad/A7-Requirements-Traceability-Matrix.md` | Nuevo, basado en A1, A2 y A5 de esta carpeta | Trazabilidad de los 12 RF seleccionados hacia clases y componentes, y relación con RNF. |

**Qué reutilicé (resumen en 3 a 5 líneas):**

Reutilicé la matriz de requisitos y casos de uso de G1-P1 como línea base para conservar los identificadores originales. Se retomaron los requisitos funcionales y no funcionales pertinentes al flujo operativo de ambulancias. La matriz de origen se cita como insumo y no se presenta como un documento de autoría individual.

**Qué ajusté para llevarlo al estándar de la rúbrica (resumen en 3 a 5 líneas):**

Delimité el alcance de arquitectura a 12 RF y 10 RNF seleccionados, explicité los perfiles de actor y las restricciones del MVP y relacioné los requisitos con decisiones tecnológicas. Armonicé la responsabilidad de gestión de ambulancias y personal entre A5 y A7 y diferencié proveedores y consumidores de interfaces.

**Qué hice completamente nuevo (resumen en 3 a 5 líneas):**

Desarrollé el diseño de clases y patrones, la arquitectura por capas, la vista de componentes, el despliegue propuesto y la matriz de trazabilidad. Los diagramas editables y sus exportaciones se mantienen en la carpeta. Estos artefactos representan una propuesta de diseño, no una afirmación de implementación en producción.

## 4. Autoverificación de mínimos

**P1:**

- [x] A1 Ficha de interpretación: 12 RF y 10 RNF identificados; plataforma y tecnologías justificadas.
- [x] A2 Diagrama de clases: 15 clases documentadas, atributos tipados, operaciones, visibilidad, multiplicidades, composición y Strategy con dos implementaciones.
- [x] A3 Dos patrones GoF distintos: Strategy y Facade.
- [x] A4 Arquitectura con diagrama, capas y respuestas arquitectónicas para 10 RNF.
- [x] A5 Vista de componentes con 11 componentes, contratos y dependencias.
- [x] A6 Vista de despliegue con tres nodos, artefactos y protocolos/puertos propuestos.
- [x] A7 Matriz que traza los 12 RF seleccionados hacia clases y componentes. No representa cobertura de los 31 RF de la línea base completa.
- [x] Fuentes editables e imágenes exportadas de los diagramas A2, A4, A5 y A6.

**P2:** No aplica a esta carpeta; corresponde a `G2-P2-diseño-datos`.

## 5. Historial de commits

| Día del commit | Mensaje de ejemplo |
|---|---|
| 2026-11-26 | `0d60141` – docs: complete G2-P1 architecture evidence A3-A7 |
| 2026-11-27 | `fb917cb` – Completar y corregir evidencias G1-P1, G1-P2 y G2-P2 (incluye cambios de G2-P1) |

Las fechas anteriores corresponden a las fechas registradas en el historial Git. La consulta de eventos de GitHub realizada durante esta revisión no permitió recuperar una fecha/hora de publicación inequívoca para cada push; por ello no se afirma una hora específica de envío.

## 6. Uso de inteligencia artificial (declaración obligatoria)

| Herramienta | Para qué la usé | Qué verifiqué o cambié después |
|---|---|---|
| ChatGPT (OpenAI) | Apoyo para revisar consistencia, organizar la documentación, proponer redacción y comprobar correspondencia entre requisitos, clases, componentes y arquitectura. | Revisé los documentos y las correspondencias A1–A7, contrasté los cambios con los archivos del repositorio, comprobé las pruebas SQL de G2-P2 en un contenedor MySQL aislado y verifiqué que los diagramas conservaran sus hashes. Las decisiones y resultados se revisan antes de la sustentación. |

## 7. Enlaces

- Informe de análisis / SRS del caso: [Matriz de requisitos G1-P1](../../../../../../02-training-project/01-phase/01-analysis/03-conceptual-model/04-evidence-learning/G1-P1-Plan-Analisis/05-matriz-requisitos-casos-uso/Matriz-Requisitos-Casos-Uso.md).
- Carpeta de esta entrega en GitHub: [G2-P1-arquitectura](https://github.com/miguel18100/ADSO-3413974/tree/main/02-training-project/01-phase/02-planning/06-architecture/04-evidence-learning/G2-P1-arquitectura).
- Diagrama de clases: [A2 Draw.io](02-diagrama-clases/A2-Diagrama-Clases.drawio).
- Diagramas de arquitectura, componentes y despliegue: [A4](04-arquitectura/A4-Arquitectura-SIGMAVITAL.drawio), [A5](05-componentes/A5-Component-View-SIGMAVITAL.drawio) y [A6](06-despliegue/A6-Deployment-View-SIGMAVITAL.drawio).

## 8. Declaración de autoría

Declaro que los artefactos de diseño A1–A7 de esta carpeta fueron elaborados individualmente por mí para esta evidencia; que las fuentes y elementos reutilizados están identificados en la sección 3; que no presento como propio material del instructor ni artefactos de entrega de otros aprendices; y que puedo explicar las decisiones, relaciones y limitaciones documentadas durante la verificación oral.

Usuario de GitHub: `miguel18100`
Fecha: 2026-11-27