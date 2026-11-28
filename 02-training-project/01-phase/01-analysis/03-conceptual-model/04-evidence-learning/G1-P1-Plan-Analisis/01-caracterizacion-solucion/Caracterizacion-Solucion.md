# Caracterización de la Solución – SIGMAVITAL (SGA)

## 1. Identificación del proyecto

| Campo | Descripción |
|---|---|
| **Nombre del sistema** | SIGMAVITAL – Sistema Gestor de Ambulancias (SGA) |
| **Tipo de solución** | Plataforma web operativa y administrativa para atención prehospitalaria |
| **Versión de alcance** | Línea base consolidada – SRS 65 RF / 29 RNF / 18 RN |
| **Marco normativo de referencia** | Resolución 3100 de 2017 (REPS), Ley 1581 de 2012 (Habeas Data), ISO/IEC 27001 e ISO/IEC 25010 |

## 2. Problema que resuelve

Las empresas y centrales de ambulancias que operan con registros dispersos en papel, llamadas sin trazabilidad u hojas de cálculo independientes presentan fallos recurrentes en cuatro frentes críticos:

1. **Despacho y oportunidad clínica:** demoras en identificar ambulancias **TAB** o **TAM** realmente disponibles y sin vencimientos documentales (SOAT, técnico-mecánica, habilitación REPS) frente a la prioridad clínica del paciente (**Verde, Amarillo, Naranja, Rojo**).
2. **Continuidad documental y talento humano:** asignación inadvertida de tripulantes en descanso o con certificaciones vencidas y descontrol de horas continuas de turno.
3. **Trazabilidad operativa, financiera y normativa:** cierres de servicio incompletos sin resultado clínico ni destino de traslado, pérdida de soporte para facturación inmutable o notas contables, descontrol de proveedores/propietarios y ausencia de auditoría inalterable.
4. **Control institucional complementario:** falta de centralización para acceso de visitantes en sede, atención oportuna de PQRS, repositorio documental versionado y seguimiento de novedades operativas.

## 3. Objetivo general de la solución

Centralizar y controlar la operación integral de servicios de ambulancias en **SIGMAVITAL**, garantizando la disponibilidad verificada de unidades y personal, la asignación asistida y manual justificada, el ciclo completo del servicio hasta su cierre formal, la emisión contable trazable, el control institucional (visitantes, PQRS, documentos, propietarios y proveedores) y la auditoría inmutable de cada evento.

## 4. Módulos y alcance funcional del SRS (65 RF)

| # | Módulo SRS | Requisitos | Alcance resumido en la solución |
|---|---|---|---|
| 1 | Autenticación y Seguridad | RF-001 a RF-007 | Registro y ciclo de usuarios, sesiones con expiración e inactividad de 15 min, recuperación segura, RBAC de 5 roles y bloqueo tras 5 intentos fallidos |
| 2 | Ambulancias y Dotación | RF-008 a RF-013 | Inventario TAB/TAM, estados operativos en tiempo real, control SOAT/tecmec/REPS con bloqueo ante vencimiento, mantenimientos y dotación Res. 3100 |
| 3 | Talento Humano | RF-014 a RF-017 | Registro de personal, tarjeta profesional, certificaciones vigentes con bloqueo automático, disponibilidad en vivo y control de turnos/horas continuas |
| 4 | Pacientes | RF-018 a RF-020 | Identificación confidencial RBAC, contacto de familiar, antecedentes, estado clínico inicial (estable/crítico/fallecido) e historial por paciente |
| 5 | Emergencias y Despacho | RF-021 a RF-027 | Solicitudes geolocalizadas, prioridad clínica, asignación automática (<= 2 s) o manual con motivo obligatorio (RN-007), estados y cierre obligatorio (RN-005) |
| 6 | Monitoreo Operativo | RF-028 a RF-029 | Tablero en tiempo real diferenciando TAB/TAM, KPIs del día y alertas críticas de flota, personal y vencimientos |
| 7 | Gestión Financiera | RF-030 a RF-035 | Ingresos/egresos con soporte, factura automática inmutable al cierre (RN-014), notas crédito/débito, cartera y mora día 1 / bloqueo día 30 (RN-015) |
| 8 | Visitantes | RF-036 a RF-039 | Ingreso/egreso, preautorizaciones vigentes o acceso manual justificado, control de documento bloqueado y registro vehicular (RN-017) |
| 9 | PQRS | RF-040 a RF-044 | Radicación y consulta sin login por código, asignación automática/24 h (RN-011), alertas de vencimiento y cierre formal documentado |
| 10 | Propietarios de Unidades | RF-045 a RF-046 | Vinculación exclusiva unidad–propietario activo, categoría de habilitación e historial de modificaciones |
| 11 | Proveedores y Contratos | RF-047 a RF-049 | Registro NIT/contratos, alertas a 30/15/5 días, bloqueo de contratos vencidos (RN-012) y evaluaciones de desempeño |
| 12 | Gestión Documental | RF-050 a RF-054 | Carga multipropósito validada, niveles de confidencialidad, control de duplicados por hash SHA-256, versionamiento automático y bloqueo oficial (RN-013) |
| 13 | Auditoría e Inmutabilidad | RF-055 a RF-058 | Bitácora integral append-only sin edición ni borrado por ningún rol (retención mínima 5 años, RN-010) y alertas de seguridad |
| 14 | Novedades Operativas | RF-059 a RF-063 | Registro clasificado por severidad, responsables, ciclo de estados con bloqueo tras resolución documentada (RN-016) y adjuntos |
| 15 | Reportes e Indicadores | RF-064 a RF-065 | Reportes programados PDF/Excel de solo lectura tras emisión (RN-018) y KPIs interactivos de oportunidad, cancelación e incidentes |

## 5. Actores y perfiles principales

- **Administrador:** gobierno de usuarios y roles, flota, propietarios, talento humano, finanzas, proveedores, documental, auditoría y reportes.
- **Coordinador Operativo:** recepción y priorización de solicitudes, monitoreo de flota, asignación automática o manual de unidades/personal, seguimiento de ciclo y novedades.
- **Paramédico / Tripulación (TES / Conductor / Auxiliar):** consulta de servicios asignados, actualización de atención, registro clínico del paciente, cierre formal del servicio y reporte de novedades.
- **Vigilante:** control físico de ingreso/egreso de visitantes y vehículos en sede según preautorización o autorización manual justificada.
- **Usuario / Ciudadano:** consulta de estado de cuenta autorizado, registro de preautorizaciones internas y radicación/consulta pública de PQRS.
- **Sistema Automático SGA (actor secundario temporal/reactivo):** automatismos de seguridad, alertas de vencimientos, selección asistida en <= 2 s, facturación al cierre y bitácora inmutable.
