# G2-P1 – Arquitectura de software SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL
**Ficha:** 3413974 – ADSO
**Aprendiz:** Juan Miguel Muñoz Castañeda
**Evidencia:** G2-P1 – Diseño de arquitectura y clases
**Estado:** Entrega documental de diseño; la implementación y pruebas de integración corresponden a etapas posteriores.

## 1. Índice de artefactos A1–A7

| Código | Artefacto | Archivo principal | Fuentes / exportaciones |
|---|---|---|---|
| A1 | Requisitos y decisiones tecnológicas | [A1-Requisitos-Decisiones-Tecnologicas.md](01-requisitos/A1-Requisitos-Decisiones-Tecnologicas.md) | Requisitos funcionales y no funcionales seleccionados para arquitectura. |
| A2 | Diseño de clases | [A2-Plan-Diagrama-Clases.md](02-diagrama-clases/A2-Plan-Diagrama-Clases.md) | [Draw.io](02-diagrama-clases/A2-Diagrama-Clases.drawio) · [PNG](02-diagrama-clases/A2-Diagrama-Clases.png) · [Trazabilidad](02-diagrama-clases/A2-Trazabilidad-Clases-Requisitos.md). |
| A3 | Patrones de diseño | [A3-Patrones-Diseno.md](03-patrones-diseno/A3-Patrones-Diseno.md) | Patrones Strategy y Facade y clases participantes. |
| A4 | Arquitectura y decisiones | [A4-Software-Architecture-Decisions.md](04-arquitectura/A4-Software-Architecture-Decisions.md) | [Draw.io](04-arquitectura/A4-Arquitectura-SIGMAVITAL.drawio) · [PNG](04-arquitectura/A4-Arquitectura-SIGMAVITAL.png) · [SVG](04-arquitectura/A4-Arquitectura-SIGMAVITAL.svg) · [PlantUML](04-arquitectura/A4-Arquitectura-SIGMAVITAL.puml). |
| A5 | Vista de componentes | [A5-Component-Interface-Specification.md](05-componentes/A5-Component-Interface-Specification.md) | [Draw.io](05-componentes/A5-Component-View-SIGMAVITAL.drawio) · [PNG](05-componentes/A5-Component-View-SIGMAVITAL.png) · [SVG](05-componentes/A5-Component-View-SIGMAVITAL.svg) · [PlantUML](05-componentes/A5-Component-View-SIGMAVITAL.puml). |
| A6 | Vista de despliegue | [A6-Deployment-Specification.md](06-despliegue/A6-Deployment-Specification.md) | [Draw.io](06-despliegue/A6-Deployment-View-SIGMAVITAL.drawio) · [PNG](06-despliegue/A6-Deployment-View-SIGMAVITAL.png) · [SVG](06-despliegue/A6-Deployment-View-SIGMAVITAL.svg) · [PlantUML](06-despliegue/A6-Deployment-View-SIGMAVITAL.puml) · [Graphviz](06-despliegue/A6-Deployment-View-SIGMAVITAL.dot). |
| A7 | Matriz de trazabilidad | [A7-Requirements-Traceability-Matrix.md](07-trazabilidad/A7-Requirements-Traceability-Matrix.md) | Relaciona RF seleccionados, clases A2 y componentes A5. |

## 2. Decisiones arquitectónicas clave

- Estilo por capas: presentación, aplicación, dominio e infraestructura.
- Strategy para variar criterios de asignación sin acoplarlos al coordinador del proceso.
- Facade para coordinar el flujo de gestión de servicios.
- Repository/Persistence para aislar el acceso a datos.
- Se evaluó y descartó microservicios para el alcance inicial; la justificación está en A4, sección 9.
- El despliegue de tres nodos y los puertos propuestos se explican en A6. Los valores son supuestos de diseño configurables, no evidencia de despliegue real.

## 3. Reutilización y cambios realizados

Se reutilizó como línea base la documentación de requisitos y los artefactos de análisis de G1-P1/G1-P2. Se ajustaron y relacionaron los diagramas A2–A6 para mantener correspondencia entre clases, patrones, arquitectura, componentes y despliegue. Se añadió mapeo explícito de componentes a clases y requisitos, una alternativa arquitectónica descartada y detalle de protocolos/puertos propuestos.

Los archivos `.drawio` y `.puml` son fuentes editables; los `.png` y `.svg` son exportaciones de consulta. Las imágenes no sustituyen a las fuentes editables.

## 4. Autoría y uso de herramientas de IA

**Aprendiz responsable:** Juan Miguel Muñoz Castañeda.
Se utilizó IA como apoyo para estructurar, revisar consistencia y mejorar redacción y trazabilidad. El aprendiz debe verificar los criterios, comprender las decisiones y validar durante implementación los supuestos técnicos. No se declara que los componentes estén implementados ni que el despliegue propuesto esté en producción.

## 5. Limitaciones de validación

La evidencia corresponde a diseño. Los puertos TCP/443 y TCP/3306 son propuestas estándar que deben configurarse y probarse en el entorno seleccionado. Pruebas de carga, TLS, autorización, auditoría, respaldo/restauración y comunicación real quedan pendientes de implementación y validación.
