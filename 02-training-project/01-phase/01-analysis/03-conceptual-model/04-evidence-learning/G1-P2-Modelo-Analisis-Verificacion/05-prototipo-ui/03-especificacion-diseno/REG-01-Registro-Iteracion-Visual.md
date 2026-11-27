# REG-01 – Registro de ajustes y segunda verificación SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL  
**Producto:** G1-P2 – Modelo de análisis y verificación  
**Versión:** 1.2 · **Fecha:** 27/11/2026  
**Método:** revisión documental de requisitos, plantillas, diagramas, modelos, prototipo, matriz y checklist. La segunda verificación es inspección estructural/documental, no aceptación de usuarios.

## 1. Registro de hallazgos

| ID | Hallazgo detectado y evidencia anterior | Antes | Después / corrección aplicada | Segunda verificación | Estado |
|---|---|---|---|---|---|
| H-01 | DA-01 no tenía una fuente editable Graphviz/exportaciones PNG-SVG equivalentes a las de DA-02/DA-03; el bloque Mermaid presentaba un cierre de código incorrecto. | Descripción Mermaid con sintaxis defectuosa y sin paquete gráfico completo. | Se creó DA-01 `.dot`, `.png` y `.svg`; se definieron carriles Coordinador/Sistema y decisiones con guardas completas. | Se ejecutó Graphviz sobre el DOT; el PNG/SVG se generó y se comparó con las ramas A1/E1 y reintento/cancelación de CU-08. | Corregido y verificado |
| H-02 | La documentación de DA-02/DA-03 no explicaba explícitamente la ausencia de concurrencia. | Diagramas existentes sin justificación textual de bifurcación/unión no aplicable. | Se añadieron explicaciones de secuencia, descripción de decisiones, fuentes editables y enlaces de exportaciones. | Se compararon las guardas DOT/PlantUML con A1/A2/E1 de CU-11 y CU-22; las rutas coinciden. | Corregido y verificado |
| H-03 | RF-21 tenía cobertura parcial: se relacionaba con intervención, pero no existía una entidad específica para novedades operativas. | Matriz reportaba 30/31 RF con entidad completa (96,8 %). | Se añadió NovedadOperativa al dominio y NOVEDAD_OPERATIVA al MER, relacionada con SERVICIO y USUARIO; se diferenció de la intervención asistencial. | Se verificó la existencia de la clase, entidad, claves foráneas, relaciones y actualización de la fila RF-21. La matriz queda 31/31 a entidades. | Corregido y verificado |
| H-04 | El checklist anterior mezclaba seguimiento general y pruebas externas no ejecutadas con criterios de verificación de los documentos de análisis. | 22 Sí y 2 No sobre usabilidad/accesibilidad, además de criterios con alcance ajeno a la rúbrica de P2. | Se consolidó una lista de 31 criterios binarios, verificables y con evidencia directa, incluyendo cuatro controles de cobertura/trazabilidad. Las pruebas externas se conservaron como limitaciones. | Se contaron 31 filas con respuesta Sí, evidencia y resultado; se contrastaron sus rutas con los artefactos existentes. | Corregido y verificado |
| H-05 | El informe P2 no reflejaba la cobertura completa después de la decisión de RF-21 ni el conjunto actualizado del checklist. | Cobertura declarada 30/31 y revisión con pendiente de entidad. | Se actualizó el informe a 31/31 RF a CU, clase y entidad; se enlazaron los modelos, pantallas, checklist y registro. | Se contrastaron las cifras del informe con las 31 filas de la matriz y los 31 criterios del checklist. | Corregido y verificado |
| H-06 | La matriz MER no era totalmente consistente con el dominio: faltaban FK de paciente en SERVICIO y del responsable en INTERVENCION, y no estaba la entidad NOVEDAD_OPERATIVA. | Relaciones indicadas sin todos los atributos FK correspondientes. | Se añadieron paciente_id y personal_id, la entidad de novedad, sus relaciones y atributos propios. | Se verificó que cada relación declarada en el MER tenga sus claves foráneas correspondientes y coincida con el modelo conceptual. | Corregido y verificado |
| H-07 | README y ubicación de P2 no coincidían con la ruta de entrega de la rúbrica. | P2 estaba bajo `02-planning/05-prototype/04-evidence-learning`. | Se preparó la carpeta G1-P2 en `01-analysis/03-conceptual-model/04-evidence-learning/`, con índice, reutilización, autoría, uso de IA y límites. | Se comparó la ruta final con la ruta solicitada por la sección 5 de `Rubricas_G1.md`; se comprobaron los enlaces relativos del README. | Corregido y verificado |

## 2. Segunda verificación global

1. Las tres fuentes DOT se procesaron con Graphviz y produjeron PNG/SVG.
2. Las plantillas CU-08, CU-11 y CU-22 conservan flujos principales, alternos, excepciones y postcondiciones.
3. MD-01 contiene doce clases conceptuales, asociaciones con verbos y multiplicidades, y la clase de asociación AsignacionPersonal.
4. MER-01 contiene doce entidades, claves e integridad de relaciones; la relación N:M está resuelta con ASIGNACION_PERSONAL y atributos propios.
5. RF-21 tiene cobertura directa a NOVEDAD_OPERATIVA; la matriz suma 31/31 RF a CU, clase y entidad.
6. El checklist tiene 31 criterios Sí con evidencia específica.
7. El informe y el README enlazan la versión actual de los artefactos.

## 3. Alcance de la verificación

La segunda verificación acredita que los documentos y fuentes generadas son coherentes entre sí a nivel documental. No acredita pruebas con usuarios, accesibilidad formal, aprobación del instructor, backend, persistencia ni despliegue. Las cardinalidades son una propuesta de análisis que requiere validación del contexto antes de implementación.

---

**SENA – ADSO – Ficha 3413974**
