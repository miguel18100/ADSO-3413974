# A2 – Registro de Decisión: Asociación \`Paciente\` – \`Servicio\`

**Proyecto:** SIGMAVITAL – Sistema Gestor de Ambulancias (SGA)  
**Evidencia:** G2-P1 – Diseño de arquitectura y clases  
**Estado:** Validado y sincronizado con G1-P1, G1-P2 y G2-P2

## Decisión

Se mantiene la asociación simple entre \`Paciente\` y \`Servicio\` en el diagrama de clases \`A2\`:

\`Paciente "1" -- "0..*" Servicio : recibe atención\`

No corresponde a composición porque el paciente conserva su identidad longitudinal independientemente de los servicios prestados (y puede vincularse también a radicación de \`Pqrs\` y teléfonos múltiples \`PacienteTelefono\`).

## Trazabilidad SRS

- **Requisitos:** \`RF-018\`, \`RF-019\`, \`RF-020\` (identificación confidencial RBAC, estado clínico inicial e historial de servicios por paciente).
- **Caso de uso:** \`CU-09 Registrar y consultar datos del paciente\` (\`«extend»\` de \`CU-08\`).
- **Persistencia:** \`Servicio.id_paciente INT NOT NULL\` con llave foránea \`ON DELETE RESTRICT\` hacia \`Paciente(id_paciente)\`.
