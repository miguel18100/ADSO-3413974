# A7 – Matriz Integral de Trazabilidad Arquitectura–Requisitos – SIGMAVITAL

**Cobertura verificada:** **65 / 65 Requisitos Funcionales (100,0 %)** · **0 clases huérfanas en A2** · **0 componentes huérfanos en A5**

| Código RF | Módulo | Requisito funcional | Clase(s) A2 | Componente A5 | Capas A4 | Nodos A6 |
|---|---|---|---|---|---|---|
| RF-001 | Autenticación | El sistema debe permitir al administrador registrar usuarios mediante un... | Usuario, Rol, Auditoria | Seguridad, Usuarios y RBAC | Capas 1–4 | Nodos 1–3 |
| RF-002 | Autenticación | El sistema debe autenticar usuarios mediante correo y contraseña, genera... | Usuario, Rol, Auditoria | Seguridad, Usuarios y RBAC | Capas 1–4 | Nodos 1–3 |
| RF-003 | Autenticación | El sistema debe cerrar automáticamente la sesión tras 15 minutos de inac... | Usuario, Rol, Auditoria | Seguridad, Usuarios y RBAC | Capas 1–4 | Nodos 1–3 |
| RF-004 | Autenticación | El sistema debe permitir la recuperación de contraseña mediante un enlac... | Usuario, Rol, Auditoria | Seguridad, Usuarios y RBAC | Capas 1–4 | Nodos 1–3 |
| RF-005 | Autenticación | El sistema debe implementar control de acceso basado en roles (RBAC), re... | Usuario, Rol, Auditoria | Seguridad, Usuarios y RBAC | Capas 1–4 | Nodos 1–3 |
| RF-006 | Autenticación | El sistema debe permitir al administrador asignar y modificar roles de u... | Usuario, Rol, Auditoria | Seguridad, Usuarios y RBAC | Capas 1–4 | Nodos 1–3 |
| RF-007 | Autenticación | El sistema debe registrar todos los intentos de autenticación fallidos y... | Usuario, Rol, Auditoria | Seguridad, Usuarios y RBAC | Capas 1–4 | Nodos 1–3 |
| RF-008 | Ambulancias | El sistema debe permitir el registro completo de ambulancias, incluyendo... | PropietarioUnidad, Ambulancia, AmbulanciaTAB/TAM, MantenimientoUnidad | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-009 | Ambulancias | El sistema debe permitir actualizar el estado operativo de cada ambulanc... | PropietarioUnidad, Ambulancia, AmbulanciaTAB/TAM, MantenimientoUnidad | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-010 | Ambulancias | El sistema debe permitir consultar el inventario de ambulancias con filt... | PropietarioUnidad, Ambulancia, AmbulanciaTAB/TAM, MantenimientoUnidad | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-011 | Ambulancias | El sistema debe registrar y controlar la documentación obligatoria de ca... | PropietarioUnidad, Ambulancia, AmbulanciaTAB/TAM, MantenimientoUnidad | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-012 | Ambulancias | El sistema debe registrar el historial de mantenimientos preventivos y c... | PropietarioUnidad, Ambulancia, AmbulanciaTAB/TAM, MantenimientoUnidad | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-013 | Ambulancias | El sistema debe registrar y gestionar el inventario de equipos y dotació... | PropietarioUnidad, Ambulancia, AmbulanciaTAB/TAM, MantenimientoUnidad | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-014 | Personal | El sistema debe registrar el personal médico y operativo (paramédicos, c... | Personal, AsignacionPersonal | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-015 | Personal | El sistema debe controlar la disponibilidad del personal en tiempo real,... | Personal, AsignacionPersonal | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-016 | Personal | El sistema debe registrar vencimientos de certificaciones y habilitacion... | Personal, AsignacionPersonal | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-017 | Personal | El sistema debe permitir consultar el historial de servicios de emergenc... | Personal, AsignacionPersonal | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-018 | Pacientes | El sistema debe registrar pacientes atendidos con datos de identificació... | Paciente, Servicio | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-019 | Pacientes | El sistema debe registrar el estado clínico inicial del paciente al mome... | Paciente, Servicio | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-020 | Pacientes | El sistema debe permitir consultar el historial de servicios asociados a... | Paciente, Servicio | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-021 | Emergencias | El sistema debe permitir registrar solicitudes de servicio capturando: h... | Solicitud, Servicio, Asignacion, EstrategiaAsignacion*, GestionServicioFacade, Intervencion, RegistroCierre | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-022 | Emergencias | El sistema debe ejecutar asignación automática de ambulancias consideran... | Solicitud, Servicio, Asignacion, EstrategiaAsignacion*, GestionServicioFacade, Intervencion, RegistroCierre | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-023 | Emergencias | El sistema debe permitir la asignación manual de ambulancias por el coor... | Solicitud, Servicio, Asignacion, EstrategiaAsignacion*, GestionServicioFacade, Intervencion, RegistroCierre | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-024 | Emergencias | El sistema debe gestionar el ciclo completo del servicio mediante los es... | Solicitud, Servicio, Asignacion, EstrategiaAsignacion*, GestionServicioFacade, Intervencion, RegistroCierre | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-025 | Emergencias | El sistema debe permitir el cierre formal del servicio únicamente cuando... | Solicitud, Servicio, Asignacion, EstrategiaAsignacion*, GestionServicioFacade, Intervencion, RegistroCierre | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-026 | Emergencias | El sistema debe permitir la cancelación de un servicio con justificación... | Solicitud, Servicio, Asignacion, EstrategiaAsignacion*, GestionServicioFacade, Intervencion, RegistroCierre | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-027 | Emergencias | El sistema debe permitir consultar el historial completo de servicios co... | Solicitud, Servicio, Asignacion, EstrategiaAsignacion*, GestionServicioFacade, Intervencion, RegistroCierre | Emergencias, Pacientes y Monitoreo | Capas 1–4 | Nodos 1–3 |
| RF-028 | Monitoreo | El sistema debe proporcionar un panel de control centralizado con actual... | Ambulancia, Servicio, NovedadOperativa | Emergencias, Pacientes y Monitoreo | Capas 1–3 | Nodos 1–2 |
| RF-029 | Monitoreo | El sistema debe mostrar en el panel principal indicadores clave: número ... | Ambulancia, Servicio, NovedadOperativa | Emergencias, Pacientes y Monitoreo | Capas 1–3 | Nodos 1–2 |
| RF-030 | Financiero | El sistema debe permitir registrar ingresos con detalle de fecha, valor,... | Factura, NotaContable, MovimientoFinanciero | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-031 | Financiero | El sistema debe generar facturas automáticamente al cierre de un servici... | Factura, NotaContable, MovimientoFinanciero | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-032 | Financiero | El sistema debe gestionar cartera de usuarios o entidades con deudas act... | Factura, NotaContable, MovimientoFinanciero | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-033 | Financiero | El sistema debe generar reportes financieros periódicos (diario, mensual... | Factura, NotaContable, MovimientoFinanciero | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-034 | Financiero | El sistema debe generar recibos de pago en PDF al registrar un pago, ide... | Factura, NotaContable, MovimientoFinanciero | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-035 | Financiero | El sistema debe permitir la consulta del estado de cuenta por usuarios o... | Factura, NotaContable, MovimientoFinanciero | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-036 | Visitantes | El sistema debe registrar el ingreso y salida de visitantes capturando: ... | Visitante, Usuario | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–3 |
| RF-037 | Visitantes | El sistema debe verificar la identidad del visitante, registrar opcional... | Visitante, Usuario | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–3 |
| RF-038 | Visitantes | El sistema debe permitir a usuarios internos registrar pre-autorizacione... | Visitante, Usuario | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–3 |
| RF-039 | Visitantes | El sistema debe mantener historial completo de visitas con filtros por f... | Visitante, Usuario | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–3 |
| RF-040 | PQRS | El sistema debe permitir registrar PQRS mediante formulario estructurado... | Pqrs, Usuario, Paciente | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-041 | PQRS | El sistema debe asignar automáticamente o manualmente cada PQRS al funci... | Pqrs, Usuario, Paciente | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-042 | PQRS | El sistema debe permitir consultar el estado de una PQRS mediante el cód... | Pqrs, Usuario, Paciente | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-043 | PQRS | El sistema debe permitir registrar y enviar la respuesta formal a cada P... | Pqrs, Usuario, Paciente | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-044 | PQRS | El sistema debe mantener historial completo e inalterable de cada PQRS c... | Pqrs, Usuario, Paciente | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-045 | Unidades | El sistema debe permitir registrar propietarios de unidades de ambulanci... | PropietarioUnidad, Ambulancia, Auditoria | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-046 | Unidades | El sistema debe controlar el estado operativo y contractual de cada unid... | PropietarioUnidad, Ambulancia, Auditoria | Flota, Propietarios y Personal | Capas 2–4 | Nodos 2–3 |
| RF-047 | Proveedores | El sistema debe registrar proveedores (razón social, NIT, representante ... | Proveedor, ContratoProveedor, MantenimientoUnidad | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-048 | Proveedores | El sistema debe impedir la vinculación de contratos vencidos a nuevas ór... | Proveedor, ContratoProveedor, MantenimientoUnidad | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-049 | Proveedores | El sistema debe permitir registrar evaluaciones de desempeño de proveedo... | Proveedor, ContratoProveedor, MantenimientoUnidad | Financiero y Proveedores | Capas 2–4 | Nodos 2–4 |
| RF-050 | Documental | El sistema debe permitir la carga de documentos en formatos PDF, DOCX, X... | Documento, Auditoria | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-051 | Documental | El sistema debe implementar versionamiento automático al actualizar un d... | Documento, Auditoria | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-052 | Documental | El sistema debe permitir búsqueda avanzada por nombre, tipo, fecha, cate... | Documento, Auditoria | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-053 | Documental | El sistema debe implementar RBAC sobre todas las acciones documentales (... | Documento, Auditoria | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-054 | Documental | El sistema debe permitir organizar documentos en estructuras jerárquicas... | Documento, Auditoria | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-055 | Auditoría | El sistema debe registrar automáticamente todos los eventos relevantes: ... | Auditoria, IRepositorioDatos | Motor Transversal de Auditoría Inmutable | Capas 2–4 | Nodos 2–3 |
| RF-056 | Auditoría | Los registros de auditoría deben ser técnicamente inmutables, sin posibi... | Auditoria, IRepositorioDatos | Motor Transversal de Auditoría Inmutable | Capas 2–4 | Nodos 2–3 |
| RF-057 | Auditoría | El sistema debe permitir consultar registros de auditoría con filtros po... | Auditoria, IRepositorioDatos | Motor Transversal de Auditoría Inmutable | Capas 2–4 | Nodos 2–3 |
| RF-058 | Auditoría | El sistema debe identificar y resaltar eventos críticos de seguridad (ac... | Auditoria, IRepositorioDatos | Motor Transversal de Auditoría Inmutable | Capas 2–4 | Nodos 2–3 |
| RF-059 | Novedades | El sistema debe permitir registrar novedades operativas mediante formula... | NovedadOperativa, Servicio, Ambulancia | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-060 | Novedades | El sistema debe permitir asignar uno o varios responsables para la gesti... | NovedadOperativa, Servicio, Ambulancia | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-061 | Novedades | El sistema debe resaltar automáticamente incidentes críticos en el panel... | NovedadOperativa, Servicio, Ambulancia | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-062 | Novedades | El sistema debe permitir adjuntar evidencia multimedia (imágenes, docume... | NovedadOperativa, Servicio, Ambulancia | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-063 | Novedades | El sistema debe generar reportes de novedades con filtros por tipo, frec... | NovedadOperativa, Servicio, Ambulancia | Visitantes, PQRS, Docs y Novedades | Capas 1–4 | Nodos 1–4 |
| RF-064 | Reportes | El sistema debe permitir generar reportes operativos personalizados con ... | ServicioReportesKPI, Factura, Servicio, Pqrs | Reportes Operativos e Indicadores KPI | Capas 2–4 | Nodos 2–4 |
| RF-065 | Reportes | El sistema debe generar indicadores clave de desempeño (KPI): tiempo pro... | ServicioReportesKPI, Factura, Servicio, Pqrs | Reportes Operativos e Indicadores KPI | Capas 2–4 | Nodos 2–4 |
