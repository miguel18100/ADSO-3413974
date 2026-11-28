# Matriz Completa de Trazabilidad E2E – SIGMAVITAL (G1-P2)

**Cobertura verificada:** **65 / 65 Requisitos Funcionales (100,0 %)** desde requisito SRS hasta Caso de Uso / Actividad / Modelo de Dominio / Entidad MER y Pantalla UI.

| Código | Módulo | Requisito resumido | CU / Actividad / Pantalla UI | Clase(s) MD-01 | Entidad(es) MER-01 |
|---|---|---|---|---|---|
| RF-001 | Autenticación | El sistema debe permitir al administrador registrar usuarios mediante un formu... | CU-01..CU-03 | Usuario / Rol / Auditoria | Usuario / Rol / Auditoria |
| RF-002 | Autenticación | El sistema debe autenticar usuarios mediante correo y contraseña, generando un... | CU-01..CU-03 | Usuario / Rol / Auditoria | Usuario / Rol / Auditoria |
| RF-003 | Autenticación | El sistema debe cerrar automáticamente la sesión tras 15 minutos de inactivida... | CU-01..CU-03 | Usuario / Rol / Auditoria | Usuario / Rol / Auditoria |
| RF-004 | Autenticación | El sistema debe permitir la recuperación de contraseña mediante un enlace segu... | CU-01..CU-03 | Usuario / Rol / Auditoria | Usuario / Rol / Auditoria |
| RF-005 | Autenticación | El sistema debe implementar control de acceso basado en roles (RBAC), restring... | CU-01..CU-03 | Usuario / Rol / Auditoria | Usuario / Rol / Auditoria |
| RF-006 | Autenticación | El sistema debe permitir al administrador asignar y modificar roles de usuario... | CU-01..CU-03 | Usuario / Rol / Auditoria | Usuario / Rol / Auditoria |
| RF-007 | Autenticación | El sistema debe registrar todos los intentos de autenticación fallidos y bloqu... | CU-01..CU-03 | Usuario / Rol / Auditoria | Usuario / Rol / Auditoria |
| RF-008 | Ambulancias | El sistema debe permitir el registro completo de ambulancias, incluyendo númer... | CU-04 / CU-06 | Ambulancia / AmbulanciaTAB / AmbulanciaTAM / MantenimientoUnidad | Ambulancia / MantenimientoUnidad |
| RF-009 | Ambulancias | El sistema debe permitir actualizar el estado operativo de cada ambulancia (Di... | CU-04 / CU-06 | Ambulancia / AmbulanciaTAB / AmbulanciaTAM / MantenimientoUnidad | Ambulancia / MantenimientoUnidad |
| RF-010 | Ambulancias | El sistema debe permitir consultar el inventario de ambulancias con filtros po... | CU-04 / CU-06 | Ambulancia / AmbulanciaTAB / AmbulanciaTAM / MantenimientoUnidad | Ambulancia / MantenimientoUnidad |
| RF-011 | Ambulancias | El sistema debe registrar y controlar la documentación obligatoria de cada amb... | CU-04 / CU-06 | Ambulancia / AmbulanciaTAB / AmbulanciaTAM / MantenimientoUnidad | Ambulancia / MantenimientoUnidad |
| RF-012 | Ambulancias | El sistema debe registrar el historial de mantenimientos preventivos y correct... | CU-04 / CU-06 | Ambulancia / AmbulanciaTAB / AmbulanciaTAM / MantenimientoUnidad | Ambulancia / MantenimientoUnidad |
| RF-013 | Ambulancias | El sistema debe registrar y gestionar el inventario de equipos y dotación médi... | CU-04 / CU-06 | Ambulancia / AmbulanciaTAB / AmbulanciaTAM / MantenimientoUnidad | Ambulancia / MantenimientoUnidad |
| RF-014 | Personal | El sistema debe registrar el personal médico y operativo (paramédicos, conduct... | CU-05 / CU-06 | Personal | Personal |
| RF-015 | Personal | El sistema debe controlar la disponibilidad del personal en tiempo real, refle... | CU-05 / CU-06 | Personal | Personal |
| RF-016 | Personal | El sistema debe registrar vencimientos de certificaciones y habilitaciones del... | CU-05 / CU-06 | Personal | Personal |
| RF-017 | Personal | El sistema debe permitir consultar el historial de servicios de emergencia ate... | CU-05 / CU-06 | Personal | Personal |
| RF-018 | Pacientes | El sistema debe registrar pacientes atendidos con datos de identificación, fec... | CU-09 (P-01 ext) | Paciente / Servicio | Paciente / PacienteTelefono / Servicio |
| RF-019 | Pacientes | El sistema debe registrar el estado clínico inicial del paciente al momento de... | CU-09 (P-01 ext) | Paciente / Servicio | Paciente / PacienteTelefono / Servicio |
| RF-020 | Pacientes | El sistema debe permitir consultar el historial de servicios asociados a un pa... | CU-09 (P-01 ext) | Paciente / Servicio | Paciente / PacienteTelefono / Servicio |
| RF-021 | Emergencias | El sistema debe permitir registrar solicitudes de servicio capturando: hora de... | CU-08 / DA-01 / P-01 | Solicitud / Servicio / Asignacion / RegistroCierre | Solicitud / Servicio / HistorialEstadoServicio / Asignacion / AsignacionPersonal / RegistroCierre |
| RF-022 | Emergencias | El sistema debe ejecutar asignación automática de ambulancias considerando dis... | CU-11 / DA-02 / P-02 | Solicitud / Servicio / Asignacion / RegistroCierre | Solicitud / Servicio / HistorialEstadoServicio / Asignacion / AsignacionPersonal / RegistroCierre |
| RF-023 | Emergencias | El sistema debe permitir la asignación manual de ambulancias por el coordinado... | CU-11 / DA-02 / P-02 | Solicitud / Servicio / Asignacion / RegistroCierre | Solicitud / Servicio / HistorialEstadoServicio / Asignacion / AsignacionPersonal / RegistroCierre |
| RF-024 | Emergencias | El sistema debe gestionar el ciclo completo del servicio mediante los estados:... | CU-08 (P-01) / CU-11 (P-02) / CU-12 / CU-14 (P-03) | Solicitud / Servicio / Asignacion / RegistroCierre | Solicitud / Servicio / HistorialEstadoServicio / Asignacion / AsignacionPersonal / RegistroCierre |
| RF-025 | Emergencias | El sistema debe permitir el cierre formal del servicio únicamente cuando se ha... | CU-14 / DA-03 / P-03 | Solicitud / Servicio / Asignacion / RegistroCierre | Solicitud / Servicio / HistorialEstadoServicio / Asignacion / AsignacionPersonal / RegistroCierre |
| RF-026 | Emergencias | El sistema debe permitir la cancelación de un servicio con justificación oblig... | CU-08 (P-01) / CU-11 (P-02) / CU-12 / CU-14 (P-03) | Solicitud / Servicio / Asignacion / RegistroCierre | Solicitud / Servicio / HistorialEstadoServicio / Asignacion / AsignacionPersonal / RegistroCierre |
| RF-027 | Emergencias | El sistema debe permitir consultar el historial completo de servicios con filt... | CU-08 (P-01) / CU-11 (P-02) / CU-12 / CU-14 (P-03) | Solicitud / Servicio / Asignacion / RegistroCierre | Solicitud / Servicio / HistorialEstadoServicio / Asignacion / AsignacionPersonal / RegistroCierre |
| RF-028 | Monitoreo | El sistema debe proporcionar un panel de control centralizado con actualizació... | CU-10 (Tablero) | Ambulancia / Servicio / NovedadOperativa | Ambulancia / Servicio / NovedadOperativa |
| RF-029 | Monitoreo | El sistema debe mostrar en el panel principal indicadores clave: número de ser... | CU-10 (Tablero) | Ambulancia / Servicio / NovedadOperativa | Ambulancia / Servicio / NovedadOperativa |
| RF-030 | Financiero | El sistema debe permitir registrar ingresos con detalle de fecha, valor, tipo ... | CU-15 | Factura / NotaContable / MovimientoFinanciero | Factura / NotaContable / MovimientoFinanciero |
| RF-031 | Financiero | El sistema debe generar facturas automáticamente al cierre de un servicio de e... | CU-14 «include» CU-15 / DA-03 / P-03 | Factura / NotaContable / MovimientoFinanciero | Factura / NotaContable / MovimientoFinanciero |
| RF-032 | Financiero | El sistema debe gestionar cartera de usuarios o entidades con deudas activas, ... | CU-15 | Factura / NotaContable / MovimientoFinanciero | Factura / NotaContable / MovimientoFinanciero |
| RF-033 | Financiero | El sistema debe generar reportes financieros periódicos (diario, mensual, anua... | CU-15 | Factura / NotaContable / MovimientoFinanciero | Factura / NotaContable / MovimientoFinanciero |
| RF-034 | Financiero | El sistema debe generar recibos de pago en PDF al registrar un pago, identific... | CU-15 | Factura / NotaContable / MovimientoFinanciero | Factura / NotaContable / MovimientoFinanciero |
| RF-035 | Financiero | El sistema debe permitir la consulta del estado de cuenta por usuarios o entid... | CU-15 | Factura / NotaContable / MovimientoFinanciero | Factura / NotaContable / MovimientoFinanciero |
| RF-036 | Visitantes | El sistema debe registrar el ingreso y salida de visitantes capturando: nombre... | CU-16 | Visitante / Usuario | Visitante / Usuario |
| RF-037 | Visitantes | El sistema debe verificar la identidad del visitante, registrar opcionalmente ... | CU-16 | Visitante / Usuario | Visitante / Usuario |
| RF-038 | Visitantes | El sistema debe permitir a usuarios internos registrar pre-autorizaciones de a... | CU-16 | Visitante / Usuario | Visitante / Usuario |
| RF-039 | Visitantes | El sistema debe mantener historial completo de visitas con filtros por fecha, ... | CU-16 | Visitante / Usuario | Visitante / Usuario |
| RF-040 | PQRS | El sistema debe permitir registrar PQRS mediante formulario estructurado, clas... | CU-17 | Pqrs / Paciente / Usuario | Pqrs / Paciente / Usuario |
| RF-041 | PQRS | El sistema debe asignar automáticamente o manualmente cada PQRS al funcionario... | CU-17 | Pqrs / Paciente / Usuario | Pqrs / Paciente / Usuario |
| RF-042 | PQRS | El sistema debe permitir consultar el estado de una PQRS mediante el código de... | CU-17 | Pqrs / Paciente / Usuario | Pqrs / Paciente / Usuario |
| RF-043 | PQRS | El sistema debe permitir registrar y enviar la respuesta formal a cada PQRS co... | CU-17 | Pqrs / Paciente / Usuario | Pqrs / Paciente / Usuario |
| RF-044 | PQRS | El sistema debe mantener historial completo e inalterable de cada PQRS con tod... | CU-17 | Pqrs / Paciente / Usuario | Pqrs / Paciente / Usuario |
| RF-045 | Unidades | El sistema debe permitir registrar propietarios de unidades de ambulancia con ... | CU-04 | PropietarioUnidad / Ambulancia / Auditoria | PropietarioUnidad / Ambulancia / Auditoria |
| RF-046 | Unidades | El sistema debe controlar el estado operativo y contractual de cada unidad, im... | CU-04 | PropietarioUnidad / Ambulancia / Auditoria | PropietarioUnidad / Ambulancia / Auditoria |
| RF-047 | Proveedores | El sistema debe registrar proveedores (razón social, NIT, representante legal,... | CU-07 | Proveedor / ContratoProveedor | Proveedor / ContratoProveedor |
| RF-048 | Proveedores | El sistema debe impedir la vinculación de contratos vencidos a nuevas órdenes ... | CU-07 | Proveedor / ContratoProveedor | Proveedor / ContratoProveedor |
| RF-049 | Proveedores | El sistema debe permitir registrar evaluaciones de desempeño de proveedores al... | CU-07 | Proveedor / ContratoProveedor | Proveedor / ContratoProveedor |
| RF-050 | Documental | El sistema debe permitir la carga de documentos en formatos PDF, DOCX, XLSX e ... | CU-18 | Documento / Auditoria | Documento / Auditoria |
| RF-051 | Documental | El sistema debe implementar versionamiento automático al actualizar un documen... | CU-18 | Documento / Auditoria | Documento / Auditoria |
| RF-052 | Documental | El sistema debe permitir búsqueda avanzada por nombre, tipo, fecha, categoría,... | CU-18 | Documento / Auditoria | Documento / Auditoria |
| RF-053 | Documental | El sistema debe implementar RBAC sobre todas las acciones documentales (visual... | CU-18 | Documento / Auditoria | Documento / Auditoria |
| RF-054 | Documental | El sistema debe permitir organizar documentos en estructuras jerárquicas de ca... | CU-18 | Documento / Auditoria | Documento / Auditoria |
| RF-055 | Auditoría | El sistema debe registrar automáticamente todos los eventos relevantes: operac... | CU-19 | Auditoria / Usuario | Auditoria / Usuario |
| RF-056 | Auditoría | Los registros de auditoría deben ser técnicamente inmutables, sin posibilidad ... | CU-19 | Auditoria / Usuario | Auditoria / Usuario |
| RF-057 | Auditoría | El sistema debe permitir consultar registros de auditoría con filtros por usua... | CU-19 | Auditoria / Usuario | Auditoria / Usuario |
| RF-058 | Auditoría | El sistema debe identificar y resaltar eventos críticos de seguridad (accesos ... | CU-19 | Auditoria / Usuario | Auditoria / Usuario |
| RF-059 | Novedades | El sistema debe permitir registrar novedades operativas mediante formulario co... | CU-13 | NovedadOperativa / Servicio / Ambulancia | NovedadOperativa / Servicio / Ambulancia |
| RF-060 | Novedades | El sistema debe permitir asignar uno o varios responsables para la gestión de ... | CU-13 | NovedadOperativa / Servicio / Ambulancia | NovedadOperativa / Servicio / Ambulancia |
| RF-061 | Novedades | El sistema debe resaltar automáticamente incidentes críticos en el panel, esta... | CU-13 | NovedadOperativa / Servicio / Ambulancia | NovedadOperativa / Servicio / Ambulancia |
| RF-062 | Novedades | El sistema debe permitir adjuntar evidencia multimedia (imágenes, documentos, ... | CU-13 | NovedadOperativa / Servicio / Ambulancia | NovedadOperativa / Servicio / Ambulancia |
| RF-063 | Novedades | El sistema debe generar reportes de novedades con filtros por tipo, frecuencia... | CU-13 | NovedadOperativa / Servicio / Ambulancia | NovedadOperativa / Servicio / Ambulancia |
| RF-064 | Reportes | El sistema debe permitir generar reportes operativos personalizados con filtro... | CU-20 | Servicio / Factura / NovedadOperativa / Pqrs | Servicio / Factura / NovedadOperativa / Pqrs |
| RF-065 | Reportes | El sistema debe generar indicadores clave de desempeño (KPI): tiempo promedio ... | CU-20 | Servicio / Factura / NovedadOperativa / Pqrs | Servicio / Factura / NovedadOperativa / Pqrs |
