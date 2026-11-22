# Caracterización del proyecto — Sistema de Horarios SENA

## Identificación
- **Caso de estudio:** Sistema de Horarios SENA (MVP).
- **Propósito:** centralizar y organizar la programación básica de formación, relacionando instructores, fichas, ambientes, horarios, observaciones y días sin programación.
- **Contexto de origen:** la programación se gestiona actualmente en una hoja de cálculo que mezcla datos académicos, disponibilidad, asignaciones y novedades.
- **Usuarios identificados en discovery:** coordinador/responsable de programación, instructor, aprendiz (beneficiario, no administrado individualmente en el MVP), administrador funcional y consultor institucional.

## Caracterización
| Aspecto | Caracterización |
|---|---|
| Tipo de proyecto | Aplicación web de apoyo a la programación de formación |
| Complejidad | Media: múltiples entidades relacionadas y reglas de conflicto |
| Equipo | Equipo de proyecto SENA ADSO; completar integrantes reales en README |
| Estabilidad de requisitos | Parcial. El alcance MVP está definido; reglas de recurrencia, roles, importación y datos institucionales requieren confirmación |
| Disponibilidad del cliente/usuario | Pendiente de confirmar con stakeholders; se requiere validar ejemplos anonimizados y reglas operativas |
| Fuente de entendimiento | Discovery y alcance MVP del repositorio; no se analizó físicamente el Excel |
| Alcance MVP | Catálogos básicos, asignaciones/horarios, observaciones, días sin programación y detección de cruces |
| Fuera de alcance | Gestión individual de aprendices, matrícula, asistencia, evaluación, inventario, SSO complejo, aprobaciones multinivel, optimización automática e integración externa |

## Riesgos y condiciones
- Reglas de horario y recurrencia incompletas.
- Catálogos oficiales no suministrados; los datos de demostración no se consideran oficiales.
- Definición pendiente sobre bloqueo versus advertencia de cruces.
- La disponibilidad real de usuarios para validar el modelo debe confirmarse.

## Evidencia base consultada
`03-execute/12-week/01-session/design-software/docs/00-discovery/entendimiento-inicial.md`  
`03-execute/12-week/01-session/design-software/docs/00-discovery/alcance-mvp.md`  
`03-execute/12-week/01-session/design-software/docs/00-discovery/estructura-tecnica-inicial.md`
