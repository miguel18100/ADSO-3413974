# A2 – Diseño del Patrón Strategy en Asignación de Ambulancias – SIGMAVITAL

## Interfaz: \`EstrategiaAsignacion\`
- \`+ seleccionarAmbulancia(lista: List<Ambulancia>, sol: Solicitud): Ambulancia\`
- \`+ evaluar(amb: Ambulancia, sol: Solicitud): bool\`

## Implementaciones concretas
1. **\`EstrategiaAsignacionUrgente\` (\`RF-022\`, \`RNF-009\`):** prioriza ambulancias \`TAM\` disponibles con documentación \`SOAT/REPS\` vigente (\`RN-001\`, \`RN-003\`) para prioridades clínicas \`Rojo\` y \`Naranja\` en un tiempo máximo de **2 segundos**.
2. **\`EstrategiaAsignacionGeneral\` (\`RF-022\`, \`RN-002\`):** prioriza proximidad y unidades \`TAB\`/\`TAM\` para traslados programados o prioridades \`Amarillo\` y \`Verde\`.

## Integración en \`A2\` y \`A3\`
\`Asignacion\` inyecta \`EstrategiaAsignacion\` desde \`GestionServicioFacade\`; si el coordinador elige asignación manual diferente (\`RF-023\`), se registra obligatoriamente \`motivo_asignacion_manual\` conforme a \`RN-007\`.
