# A2 – Trazabilidad Completa de Clases a Requisitos SRS (65 / 65 RF)

| Clase / Interfaz A2 | Módulos cubiertos | Requisitos funcionales trazados | Responsabilidad única (Regla 5) |
|---|---|---|---|
| `Rol`, `Usuario` | Autenticación | `RF-001..RF-007` | Identidad, hash `passwordHash`, bloqueo 5 intentos y RBAC 5 perfiles |
| `PropietarioUnidad`, `Ambulancia`, `AmbulanciaTAB/TAM`, `MantenimientoUnidad` | Ambulancias y Unidades | `RF-008..RF-013`, `RF-045..RF-046` | Flota REPS, vigencia SOAT/tecnomecánica, dotación e historial de mantenimiento |
| `Personal`, `AsignacionPersonal` | Talento Humano | `RF-014..RF-017` | Certificaciones, jornadas continuas y rol en tripulación |
| `Paciente` | Pacientes | `RF-018..RF-020` | Confidencialidad clínica, teléfonos e historial |
| `Solicitud`, `Servicio`, `Asignacion`, `Intervencion`, `RegistroCierre` | Emergencias y Monitoreo | `RF-021..RF-029` | Triage, despacho, intervenciones y cierre obligatorio `RN-005` |
| `EstrategiaAsignacion`, `EstrategiaAsignacionUrgente/General`, `GestionServicioFacade` | Motor de Despacho | `RF-022..RF-025`, `RF-031` | Orquestación de flujos y algoritmos intercambiables <= 2 s |
| `Factura`, `NotaContable`, `MovimientoFinanciero` | Financiero | `RF-030..RF-035` | Factura inmutable al cierre, notas crédito/débito y mora día 1 / día 30 |
| `Visitante` | Visitantes | `RF-036..RF-039` | Preautorizaciones, ingreso manual justificado y registro vehicular |
| `Pqrs` | PQRS | `RF-040..RF-044` | Radicación, escalamiento automático 24 h y cierre formal |
| `Proveedor`, `ContratoProveedor` | Proveedores | `RF-047..RF-049` | Contratos vigentes, alertas 30/15/5 días y evaluación de desempeño |
| `Documento` | Documental | `RF-050..RF-054` | Versionamiento, control duplicados SHA-256 y bloqueo oficial `RN-013` |
| `Auditoria` | Auditoría | `RF-055..RF-058` | Registro append-only inalterable por 5 años |
| `NovedadOperativa` | Novedades | `RF-059..RF-063` | Incidentes, evidencia multimedia y cierre validado `RN-016` |
| `ServicioReportesKPI`, `IRepositorioDatos` | Reportes / Infraestructura | `RF-064..RF-065` | KPIs PDF/Excel read-only y desacoplamiento MySQL |
