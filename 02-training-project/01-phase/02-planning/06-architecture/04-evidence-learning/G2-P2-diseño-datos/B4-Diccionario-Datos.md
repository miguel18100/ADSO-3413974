# B4 – Diccionario de Datos Físico (100 % Sincronizado con B5 DDL) – SIGMAVITAL

**Motor objetivo:** MySQL 8.0 / MariaDB 10.4+ (motor transaccional `InnoDB`, cotejamiento `utf8mb4_unicode_ci`)  
**Convención estándar:** Tablas en `PascalCase`, columnas en `snake_case`, claves primarias enteras `INT/BIGINT AUTO_INCREMENT` (excepto entidad débil `HistorialEstadoServicio` con PK compuesta `(id_servicio, secuencia)`).  
**Total de tablas documentadas:** **25 / 25 (100 % paridad con B5-Creacion-Base-Datos.sql)**

---

## Índice de tablas y dominio cubierto

1. [`Rol`](#tabla-1-rol) (3 columnas · `RF-005, RF-006`)
2. [`Usuario`](#tabla-2-usuario) (10 columnas · `RF-001..007, RNF-001/005, RN-008/009`)
3. [`PropietarioUnidad`](#tabla-3-propietariounidad) (6 columnas · `RF-045, RF-046`)
4. [`Ambulancia`](#tabla-4-ambulancia) (15 columnas · `RF-008..013, RF-045/046, RN-001/003`)
5. [`Proveedor`](#tabla-5-proveedor) (7 columnas · `RF-047..049`)
6. [`MantenimientoUnidad`](#tabla-6-mantenimientounidad) (7 columnas · `RF-012`)
7. [`ContratoProveedor`](#tabla-7-contratoproveedor) (11 columnas · `RF-047..049, RN-012`)
8. [`Personal`](#tabla-8-personal) (8 columnas · `RF-014..017, RN-004`)
9. [`Paciente`](#tabla-9-paciente) (8 columnas · `RF-018..020, RNF-004`)
10. [`PacienteTelefono`](#tabla-10-pacientetelefono) (4 columnas · `RF-018 (Normalización 1FN)`)
11. [`Solicitud`](#tabla-11-solicitud) (10 columnas · `RF-021, RN-002`)
12. [`Servicio`](#tabla-12-servicio) (9 columnas · `RF-024..027, RN-005/006`)
13. [`HistorialEstadoServicio`](#tabla-13-historialestadoservicio) (7 columnas · `RF-024, RF-026, RNF-028`)
14. [`Asignacion`](#tabla-14-asignacion) (8 columnas · `RF-022, RF-023, RN-007`)
15. [`AsignacionPersonal`](#tabla-15-asignacionpersonal) (5 columnas · `RF-014, RF-022`)
16. [`Intervencion`](#tabla-16-intervencion) (6 columnas · `RF-019`)
17. [`RegistroCierre`](#tabla-17-registrocierre) (9 columnas · `RF-025, RN-005`)
18. [`Factura`](#tabla-18-factura) (11 columnas · `RF-031..035, RN-014/015`)
19. [`NotaContable`](#tabla-19-notacontable) (7 columnas · `RF-031, RN-014`)
20. [`MovimientoFinanciero`](#tabla-20-movimientofinanciero) (9 columnas · `RF-030, RF-033, RF-034`)
21. [`Visitante`](#tabla-21-visitante) (11 columnas · `RF-036..039, RN-017`)
22. [`Pqrs`](#tabla-22-pqrs) (10 columnas · `RF-040..044, RN-011`)
23. [`Documento`](#tabla-23-documento) (10 columnas · `RF-050..054, RN-013`)
24. [`NovedadOperativa`](#tabla-24-novedadoperativa) (10 columnas · `RF-059..063, RN-016`)
25. [`Auditoria`](#tabla-25-auditoria) (10 columnas · `RF-055..058, RN-010, RNF-028`)

---

## Tabla 1: `Rol`

**Descripción:** Perfiles de autorización RBAC del sistema.  
**Trazabilidad SRS:** `RF-005, RF-006`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_rol` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único del rol |
| `nombre` | `VARCHAR(40)` | `NOT NULL` | `UNIQUE` | Nombre del rol (Administrador, Coordinador, Paramedico, Conductor, Vigilante, Usuario) |
| `descripcion` | `VARCHAR(180)` | `NOT NULL` | `—` | Descripción funcional de privilegios |

## Tabla 2: `Usuario`

**Descripción:** Cuentas autenticables del sistema con control de hash seguro y bloqueo por intentos fallidos.  
**Trazabilidad SRS:** `RF-001..007, RNF-001/005, RN-008/009`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_usuario` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único de cuenta |
| `id_rol` | `INT` | `NOT NULL` | `FK -> Rol(id_rol)` | Rol principal asignado |
| `nombre` | `VARCHAR(120)` | `NOT NULL` | `—` | Nombre completo del usuario |
| `correo` | `VARCHAR(150)` | `NOT NULL` | `UNIQUE` | Correo electrónico institucional único |
| `password_hash` | `VARCHAR(255)` | `NOT NULL` | `—` | Hash Argon2id/Bcrypt con salt único (prohibido texto plano) |
| `estado` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Activo'` | `CHECK` | Estado de cuenta (Activo, Inactivo, Bloqueado, Eliminado) |
| `intentos_fallidos` | `INT` | `NOT NULL DEFAULT 0` | `CHECK >= 0` | Contador consecutivo de fallos de acceso (RN-009) |
| `bloqueado_hasta` | `DATETIME` | `NULL` | `—` | Marca temporal de desbloqueo tras 5 intentos fallidos |
| `fecha_expiracion_clave` | `DATE` | `NOT NULL` | `—` | Fecha límite de vigencia 90 días (RN-008) |
| `fecha_creacion` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Fecha de alta del usuario |

## Tabla 3: `PropietarioUnidad`

**Descripción:** Propietarios vinculados contractualmente a las ambulancias.  
**Trazabilidad SRS:** `RF-045, RF-046`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_propietario` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único de propietario |
| `identificacion` | `VARCHAR(35)` | `NOT NULL` | `UNIQUE` | Cédula o NIT del propietario |
| `nombre_razon_social` | `VARCHAR(150)` | `NOT NULL` | `—` | Nombre completo o razón social |
| `tipo_vinculacion` | `VARCHAR(50)` | `NOT NULL` | `CHECK` | Modalidad (Propio, Afiliado, Convenio) |
| `telefono` | `VARCHAR(25)` | `NOT NULL` | `—` | Teléfono principal de contacto |
| `estado` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Activo'` | `CHECK` | Estado (Activo, Inactivo) |

## Tabla 4: `Ambulancia`

**Descripción:** Flota de ambulancias TAB y TAM con control documental REPS.  
**Trazabilidad SRS:** `RF-008..013, RF-045/046, RN-001/003`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_ambulancia` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador de unidad |
| `id_propietario` | `INT` | `NOT NULL` | `FK -> PropietarioUnidad` | Propietario activo responsable |
| `numero_unidad` | `VARCHAR(25)` | `NOT NULL` | `UNIQUE` | Código interno de móvil (ej. AMB-01) |
| `placa` | `VARCHAR(15)` | `NOT NULL` | `UNIQUE` | Placa vehicular única |
| `tipo` | `VARCHAR(10)` | `NOT NULL` | `CHECK (TAB/TAM)` | Categoría asistencial REPS |
| `marca` | `VARCHAR(60)` | `NOT NULL` | `—` | Marca del vehículo |
| `modelo` | `VARCHAR(60)` | `NOT NULL` | `—` | Referencia / línea |
| `anio` | `SMALLINT` | `NOT NULL` | `CHECK >= 2000` | Año de fabricación |
| `num_habilitacion_reps` | `VARCHAR(45)` | `NOT NULL` | `UNIQUE` | Código de habilitación REPS Res. 3100 |
| `dotacion_reps_valida` | `TINYINT(1)` | `NOT NULL DEFAULT 1` | `CHECK (0/1)` | Cumplimiento mínimo equipos TAB/TAM |
| `vigencia_soat` | `DATE` | `NOT NULL` | `—` | Fecha vencimiento SOAT |
| `vigencia_tecnomecanica` | `DATE` | `NOT NULL` | `—` | Fecha vencimiento técnico-mecánica |
| `estado_operativo` | `VARCHAR(25)` | `NOT NULL DEFAULT 'Disponible'` | `CHECK` | Estado operativo real (Disponible, En servicio, En mantenimiento, Fuera de servicio) |
| `estado_contractual` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Activa'` | `CHECK` | Estado contractual (Activa, Suspendida, Retirada) |
| `ubicacion_referencia` | `VARCHAR(160)` | `NULL` | `—` | Ubicación operativa de referencia |

## Tabla 5: `Proveedor`

**Descripción:** Proveedores registrados para mantenimientos, dotación e insumos.  
**Trazabilidad SRS:** `RF-047..049`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_proveedor` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único del proveedor |
| `nit` | `VARCHAR(30)` | `NOT NULL` | `UNIQUE` | NIT tributario del proveedor |
| `razon_social` | `VARCHAR(160)` | `NOT NULL` | `—` | Razón social oficial |
| `representante_legal` | `VARCHAR(120)` | `NOT NULL` | `—` | Nombre representante legal |
| `contacto` | `VARCHAR(100)` | `NOT NULL` | `—` | Teléfono o correo comercial |
| `tipo_servicio` | `VARCHAR(80)` | `NOT NULL` | `—` | Categoría suministrada |
| `estado` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Activo'` | `CHECK` | Estado (Activo, Inactivo) |

## Tabla 6: `MantenimientoUnidad`

**Descripción:** Historial preventivo y correctivo por ambulancia.  
**Trazabilidad SRS:** `RF-012`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_mantenimiento` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador del mantenimiento |
| `id_ambulancia` | `INT` | `NOT NULL` | `FK -> Ambulancia` | Ambulancia intervenida |
| `id_proveedor` | `INT` | `NULL` | `FK -> Proveedor` | Proveedor ejecutor del servicio |
| `tipo` | `VARCHAR(20)` | `NOT NULL` | `CHECK` | Tipo (Preventivo, Correctivo) |
| `fecha` | `DATE` | `NOT NULL` | `—` | Fecha del mantenimiento |
| `costo` | `DECIMAL(12,2)` | `NOT NULL` | `CHECK >= 0` | Valor total del servicio |
| `descripcion` | `VARCHAR(250)` | `NOT NULL` | `—` | Detalle de trabajos efectuados |

## Tabla 7: `ContratoProveedor`

**Descripción:** Contratos asociados a proveedores con vigencia y evaluación.  
**Trazabilidad SRS:** `RF-047..049, RN-012`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_contrato` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador del contrato |
| `id_proveedor` | `INT` | `NOT NULL` | `FK -> Proveedor` | Proveedor contratado |
| `id_usuario_responsable` | `INT` | `NOT NULL` | `FK -> Usuario` | Usuario interno supervisor |
| `numero_contrato` | `VARCHAR(50)` | `NOT NULL` | `UNIQUE` | Número consecutivo contractual |
| `objeto` | `VARCHAR(250)` | `NOT NULL` | `—` | Objeto contractual resumido |
| `fecha_inicio` | `DATE` | `NOT NULL` | `—` | Fecha inicio de vigencia |
| `fecha_fin` | `DATE` | `NOT NULL` | `CHECK >= inicio` | Fecha fin de vigencia (alertas 30/15/5 d) |
| `valor` | `DECIMAL(14,2)` | `NOT NULL` | `CHECK > 0` | Valor del contrato |
| `estado` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Vigente'` | `CHECK` | Estado (Vigente, Vencido, Terminado) |
| `calificacion_desempeno` | `TINYINT` | `NULL` | `CHECK 1..5` | Evaluación de cumplimiento (1 a 5) |
| `observaciones_evaluacion` | `VARCHAR(250)` | `NULL` | `—` | Comentarios de evaluación |

## Tabla 8: `Personal`

**Descripción:** Talento humano prehospitalario habilitado.  
**Trazabilidad SRS:** `RF-014..017, RN-004`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_personal` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador del integrante |
| `documento` | `VARCHAR(30)` | `NOT NULL` | `UNIQUE` | Documento de identidad |
| `nombre` | `VARCHAR(120)` | `NOT NULL` | `—` | Nombre completo |
| `perfil_operativo` | `VARCHAR(30)` | `NOT NULL` | `CHECK` | Perfil (Paramedico, Conductor, Auxiliar, Medico) |
| `tarjeta_profesional` | `VARCHAR(45)` | `NOT NULL` | `UNIQUE` | Tarjeta o registro profesional vigente |
| `vigencia_certificacion` | `DATE` | `NOT NULL` | `—` | Vencimiento certificación BLS/ACLS |
| `horas_turno_continuas` | `DECIMAL(4,1)` | `NOT NULL DEFAULT 0.0` | `CHECK >= 0` | Horas trabajadas en turno activo |
| `estado_disponibilidad` | `VARCHAR(25)` | `NOT NULL DEFAULT 'Disponible'` | `CHECK` | Estado (Disponible, En servicio, En descanso, Incapacitado) |

## Tabla 9: `Paciente`

**Descripción:** Identificación clínica básica de pacientes atendidos.  
**Trazabilidad SRS:** `RF-018..020, RNF-004`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_paciente` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único del paciente |
| `tipo_documento` | `VARCHAR(10)` | `NOT NULL` | `CHECK` | Tipo (CC, TI, CE, PA, NN) |
| `identificacion` | `VARCHAR(35)` | `NOT NULL` | `UNIQUE` | Número de documento único |
| `nombre_completo` | `VARCHAR(140)` | `NOT NULL` | `—` | Nombre del paciente |
| `fecha_nacimiento` | `DATE` | `NULL` | `—` | Fecha de nacimiento |
| `contacto_emergencia` | `VARCHAR(120)` | `NULL` | `—` | Familiar o acudiente responsable |
| `antecedentes_relevantes` | `VARCHAR(300)` | `NULL` | `—` | Antecedentes clínicos críticos |
| `estado_clinico_inicial` | `VARCHAR(20)` | `NOT NULL` | `CHECK` | Estado inicial (Estable, Critico, Fallecido) |

## Tabla 10: `PacienteTelefono`

**Descripción:** Teléfonos múltiples normalizados en 1FN por paciente.  
**Trazabilidad SRS:** `RF-018 (Normalización 1FN)`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_telefono` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador de teléfono |
| `id_paciente` | `INT` | `NOT NULL` | `FK -> Paciente` | Paciente propietario |
| `telefono` | `VARCHAR(25)` | `NOT NULL` | `UNIQUE(pac,tel)` | Número telefónico |
| `etiqueta` | `VARCHAR(30)` | `NOT NULL DEFAULT 'Principal'` | `—` | Etiqueta (Principal, Familiar, Trabajo) |

## Tabla 11: `Solicitud`

**Descripción:** Registro inicial de solicitudes de servicio y prioridad triage.  
**Trazabilidad SRS:** `RF-021, RN-002`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_solicitud` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único de solicitud |
| `id_usuario_registra` | `INT` | `NOT NULL` | `FK -> Usuario` | Usuario receptor |
| `fecha_hora_solicitud` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Marca temporal de solicitud |
| `direccion_evento` | `VARCHAR(200)` | `NOT NULL` | `—` | Dirección del incidente |
| `coordenadas_gps` | `VARCHAR(60)` | `NULL` | `—` | Latitud/longitud de referencia |
| `tipo_emergencia` | `VARCHAR(80)` | `NOT NULL` | `—` | Categoría del evento |
| `prioridad_clinica` | `VARCHAR(15)` | `NOT NULL` | `CHECK` | Nivel triage (Verde, Amarillo, Naranja, Rojo) |
| `nombre_solicitante` | `VARCHAR(120)` | `NOT NULL` | `—` | Nombre de quien reporta |
| `telefono_solicitante` | `VARCHAR(25)` | `NOT NULL` | `—` | Contacto de quien reporta |
| `estado` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Solicitado'` | `CHECK` | Estado (Solicitado, Asignado, Cancelado, Cerrado) |

## Tabla 12: `Servicio`

**Descripción:** Ciclo operativo completo del servicio prehospitalario.  
**Trazabilidad SRS:** `RF-024..027, RN-005/006`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_servicio` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único del servicio |
| `id_solicitud` | `INT` | `NOT NULL` | `FK -> Solicitud UK` | Solicitud que origina el servicio |
| `id_paciente` | `INT` | `NOT NULL` | `FK -> Paciente` | Paciente atendido |
| `fecha_hora_inicio` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Inicio operativo del servicio |
| `fecha_hora_cierre` | `DATETIME` | `NULL` | `—` | Cierre o cancelación definitiva |
| `estado` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Solicitado'` | `CHECK` | Estado ciclo (Solicitado, Asignado, En ruta, En atencion, Traslado, Finalizado, Cancelado) |
| `estado_paciente_final` | `VARCHAR(20)` | `NULL` | `CHECK` | Condición final (Estable, Critico, Fallecido) |
| `destino_traslado` | `VARCHAR(180)` | `NULL` | `—` | IPS receptora o destino final |
| `observaciones` | `VARCHAR(300)` | `NULL` | `—` | Observaciones generales |

## Tabla 13: `HistorialEstadoServicio`

**Descripción:** Entidad débil identificadora con traza cronológica de transiciones de estado.  
**Trazabilidad SRS:** `RF-024, RF-026, RNF-028`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_servicio` | `INT` | `NOT NULL` | `PK, FK -> Servicio` | Servicio propietario |
| `secuencia` | `INT` | `NOT NULL` | `PK parcial` | Consecutivo por servicio (1, 2, 3...) |
| `id_usuario` | `INT` | `NOT NULL` | `FK -> Usuario` | Usuario que ejecuta la transición |
| `estado_anterior` | `VARCHAR(20)` | `NULL` | `—` | Estado previo |
| `estado_nuevo` | `VARCHAR(20)` | `NOT NULL` | `—` | Nuevo estado asumido |
| `fecha_cambio` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Marca temporal exacta del cambio |
| `motivo` | `VARCHAR(220)` | `NULL` | `—` | Justificación obligatoria si es Cancelado |

## Tabla 14: `Asignacion`

**Descripción:** Despacho de ambulancia asociado a un servicio con trazabilidad de asignación manual.  
**Trazabilidad SRS:** `RF-022, RF-023, RN-007`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_asignacion` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único de asignación |
| `id_servicio` | `INT` | `NOT NULL` | `FK -> Servicio` | Servicio atendido |
| `id_ambulancia` | `INT` | `NOT NULL` | `FK -> Ambulancia` | Ambulancia despachada |
| `fecha_hora_asignacion` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Instante del despacho |
| `criterio` | `VARCHAR(80)` | `NOT NULL` | `—` | Criterio aplicado (Urgente / General) |
| `asignacion_manual` | `TINYINT(1)` | `NOT NULL DEFAULT 0` | `CHECK (0/1)` | 1 si el coordinador anuló la sugerencia automática |
| `motivo_asignacion_manual` | `VARCHAR(250)` | `NULL` | `CHECK RN-007` | Motivo obligatorio cuando asignacion_manual = 1 |
| `estado` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Activa'` | `CHECK` | Estado (Activa, Reasignada, Finalizada, Cancelada) |

## Tabla 15: `AsignacionPersonal`

**Descripción:** Tabla asociativa N:M que vincula tripulación sin duplicar persona en la misma asignación.  
**Trazabilidad SRS:** `RF-014, RF-022`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_asignacion_personal` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único de vínculo |
| `id_asignacion` | `INT` | `NOT NULL` | `FK -> Asignacion` | Asignación asociada |
| `id_personal` | `INT` | `NOT NULL` | `FK -> Personal` | Integrante de tripulación |
| `funcion` | `VARCHAR(40)` | `NOT NULL` | `—` | Rol desempeñado en el traslado |
| `fecha_hora_vinculacion` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Marca temporal de asignación |

## Tabla 16: `Intervencion`

**Descripción:** Actuaciones clínicas ejecutadas durante el servicio prehospitalario.  
**Trazabilidad SRS:** `RF-019`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_intervencion` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador de actuación |
| `id_servicio` | `INT` | `NOT NULL` | `FK -> Servicio` | Servicio en curso |
| `id_personal` | `INT` | `NOT NULL` | `FK -> Personal` | Responsable clínico de la intervención |
| `fecha_hora` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Momento de registro |
| `tipo_intervencion` | `VARCHAR(80)` | `NOT NULL` | `—` | Categoría procedimental |
| `descripcion` | `VARCHAR(350)` | `NOT NULL` | `—` | Detalle clínico registrado |

## Tabla 17: `RegistroCierre`

**Descripción:** Cierre formal REPS del servicio con validación física de los 4 campos obligatorios.  
**Trazabilidad SRS:** `RF-025, RN-005`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_cierre` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único del cierre |
| `id_servicio` | `INT` | `NOT NULL` | `FK -> Servicio UK` | Servicio cerrado (relación 1:1) |
| `id_usuario` | `INT` | `NOT NULL` | `FK -> Usuario` | Usuario que consolida el cierre |
| `fecha_hora_cierre` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Fecha y hora oficial de cierre |
| `resultado_atencion` | `VARCHAR(200)` | `NOT NULL` | `CHECK RN-005` | Resultado obligatorio de la atención |
| `estado_paciente_final` | `VARCHAR(20)` | `NOT NULL` | `CHECK` | Estado final (Estable, Critico, Fallecido) |
| `destino_traslado` | `VARCHAR(180)` | `NOT NULL` | `CHECK RN-005` | Institución receptora o destino |
| `responsable_atencion` | `VARCHAR(120)` | `NOT NULL` | `CHECK RN-005` | Profesional responsable de la atención |
| `observaciones_finales` | `VARCHAR(300)` | `NULL` | `—` | Notas adicionales de entrega |

## Tabla 18: `Factura`

**Descripción:** Facturación automática e inmutable emitida al cierre de servicios.  
**Trazabilidad SRS:** `RF-031..035, RN-014/015`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_factura` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador de factura |
| `id_servicio` | `INT` | `NOT NULL` | `FK -> Servicio UK` | Servicio facturado |
| `numero_factura` | `VARCHAR(40)` | `NOT NULL` | `UNIQUE` | Consecutivo único de facturación |
| `entidad_pagadora` | `VARCHAR(150)` | `NOT NULL` | `—` | EPS, aseguradora o particular responsable |
| `valor_total` | `DECIMAL(12,2)` | `NOT NULL` | `CHECK > 0` | Valor total liquidado |
| `fecha_emision` | `DATE` | `NOT NULL` | `—` | Fecha de emisión automática |
| `fecha_vencimiento` | `DATE` | `NOT NULL` | `CHECK >= emision` | Fecha límite de pago |
| `dias_mora` | `INT` | `NOT NULL DEFAULT 0` | `CHECK >= 0` | Días vencidos desde día 1 (RN-015) |
| `es_moroso` | `TINYINT(1)` | `NOT NULL DEFAULT 0` | `CHECK (0/1)` | 1 si supera 30 días de mora |
| `estado_pago` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Pendiente'` | `CHECK` | Estado (Pendiente, Pagada, En mora) |
| `es_inmutable` | `TINYINT(1)` | `NOT NULL DEFAULT 1` | `CHECK (= 1)` | Garantía de inmutabilidad tras emisión (RN-014) |

## Tabla 19: `NotaContable`

**Descripción:** Notas crédito o débito vinculadas para ajustar facturas inmutables.  
**Trazabilidad SRS:** `RF-031, RN-014`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_nota` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único de nota |
| `id_factura` | `INT` | `NOT NULL` | `FK -> Factura` | Factura afectada |
| `id_usuario` | `INT` | `NOT NULL` | `FK -> Usuario` | Responsable contable |
| `tipo_nota` | `VARCHAR(15)` | `NOT NULL` | `CHECK` | Tipo (Credito, Debito) |
| `valor_ajuste` | `DECIMAL(12,2)` | `NOT NULL` | `CHECK > 0` | Monto del ajuste |
| `motivo` | `VARCHAR(250)` | `NOT NULL` | `CHECK no vacío` | Justificación contable obligatoria |
| `fecha_emision` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Fecha de emisión |

## Tabla 20: `MovimientoFinanciero`

**Descripción:** Registro inalterable de ingresos y egresos con soporte.  
**Trazabilidad SRS:** `RF-030, RF-033, RF-034`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_movimiento` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador del movimiento |
| `id_factura` | `INT` | `NULL` | `FK -> Factura` | Factura pagada (si es Ingreso) |
| `id_proveedor` | `INT` | `NULL` | `FK -> Proveedor` | Proveedor receptor (si es Egreso) |
| `id_usuario` | `INT` | `NOT NULL` | `FK -> Usuario` | Usuario registrador |
| `tipo` | `VARCHAR(15)` | `NOT NULL` | `CHECK` | Tipo (Ingreso, Egreso) |
| `concepto` | `VARCHAR(180)` | `NOT NULL` | `—` | Descripción financiera |
| `monto` | `DECIMAL(12,2)` | `NOT NULL` | `CHECK > 0` | Valor de la operación |
| `soporte_ref` | `VARCHAR(220)` | `NOT NULL` | `—` | Ruta/código de recibo PDF o soporte |
| `fecha_movimiento` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Fecha y hora de registro |

## Tabla 21: `Visitante`

**Descripción:** Control de accesos, preautorizaciones e ingresos manuales justificados.  
**Trazabilidad SRS:** `RF-036..039, RN-017`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_visitante` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador de visita |
| `id_usuario_autoriza` | `INT` | `NULL` | `FK -> Usuario` | Usuario interno autorizante o vigilante |
| `tipo_documento` | `VARCHAR(10)` | `NOT NULL` | `—` | Tipo documento del visitante |
| `documento` | `VARCHAR(35)` | `NOT NULL` | `—` | Número de identificación |
| `nombre_completo` | `VARCHAR(130)` | `NOT NULL` | `—` | Nombre completo |
| `area_visitada` | `VARCHAR(100)` | `NOT NULL` | `—` | Área o persona visitada |
| `es_preautorizado` | `TINYINT(1)` | `NOT NULL DEFAULT 0` | `CHECK (0/1)` | 1 si cuenta con preautorización previa |
| `justificacion_manual` | `VARCHAR(240)` | `NULL` | `CHECK RN-017` | Obligatoria si es_preautorizado = 0 |
| `placa_vehiculo` | `VARCHAR(15)` | `NULL` | `—` | Placa si ingresa en vehículo |
| `hora_ingreso` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Registro de entrada |
| `hora_salida` | `DATETIME` | `NULL` | `—` | Registro de salida |

## Tabla 22: `Pqrs`

**Descripción:** Radicación ciudadana, control de plazo de asignación 24 h y cierre formal.  
**Trazabilidad SRS:** `RF-040..044, RN-011`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_pqrs` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único de PQRS |
| `id_paciente` | `INT` | `NULL` | `FK -> Paciente` | Paciente relacionado si aplica |
| `id_usuario_responsable` | `INT` | `NULL` | `FK -> Usuario` | Funcionario responsable asignado |
| `codigo_radicado` | `VARCHAR(35)` | `NOT NULL` | `UNIQUE` | Código único público de consulta |
| `tipo_pqrs` | `VARCHAR(20)` | `NOT NULL` | `CHECK` | Tipo (Peticion, Queja, Reclamo, Sugerencia, Denuncia) |
| `descripcion` | `VARCHAR(350)` | `NOT NULL` | `—` | Detalle de la solicitud ciudadana |
| `fecha_radicacion` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Fecha y hora de radicación |
| `fecha_limite` | `DATE` | `NOT NULL` | `—` | Plazo máximo legal de respuesta |
| `estado_tramite` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Radicada'` | `CHECK` | Estado (Radicada, En tramite, Respondida, Cerrada) |
| `respuesta_formal` | `VARCHAR(350)` | `NULL` | `CHECK RN-011` | Texto formal antes de pasar a Cerrada |

## Tabla 23: `Documento`

**Descripción:** Repositorio institucional versionado, hash único anti-duplicados y bloqueo oficial.  
**Trazabilidad SRS:** `RF-050..054, RN-013`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_documento` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador de versión documental |
| `id_usuario_carga` | `INT` | `NOT NULL` | `FK -> Usuario` | Autor de la carga |
| `id_doc_origen` | `INT` | `NULL` | `FK -> Documento` | Documento base del historial de versiones |
| `titulo` | `VARCHAR(160)` | `NOT NULL` | `—` | Nombre del documento |
| `categoria` | `VARCHAR(60)` | `NOT NULL` | `—` | Clasificación documental |
| `nivel_confidencialidad` | `VARCHAR(20)` | `NOT NULL` | `CHECK` | Nivel (Publico, Interno, Restringido) |
| `version` | `INT` | `NOT NULL DEFAULT 1` | `CHECK >= 1` | Consecutivo de versión |
| `hash_sha256` | `CHAR(64)` | `NOT NULL` | `UNIQUE` | Huella criptográfica anti-duplicado (RF-051) |
| `es_oficial` | `TINYINT(1)` | `NOT NULL DEFAULT 0` | `CHECK (0/1)` | 1 si está bloqueado contra edición (RN-013) |
| `fecha_carga` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Marca temporal de carga |

## Tabla 24: `NovedadOperativa`

**Descripción:** Incidentes y novedades operativas con resolución obligatoria al cierre.  
**Trazabilidad SRS:** `RF-059..063, RN-016`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_novedad` | `INT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador único de novedad |
| `id_servicio` | `INT` | `NULL` | `FK -> Servicio` | Servicio vinculado si aplica |
| `id_ambulancia` | `INT` | `NULL` | `FK -> Ambulancia` | Unidad involucrada si aplica |
| `id_usuario_reporta` | `INT` | `NOT NULL` | `FK -> Usuario` | Reportante de la novedad |
| `tipo_novedad` | `VARCHAR(60)` | `NOT NULL` | `—` | Clasificación operativa |
| `prioridad` | `VARCHAR(15)` | `NOT NULL` | `CHECK` | Prioridad (Baja, Media, Alta, Critica) |
| `descripcion` | `VARCHAR(350)` | `NOT NULL` | `—` | Detalle del suceso |
| `estado` | `VARCHAR(20)` | `NOT NULL DEFAULT 'Pendiente'` | `CHECK` | Estado (Pendiente, En proceso, Resuelto, Cerrado) |
| `resolucion` | `VARCHAR(300)` | `NULL` | `CHECK RN-016` | Resolución documentada obligatoria al cerrar |
| `fecha_registro` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Instante del reporte |

## Tabla 25: `Auditoria`

**Descripción:** Bitácora inmutable append-only de eventos de seguridad y dominio (retención >= 5 años).  
**Trazabilidad SRS:** `RF-055..058, RN-010, RNF-028`

| Columna | Tipo SQL | Nulabilidad / Default | Clave / Restricción | Descripción |
|---|---|---|---|---|
| `id_auditoria` | `BIGINT` | `NOT NULL AUTO_INCREMENT` | `PK` | Identificador secuencial inalterable |
| `id_usuario` | `INT` | `NULL` | `FK -> Usuario` | Actor de la operación |
| `modulo` | `VARCHAR(60)` | `NOT NULL` | `—` | Módulo origen del evento |
| `accion` | `VARCHAR(40)` | `NOT NULL` | `—` | Tipo de acción o evento crítico |
| `entidad_afectada` | `VARCHAR(60)` | `NOT NULL` | `—` | Tabla afectada |
| `id_entidad` | `INT` | `NULL` | `—` | Identificador del registro afectado |
| `valores_anteriores` | `TEXT` | `NULL` | `—` | Instantánea JSON antes del cambio |
| `valores_nuevos` | `TEXT` | `NULL` | `—` | Instantánea JSON posterior al cambio |
| `ip_origen` | `VARCHAR(45)` | `NOT NULL` | `—` | Dirección IP de origen |
| `fecha_evento` | `DATETIME` | `NOT NULL DEFAULT CURRENT_TIMESTAMP` | `—` | Marca temporal exacta |
