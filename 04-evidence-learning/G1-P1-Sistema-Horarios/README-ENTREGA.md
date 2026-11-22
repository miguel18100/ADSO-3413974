# README — G1-P1 Modelo conceptual

## Identificación

- **Producto:** G1-P1 — Modelo conceptual.
- **Caso de estudio:** Sistema de Horarios SENA (MVP).
- **Programa:** Análisis y Desarrollo de Software (ADSO).
- **Juan Miguel Muñoz Castañeda** Completar con los datos reales del equipo.
- **Fecha de elaboración:** 21 de noviembre de 2026.

## Objetivo

Documentar la caracterización del proyecto, la comparación y selección metodológica, el plan de análisis, los requisitos funcionales y no funcionales candidatos, los casos de uso UML y la trazabilidad de los requisitos del Sistema de Horarios SENA.

## Alcance analizado

El MVP contempla la gestión de catálogos de instructores, fichas, ambientes y programas; el registro de asignaciones formativas; observaciones y novedades; días sin programación; consultas y detección de posibles cruces.

Se excluyen del alcance conceptual la gestión individual de aprendices, matrícula, asistencia, evaluación, inventario, integraciones externas complejas y optimización automática de horarios.

## Artefactos incluidos

| Archivo | Descripción |
|---|---|
| `01-caracterizacion.md` | Caracterización, contexto, alcance, riesgos y fuentes |
| `02-comparacion-metodologias.md` | Comparación RUP, Scrum y XP y selección metodológica |
| `03-plan-analisis.md` | Actividades, responsables, duración, entregables y criterios de cierre |
| `04-requisitos.md` | Requisitos funcionales y requisitos no funcionales candidatos |
| `05-matriz-trazabilidad.csv` | Relación entre requisitos funcionales y casos de uso |
| `06-casos-uso.md` | Actores, casos de uso, relaciones y límites del sistema |
| `diagramas/casos-uso.drawio` | Diagrama UML editable |
| `diagramas/casos-uso.svg` | Representación gráfica del diagrama UML |

## Trazabilidad

La matriz registra 16 requisitos funcionales y sus relaciones con los casos de uso identificados. La cobertura registrada corresponde a trazabilidad nominal entre requisitos y casos de uso; no constituye evidencia de pruebas de implementación o funcionamiento.

## Metodología seleccionada

Se propone Scrum adaptado como marco de organización del trabajo, teniendo en cuenta la naturaleza incremental del MVP y la necesidad de validar reglas operativas con los stakeholders.

La selección es una propuesta académica y está sujeta a revisión y confirmación.

## Reutilización y fuentes

Los artefactos se elaboraron tomando como referencia la documentación previa de discovery, alcance MVP y estructura técnica del proyecto.

Las fuentes base se encuentran en la documentación existente del repositorio. Los elementos derivados, adaptados y elaborados para esta entrega deben ser revisados por el equipo y explicados durante la sustentación.

## Uso de inteligencia artificial

Se utilizó ChatGPT como herramienta de apoyo para organizar, revisar, redactar, estructurar y verificar consistencia de los artefactos conceptuales, así como para generar instrucciones de revisión mediante PowerShell.

El contenido debe ser revisado, comprendido y validado por el aprendiz/equipo antes de su entrega. El uso de IA no reemplaza la responsabilidad sobre la autoría, comprensión y verificación de los artefactos.

## Validaciones pendientes

- Confirmación de reglas operativas por stakeholders.
- Confirmación de roles y permisos.
- Definición de recurrencia y granularidad de horarios.
- Definición de comportamiento ante cruces: bloqueo o advertencia.
- Validación de catálogos institucionales.
- Confirmación de importación de información.
- Registro de ajustes y commits reales.
- Completar los datos reales de identificación del equipo.

## Control de versiones

Los commits y fechas de modificación deben corresponder a registros reales del repositorio. No se declaran commits ni validaciones que no hayan sido comprobados.

## Declaración

El aprendiz/equipo debe estar en capacidad de explicar los artefactos, las decisiones metodológicas, los requisitos, las relaciones UML y las limitaciones del alcance presentado.
