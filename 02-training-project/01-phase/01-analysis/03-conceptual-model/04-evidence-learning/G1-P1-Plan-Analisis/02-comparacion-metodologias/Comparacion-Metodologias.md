# Comparación de metodologías de desarrollo de software

## 1. Propósito

Comparar RUP, Scrum, XP y RAD respecto de las características concretas del Sistema Gestor de Ambulancias (SGA), para seleccionar un marco de trabajo coherente con el tipo de solución, el tamaño del equipo, la estabilidad de los requisitos y la disponibilidad de los usuarios clave.

## 2. Características del proyecto utilizadas como criterios

| Característica del SGA | Dato de referencia | Implicación para la metodología |
|---|---|---|
| Tipo de solución | Aplicación web multiusuario, modular y orientada a procesos operativos de ambulancias, asignaciones y seguimiento. | Se requiere integrar funcionalidades y revisar incrementos que puedan validarse por módulos. |
| Tamaño del equipo | 5 integrantes: liderazgo/Scrum Master, 2 perfiles backend, 1 frontend y 1 QA/Tester. | Conviene una organización ligera que distribuya responsabilidades sin introducir una carga de gestión desproporcionada. |
| Estabilidad de requisitos | Media: existe una línea base funcional, pero reglas de asignación, prioridad y operación TAB/TAM requieren refinamiento. | Se necesita admitir cambios controlados y repriorización conforme se aclaren reglas de negocio. |
| Disponibilidad de cliente/usuarios | No se acredita disponibilidad continua en las fuentes; se asume disponibilidad periódica mediante sesiones programadas. | Se requieren revisiones planificadas y criterios de aceptación claros; los enfoques que exigen presencia diaria del cliente tienen mayor riesgo. |

**Nota de alcance:** la disponibilidad de usuarios es un supuesto de planificación y no un hecho verificado. Los instrumentos de encuesta, entrevista y observación están diseñados, pero no se encontraron respuestas diligenciadas en la fuente revisada.

## 3. Metodologías evaluadas

### 3.1 RUP (Rational Unified Process)

RUP organiza el desarrollo por fases e iteraciones y da importancia a la arquitectura, la gestión de requisitos, los riesgos y la documentación.

- **Fortalezas para el SGA:** trazabilidad, control documental, arquitectura y gestión de riesgos en un sistema con procesos operativos importantes.
- **Limitaciones para el contexto:** su aplicación completa puede incrementar la carga de planificación y documentación para un equipo de cinco integrantes.
- **Ajuste a las características:** apropiado para la complejidad del sistema, aunque menos ligero para iteraciones frecuentes y validación periódica.

### 3.2 Scrum

Scrum organiza el trabajo en iteraciones con objetivos, backlog priorizado, revisión de incrementos y adaptación del plan.

- **Fortalezas para el SGA:** permite priorizar módulos críticos (solicitudes, disponibilidad, asignación, seguimiento) y revisar cada incremento con los usuarios cuando estén disponibles.
- **Limitaciones para el contexto:** necesita un responsable de producto o representante que responda dudas y participe en revisiones programadas.
- **Ajuste a las características:** encaja con un equipo de cinco personas, requisitos de estabilidad media y entregas funcionales por módulo; la participación periódica se puede organizar mediante sesiones de revisión.

### 3.3 XP (Extreme Programming)

XP enfatiza prácticas técnicas como pruebas frecuentes, integración continua, refactorización y retroalimentación cercana.

- **Fortalezas para el SGA:** útil para elevar calidad del código, probar reglas de asignación y reducir defectos en funcionalidades críticas.
- **Limitaciones para el contexto:** exige disciplina técnica y retroalimentación frecuente; la disponibilidad no continua del cliente puede dificultar algunas prácticas.
- **Ajuste a las características:** puede complementar el desarrollo, pero no se selecciona como marco organizativo principal de la fase de análisis.

### 3.4 RAD (Rapid Application Development)

RAD prioriza prototipos rápidos y ciclos de retroalimentación del usuario.

- **Fortalezas para el SGA:** permite validar temprano pantallas de despacho, solicitudes, ambulancias y seguimiento.
- **Limitaciones para el contexto:** depende de la participación frecuente de usuarios y puede ser insuficiente como único esquema para controlar requisitos y trazabilidad.
- **Ajuste a las características:** es útil como técnica de prototipado, pero menos adecuado como marco principal mientras la disponibilidad del cliente no esté confirmada.

## 4. Comparación ponderada respecto del SGA

Escala: 1 = ajuste bajo; 2 = limitado; 3 = moderado; 4 = alto; 5 = muy alto. Los pesos priorizan el tipo de solución y la necesidad de adaptación sin perder de vista el tamaño del equipo y la disponibilidad de usuarios. La puntuación es una herramienta de decisión del proyecto, no una medida universal de las metodologías. **Fórmula aplicada:** resultado = suma de (peso del criterio × calificación de la metodología / 5). Por ejemplo, para Scrum: (30×5/5) + (20×5/5) + (25×4/5) + (25×3/5) = 85 puntos.

| Criterio vinculado a la caracterización | Peso | RUP | Scrum | XP | RAD |
|---|---:|---:|---:|---:|---:|
| Adecuación al tipo de solución web, modular y operativa | 30 % | 4 | 5 | 4 | 4 |
| Adecuación a equipo de 5 integrantes | 20 % | 3 | 5 | 3 | 4 |
| Manejo de requisitos con estabilidad media | 25 % | 3 | 4 | 4 | 3 |
| Viabilidad con disponibilidad periódica del cliente | 25 % | 3 | 3 | 2 | 2 |
| **Resultado ponderado** | **100 %** | **66/100** | **85/100** | **66/100** | **65/100** |

### 4.1 Justificación de las puntuaciones

- **RUP:** alto ajuste a la complejidad y documentación; ajuste moderado por su mayor carga y por la necesidad de planificación formal.
- **Scrum:** alto ajuste al tamaño de equipo y a la priorización modular; requiere gestionar la disponibilidad periódica del cliente mediante revisiones programadas y un representante definido.
- **XP:** sus prácticas técnicas son valiosas, pero la retroalimentación cercana y disciplina de equipo pueden ser más exigentes en este contexto.
- **RAD:** favorece prototipos, aunque su mayor dependencia de la participación frecuente del usuario lo hace menos conveniente como marco principal con la disponibilidad aún no confirmada.

## 5. Conclusión

Scrum obtiene la mayor puntuación ponderada (85/100) y se considera la opción principal para organizar el análisis y el desarrollo incremental del SGA. RUP aporta prácticas documentales útiles; XP aporta prácticas de calidad técnica; RAD aporta prototipado rápido. Estas prácticas pueden considerarse complementarias, pero Scrum se mantiene como el marco organizativo seleccionado para evitar una combinación metodológica sin reglas claras.

---

**Evidencia:** G1-P1 - Plan de análisis.
**Proyecto:** Sistema Gestor de Ambulancias (SGA).
