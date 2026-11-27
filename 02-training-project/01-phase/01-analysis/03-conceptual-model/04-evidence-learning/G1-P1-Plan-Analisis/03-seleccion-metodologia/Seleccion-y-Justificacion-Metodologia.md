# Selección y justificación de la metodología de desarrollo

## 1. Metodología seleccionada

**Marco de trabajo principal: Scrum.**

Se selecciona Scrum para organizar el trabajo del Sistema Gestor de Ambulancias (SGA) mediante objetivos de iteración, un backlog priorizado, responsabilidades definidas y revisiones de incrementos.

## 2. Evidencia que sustenta la selección

La comparación de RUP, Scrum, XP y RAD utilizó cuatro características del SGA: tipo de solución web y modular, equipo de cinco integrantes, estabilidad media de los requisitos y disponibilidad del cliente no acreditada como continua. Con una escala de ajuste de 1 a 5 y ponderaciones explícitas, Scrum obtuvo **85/100**, por encima de RUP (66/100), XP (66/100) y RAD (65/100).

La puntuación no significa que Scrum sea universalmente superior; expresa su mejor ajuste relativo a las condiciones documentadas para este proyecto.

## 3. Justificación

### 3.1 Organización de un equipo pequeño

El documento del proyecto identifica cinco integrantes/autores, pero no asigna formalmente funciones como Product Owner, Scrum Master ni perfiles backend, frontend o QA. Por ello, esta selección propone Scrum como marco de organización; no afirma que sus responsabilidades estén ya asignadas. Antes de iniciar los Sprints, el equipo deberá designar un Product Owner con capacidad para ordenar el Product Backlog y comunicar el Product Goal, y aclarar quién facilita el proceso Scrum. La estructura ligera de Scrum puede ayudar a coordinar el trabajo de cinco integrantes sin introducir una carga documental desproporcionada.

### 3.2 Desarrollo modular e incremental

El SGA comprende funcionalidades diferenciadas que pueden priorizarse y revisarse por incrementos: autenticación, gestión de ambulancias TAB/TAM, gestión del personal, solicitudes, disponibilidad, asignación, seguimiento, novedades y reportes. Esta estructura permite entregar y revisar primero las funciones críticas de operación.

### 3.3 Adaptación a requisitos de estabilidad media

El alcance principal está identificado, pero los criterios de asignación, disponibilidad, prioridad clínica y diferencias operativas TAB/TAM requieren refinamiento. La revisión del backlog permite incorporar esos hallazgos y ajustar prioridades sin perder la trazabilidad de los requisitos.

### 3.4 Disponibilidad periódica de usuarios

Las fuentes consultadas identifican perfiles de usuario e instrumentos de levantamiento, pero no acreditan que exista un cliente disponible diariamente ni muestran entrevistas diligenciadas. Por ello, Scrum deberá apoyarse en sesiones de revisión programadas y en un representante de usuario que consolide observaciones. Esta condición es una restricción de planificación que deberá confirmarse, no una disponibilidad asumida como hecho.

### 3.5 Seguimiento y verificación

La revisión al cierre de cada iteración permitirá comprobar que los requisitos priorizados estén relacionados con casos de uso, que los modelos sean consistentes y que los cambios se registren. El rol QA/Tester del equipo puede apoyar la verificación documental y el control de calidad de los incrementos.

## 4. Forma de aplicación propuesta

| Iteración | Objetivo | Actividades/entregables principales | Criterio de cierre |
|---|---|---|---|
| Preparación previa al primer Sprint | Acordar alcance, actores, enfoque y backlog inicial | Caracterización, comparación metodológica, selección y plan de análisis | Cuatro aspectos de caracterización explícitos y backlog priorizado |
| Sprint 1 - Modelado funcional | Definir y relacionar requisitos, actores y casos de uso | Inventario RF/RNF, catálogo de casos de uso y matriz de trazabilidad | Cada RF del alcance está vinculado a uno o más casos de uso o justificado |
| Sprint 2 - Consolidación | Revisar el diagrama, corregir inconsistencias y publicar la evidencia | Diagrama UML editable/exportado, revisión cruzada, README y publicación | Mínimos de UML y fuentes editables cumplidos; README y commits verificables |

La tabla describe la forma propuesta de aplicar Scrum a la fase de análisis; no afirma que se hayan realizado ceremonias formales que no estén registradas.

## 5. Razones para no seleccionar las otras metodologías como marco principal

- **RUP:** aporta estructura y trazabilidad, pero su carga de disciplinas y documentación puede ser desproporcionada para un equipo de cinco personas y el alcance de la evidencia.
- **XP:** sus prácticas de calidad son valiosas para la implementación, pero exige una retroalimentación técnica y de usuario muy frecuente; se recomienda adoptar prácticas puntuales de pruebas e integración cuando corresponda.
- **RAD:** facilita prototipos, pero depende de disponibilidad frecuente de usuarios; se puede utilizar como técnica complementaria de validación de interfaces, no como marco principal.

## 6. Conclusión

Scrum es el marco principal seleccionado para el SGA por su ajuste al tamaño del equipo, al carácter modular de la aplicación y a la necesidad de refinar requisitos de estabilidad media. Su aplicación depende de programar revisiones con los usuarios clave, dado que su disponibilidad continua no está documentada. La selección queda sustentada en la comparación ponderada y se refleja en el plan de actividades por iteraciones.

## 7. Referencias

- Schwaber, K., & Sutherland, J. (2020). *The Scrum Guide*. https://scrumguides.org/scrum-guide.html
- Beck, K., et al. (2001). *Manifesto for Agile Software Development*. https://agilemanifesto.org/iso/es/manifesto.html
