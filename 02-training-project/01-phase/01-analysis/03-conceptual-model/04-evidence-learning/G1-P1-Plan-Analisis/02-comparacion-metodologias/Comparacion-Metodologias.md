# Comparación de metodologías de desarrollo de software

## 1. Introducción

Para el desarrollo del Sistema Gestor de Ambulancias (SGA), se realiza una comparación de diferentes metodologías de desarrollo de software con el propósito de identificar el enfoque que mejor se adapte a las características del proyecto, su alcance preliminar, la necesidad de definir requisitos, la organización del equipo y la posibilidad de realizar entregas incrementales.

Las metodologías evaluadas son RUP, Scrum, XP y RAD.

## 2. Metodologías evaluadas

### 2.1 RUP (Rational Unified Process)

RUP es una metodología de desarrollo de software que organiza el proceso en fases y disciplinas, haciendo énfasis en la gestión de requisitos, el diseño arquitectónico, la implementación, las pruebas y la documentación.

**Ventajas:**
- Permite organizar el proyecto por fases.
- Promueve la documentación y trazabilidad de requisitos.
- Facilita la identificación y gestión de riesgos.
- Favorece el desarrollo iterativo.

**Desventajas:**
- Puede generar una carga documental considerable.
- Requiere planificación y organización rigurosas.
- Puede resultar complejo para equipos pequeños.

**Aplicabilidad al SGA:**

RUP podría contribuir a organizar la definición de requisitos, arquitectura, diseño y pruebas del SGA, especialmente por la importancia de documentar los procesos de gestión de ambulancias, perfiles de usuario y reglas operativas.

### 2.2 Scrum

Scrum es un marco de trabajo ágil que permite organizar el desarrollo mediante ciclos de trabajo denominados Sprint, priorización de funcionalidades, seguimiento periódico y revisión de incrementos.

**Ventajas:**
- Permite desarrollar funcionalidades de forma incremental.
- Facilita la adaptación a cambios en los requisitos.
- Promueve la comunicación y colaboración del equipo.
- Permite revisar avances periódicamente.
- Facilita la priorización de funcionalidades.

**Desventajas:**
- Requiere compromiso y comunicación constante.
- La falta de organización puede afectar el cumplimiento de los Sprint.
- Requiere una adecuada priorización y gestión del backlog.

**Aplicabilidad al SGA:**

Scrum permite organizar el desarrollo del SGA por módulos, como autenticación, gestión de ambulancias TAB/TAM, personal asistencial, solicitudes de emergencia, asignación y reportes, facilitando la revisión progresiva de los avances.

### 2.3 XP (Extreme Programming)

XP es una metodología ágil enfocada en la calidad del software, la comunicación, la retroalimentación frecuente y las prácticas técnicas de desarrollo.

**Ventajas:**
- Promueve la calidad del código.
- Favorece la integración frecuente.
- Fomenta la retroalimentación continua.
- Impulsa la realización de pruebas.
- Facilita la adaptación a cambios.

**Desventajas:**
- Exige disciplina técnica.
- Puede requerir disponibilidad frecuente de usuarios o responsables.
- Algunas prácticas pueden ser difíciles de aplicar cuando el equipo no dispone de experiencia suficiente.

**Aplicabilidad al SGA:**

XP podría apoyar el desarrollo del SGA mediante pruebas frecuentes, revisión del código, integración continua y validación de funcionalidades relacionadas con las solicitudes, asignaciones y seguimiento de ambulancias.

### 2.4 RAD (Rapid Application Development)

RAD es un enfoque de desarrollo que prioriza la construcción rápida de prototipos, la retroalimentación del usuario y la evolución de la solución mediante iteraciones.

**Ventajas:**
- Favorece la construcción rápida de prototipos.
- Permite obtener retroalimentación temprana.
- Facilita la visualización de interfaces.
- Puede reducir el tiempo de desarrollo de ciertos componentes.

**Desventajas:**
- Requiere participación activa de los usuarios.
- Puede generar dificultades si los requisitos son complejos.
- No siempre es adecuado para proyectos que requieren planificación arquitectónica detallada.
- La rapidez puede afectar la calidad si no se realizan controles adecuados.

**Aplicabilidad al SGA:**

RAD podría utilizarse para prototipar interfaces del sistema, como el panel de coordinación, formularios de solicitudes de emergencia, gestión de ambulancias y vistas de seguimiento, permitiendo validar las interfaces antes de su implementación definitiva.

## 3. Comparación de metodologías

| Criterio | RUP | Scrum | XP | RAD |
|---|---|---|---|---|
| Organización del proyecto | Por fases e iteraciones | Por Sprint | Iteraciones cortas | Prototipos e iteraciones rápidas |
| Gestión de requisitos | Formal y documentada | Backlog priorizado | Requisitos orientados a historias y cambios | Requisitos y retroalimentación |
| Documentación | Alta | Moderada y adaptable | Generalmente ligera | Variable |
| Adaptación a cambios | Media-alta | Alta | Alta | Alta |
| Participación del usuario | Durante las fases y revisiones | Frecuente | Muy frecuente | Muy frecuente |
| Control de calidad | Disciplinas y pruebas | Revisión de incrementos | Prácticas técnicas intensivas | Validación de prototipos |
| Adecuación a equipos pequeños | Media | Alta | Alta, con disciplina técnica | Alta, dependiendo del alcance |
| Aplicabilidad al SGA | Alta | Alta | Alta | Media-alta |

## 4. Análisis comparativo

RUP proporciona una estructura organizada para la gestión documental, los requisitos y la arquitectura del sistema. Sin embargo, su aplicación completa puede representar una carga considerable para un equipo de desarrollo pequeño.

Scrum ofrece flexibilidad para organizar el desarrollo del SGA en incrementos funcionales y permite priorizar módulos de acuerdo con las necesidades identificadas. Su enfoque facilita el seguimiento del trabajo y la revisión de resultados.

XP se destaca por sus prácticas técnicas orientadas a la calidad, especialmente las pruebas, integración frecuente y revisión del código. Estas prácticas podrían complementar el proceso de desarrollo.

RAD permite construir prototipos de manera rápida y facilita la validación de interfaces, aunque no necesariamente ofrece por sí solo toda la estructura de planificación y seguimiento requerida para el proyecto.

## 5. Conclusión

A partir de la comparación realizada, Scrum presenta características favorables para la organización del desarrollo del Sistema Gestor de Ambulancias (SGA), debido a su enfoque incremental, flexibilidad, organización del trabajo y posibilidad de priorizar funcionalidades.

La selección definitiva de la metodología se documenta en el archivo de selección y justificación de metodología, correspondiente al siguiente componente del plan de análisis.

---

Documento correspondiente a la evidencia G1-P1 – Plan de análisis.

<!-- Actualizacion de evidencia G1-P1 SIGMAVITAL -->
