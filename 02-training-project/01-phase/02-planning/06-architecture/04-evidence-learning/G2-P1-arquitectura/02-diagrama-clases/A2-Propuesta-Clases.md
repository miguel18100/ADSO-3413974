# A2 – Catálogo Consolidado de Clases e Interfaces UML – SIGMAVITAL

| # | Elemento UML | Rol estructural | Módulos y RF trazados |
|---|---|---|---|
| 1–2 | \`Rol\`, \`Usuario\` | Seguridad, RBAC y bloqueo 5 intentos | \`RF-001..RF-007\` |
| 3–6 | \`PropietarioUnidad\`, \`Ambulancia\`, \`AmbulanciaTAB\`, \`AmbulanciaTAM\` | Flota REPS, herencia TAB/TAM y propietarios | \`RF-008..RF-013\`, \`RF-045..046\` |
| 7 | \`MantenimientoUnidad\` | Mantenimientos preventivos y correctivos | \`RF-012\` |
| 8–9 | \`Personal\`, \`AsignacionPersonal\` | Talento humano, certificaciones y N:M tripulación | \`RF-014..RF-017\` |
| 10 | \`Paciente\` | Datos confidenciales y estado clínico | \`RF-018..RF-020\` |
| 11–14 | \`Solicitud\`, \`Servicio\`, \`Asignacion\`, \`Intervencion\` | Emergencias, ciclo de vida y actuaciones clínicas | \`RF-021..RF-027\` |
| 15 | \`RegistroCierre\` | Cierre formal obligatorio REPS (\`RN-005\`) | \`RF-025\` |
| 16–18 | \`EstrategiaAsignacion\`, \`Urgente\`, \`General\` | Patrón Strategy de despacho en <= 2 s | \`RF-022..RF-023\`, \`RNF-009\` |
| 19–20 | \`GestionServicioFacade\`, \`IRepositorioDatos\` | Patrón Facade e inversión de persistencia MySQL | \`RF-021..025\`, \`RNF-025\` |
| 21–23 | \`Factura\`, \`NotaContable\`, \`MovimientoFinanciero\` | Facturación inmutable al cierre, mora y cartera | \`RF-030..RF-035\`, \`RN-014..015\` |
| 24–25 | \`Proveedor\`, \`ContratoProveedor\` | Contratación, vigencia y evaluaciones | \`RF-047..RF-049\`, \`RN-012\` |
| 26–28 | \`Visitante\`, \`Pqrs\`, \`Documento\` | Sede física, PQRS 24 h y repositorio SHA-256 | \`RF-036..044\`, \`RF-050..054\` |
| 29–30 | \`NovedadOperativa\`, \`Auditoria\`, \`ServicioReportesKPI\` | Incidentes, bitácora 5 años y KPIs | \`RF-055..RF-065\` |
