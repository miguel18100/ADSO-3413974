-- =========================================================================
-- SIGMAVITAL (SGA) - Script DDL Fisico Normalizado 3FN (25 Tablas)
-- Motor: MySQL 8.0 / MariaDB 10.4+ (InnoDB / utf8mb4_unicode_ci)
-- Autor: miguel18100 | Cobertura: RF-001..RF-065 y RN-001..RN-018
-- =========================================================================

DROP DATABASE IF EXISTS sigmavital;
CREATE DATABASE sigmavital CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sigmavital;

CREATE TABLE `Rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NOT NULL,
  `descripcion` VARCHAR(180) NOT NULL,
  PRIMARY KEY (`id_rol`),
CONSTRAINT chk_rol_nombre CHECK (CHAR_LENGTH(TRIM(nombre)) > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `id_rol` INT NOT NULL,
  `nombre` VARCHAR(120) NOT NULL,
  `correo` VARCHAR(150) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Activo',
  `intentos_fallidos` INT NOT NULL DEFAULT 0,
  `bloqueado_hasta` DATETIME NULL,
  `fecha_expiracion_clave` DATE NOT NULL,
  `fecha_creacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES Rol(id_rol) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_usuario_estado CHECK (estado IN ('Activo','Inactivo','Bloqueado','Eliminado')),
CONSTRAINT chk_usuario_intentos CHECK (intentos_fallidos >= 0 AND intentos_fallidos <= 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `PropietarioUnidad` (
  `id_propietario` INT NOT NULL AUTO_INCREMENT,
  `identificacion` VARCHAR(35) NOT NULL,
  `nombre_razon_social` VARCHAR(150) NOT NULL,
  `tipo_vinculacion` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id_propietario`),
CONSTRAINT chk_prop_vinc CHECK (tipo_vinculacion IN ('Propio','Afiliado','Convenio')),
CONSTRAINT chk_prop_est CHECK (estado IN ('Activo','Inactivo'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Ambulancia` (
  `id_ambulancia` INT NOT NULL AUTO_INCREMENT,
  `id_propietario` INT NOT NULL,
  `numero_unidad` VARCHAR(25) NOT NULL,
  `placa` VARCHAR(15) NOT NULL,
  `tipo` VARCHAR(10) NOT NULL,
  `marca` VARCHAR(60) NOT NULL,
  `modelo` VARCHAR(60) NOT NULL,
  `anio` SMALLINT NOT NULL,
  `num_habilitacion_reps` VARCHAR(45) NOT NULL,
  `dotacion_reps_valida` TINYINT(1) NOT NULL DEFAULT 1,
  `vigencia_soat` DATE NOT NULL,
  `vigencia_tecnomecanica` DATE NOT NULL,
  `estado_operativo` VARCHAR(25) NOT NULL DEFAULT 'Disponible',
  `estado_contractual` VARCHAR(20) NOT NULL DEFAULT 'Activa',
  `ubicacion_referencia` VARCHAR(160) NULL,
  PRIMARY KEY (`id_ambulancia`),
CONSTRAINT fk_amb_prop FOREIGN KEY (id_propietario) REFERENCES PropietarioUnidad(id_propietario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_amb_tipo CHECK (tipo IN ('TAB','TAM')),
CONSTRAINT chk_amb_anio CHECK (anio >= 2000 AND anio <= 2100),
CONSTRAINT chk_amb_dot CHECK (dotacion_reps_valida IN (0,1)),
CONSTRAINT chk_amb_est_op CHECK (estado_operativo IN ('Disponible','En servicio','En mantenimiento','Fuera de servicio')),
CONSTRAINT chk_amb_est_con CHECK (estado_contractual IN ('Activa','Suspendida','Retirada'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nit` VARCHAR(30) NOT NULL,
  `razon_social` VARCHAR(160) NOT NULL,
  `representante_legal` VARCHAR(120) NOT NULL,
  `contacto` VARCHAR(100) NOT NULL,
  `tipo_servicio` VARCHAR(80) NOT NULL,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id_proveedor`),
CONSTRAINT chk_prov_est CHECK (estado IN ('Activo','Inactivo'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `MantenimientoUnidad` (
  `id_mantenimiento` INT NOT NULL AUTO_INCREMENT,
  `id_ambulancia` INT NOT NULL,
  `id_proveedor` INT NULL,
  `tipo` VARCHAR(20) NOT NULL,
  `fecha` DATE NOT NULL,
  `costo` DECIMAL(12,2) NOT NULL,
  `descripcion` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id_mantenimiento`),
CONSTRAINT fk_mant_amb FOREIGN KEY (id_ambulancia) REFERENCES Ambulancia(id_ambulancia) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_mant_prov FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor) ON UPDATE CASCADE ON DELETE SET NULL,
CONSTRAINT chk_mant_tipo CHECK (tipo IN ('Preventivo','Correctivo')),
CONSTRAINT chk_mant_costo CHECK (costo >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ContratoProveedor` (
  `id_contrato` INT NOT NULL AUTO_INCREMENT,
  `id_proveedor` INT NOT NULL,
  `id_usuario_responsable` INT NOT NULL,
  `numero_contrato` VARCHAR(50) NOT NULL,
  `objeto` VARCHAR(250) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `valor` DECIMAL(14,2) NOT NULL,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Vigente',
  `calificacion_desempeno` TINYINT NULL,
  `observaciones_evaluacion` VARCHAR(250) NULL,
  PRIMARY KEY (`id_contrato`),
CONSTRAINT fk_con_prov FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_con_usr FOREIGN KEY (id_usuario_responsable) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_con_fechas CHECK (fecha_fin >= fecha_inicio),
CONSTRAINT chk_con_valor CHECK (valor > 0),
CONSTRAINT chk_con_est CHECK (estado IN ('Vigente','Vencido','Terminado')),
CONSTRAINT chk_con_cal CHECK (calificacion_desempeno IS NULL OR (calificacion_desempeno BETWEEN 1 AND 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Personal` (
  `id_personal` INT NOT NULL AUTO_INCREMENT,
  `documento` VARCHAR(30) NOT NULL,
  `nombre` VARCHAR(120) NOT NULL,
  `perfil_operativo` VARCHAR(30) NOT NULL,
  `tarjeta_profesional` VARCHAR(45) NOT NULL,
  `vigencia_certificacion` DATE NOT NULL,
  `horas_turno_continuas` DECIMAL(4,1) NOT NULL DEFAULT 0.0,
  `estado_disponibilidad` VARCHAR(25) NOT NULL DEFAULT 'Disponible',
  PRIMARY KEY (`id_personal`),
CONSTRAINT chk_per_prof CHECK (perfil_operativo IN ('Paramedico','Conductor','Auxiliar','Medico')),
CONSTRAINT chk_per_est CHECK (estado_disponibilidad IN ('Disponible','En servicio','En descanso','Incapacitado')),
CONSTRAINT chk_per_hrs CHECK (horas_turno_continuas >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Paciente` (
  `id_paciente` INT NOT NULL AUTO_INCREMENT,
  `tipo_documento` VARCHAR(10) NOT NULL,
  `identificacion` VARCHAR(35) NOT NULL,
  `nombre_completo` VARCHAR(140) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  `contacto_emergencia` VARCHAR(120) NULL,
  `antecedentes_relevantes` VARCHAR(300) NULL,
  `estado_clinico_inicial` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_paciente`),
CONSTRAINT chk_pac_tdoc CHECK (tipo_documento IN ('CC','TI','CE','PA','NN')),
CONSTRAINT chk_pac_est CHECK (estado_clinico_inicial IN ('Estable','Critico','Fallecido'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `PacienteTelefono` (
  `id_telefono` INT NOT NULL AUTO_INCREMENT,
  `id_paciente` INT NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  `etiqueta` VARCHAR(30) NOT NULL DEFAULT 'Principal',
  PRIMARY KEY (`id_telefono`),
CONSTRAINT uq_pactel UNIQUE (id_paciente, telefono),
CONSTRAINT fk_pactel_pac FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Solicitud` (
  `id_solicitud` INT NOT NULL AUTO_INCREMENT,
  `id_usuario_registra` INT NOT NULL,
  `fecha_hora_solicitud` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `direccion_evento` VARCHAR(200) NOT NULL,
  `coordenadas_gps` VARCHAR(60) NULL,
  `tipo_emergencia` VARCHAR(80) NOT NULL,
  `prioridad_clinica` VARCHAR(15) NOT NULL,
  `nombre_solicitante` VARCHAR(120) NOT NULL,
  `telefono_solicitante` VARCHAR(25) NOT NULL,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Solicitado',
  PRIMARY KEY (`id_solicitud`),
CONSTRAINT fk_sol_usr FOREIGN KEY (id_usuario_registra) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_sol_prio CHECK (prioridad_clinica IN ('Verde','Amarillo','Naranja','Rojo')),
CONSTRAINT chk_sol_est CHECK (estado IN ('Solicitado','Asignado','Cancelado','Cerrado'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Servicio` (
  `id_servicio` INT NOT NULL AUTO_INCREMENT,
  `id_solicitud` INT NOT NULL,
  `id_paciente` INT NOT NULL,
  `fecha_hora_inicio` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_hora_cierre` DATETIME NULL,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Solicitado',
  `estado_paciente_final` VARCHAR(20) NULL,
  `destino_traslado` VARCHAR(180) NULL,
  `observaciones` VARCHAR(300) NULL,
  PRIMARY KEY (`id_servicio`),
CONSTRAINT uq_srv_solicitud UNIQUE (id_solicitud),
CONSTRAINT fk_srv_sol FOREIGN KEY (id_solicitud) REFERENCES Solicitud(id_solicitud) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_srv_pac FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_srv_est CHECK (estado IN ('Solicitado','Asignado','En ruta','En atencion','Traslado','Finalizado','Cancelado')),
CONSTRAINT chk_srv_estpac CHECK (estado_paciente_final IS NULL OR estado_paciente_final IN ('Estable','Critico','Fallecido'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `HistorialEstadoServicio` (
  `id_servicio` INT NOT NULL,
  `secuencia` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `estado_anterior` VARCHAR(20) NULL,
  `estado_nuevo` VARCHAR(20) NOT NULL,
  `fecha_cambio` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `motivo` VARCHAR(220) NULL,
  PRIMARY KEY (id_servicio, secuencia),
CONSTRAINT fk_hist_srv FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk_hist_usr FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_hist_seq CHECK (secuencia >= 1),
CONSTRAINT chk_hist_canc CHECK (estado_nuevo <> 'Cancelado' OR CHAR_LENGTH(TRIM(COALESCE(motivo,''))) > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Asignacion` (
  `id_asignacion` INT NOT NULL AUTO_INCREMENT,
  `id_servicio` INT NOT NULL,
  `id_ambulancia` INT NOT NULL,
  `fecha_hora_asignacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `criterio` VARCHAR(80) NOT NULL,
  `asignacion_manual` TINYINT(1) NOT NULL DEFAULT 0,
  `motivo_asignacion_manual` VARCHAR(250) NULL,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Activa',
  PRIMARY KEY (`id_asignacion`),
CONSTRAINT fk_asig_srv FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_asig_amb FOREIGN KEY (id_ambulancia) REFERENCES Ambulancia(id_ambulancia) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_asig_man_flag CHECK (asignacion_manual IN (0,1)),
CONSTRAINT chk_asig_rn007 CHECK (asignacion_manual = 0 OR CHAR_LENGTH(TRIM(COALESCE(motivo_asignacion_manual,''))) > 0),
CONSTRAINT chk_asig_est CHECK (estado IN ('Activa','Reasignada','Finalizada','Cancelada'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `AsignacionPersonal` (
  `id_asignacion_personal` INT NOT NULL AUTO_INCREMENT,
  `id_asignacion` INT NOT NULL,
  `id_personal` INT NOT NULL,
  `funcion` VARCHAR(40) NOT NULL,
  `fecha_hora_vinculacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_asignacion_personal`),
CONSTRAINT uq_asignacion_personal UNIQUE (id_asignacion, id_personal),
CONSTRAINT fk_ap_asig FOREIGN KEY (id_asignacion) REFERENCES Asignacion(id_asignacion) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT fk_ap_per FOREIGN KEY (id_personal) REFERENCES Personal(id_personal) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Intervencion` (
  `id_intervencion` INT NOT NULL AUTO_INCREMENT,
  `id_servicio` INT NOT NULL,
  `id_personal` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_intervencion` VARCHAR(80) NOT NULL,
  `descripcion` VARCHAR(350) NOT NULL,
  PRIMARY KEY (`id_intervencion`),
CONSTRAINT fk_int_srv FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_int_per FOREIGN KEY (id_personal) REFERENCES Personal(id_personal) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `RegistroCierre` (
  `id_cierre` INT NOT NULL AUTO_INCREMENT,
  `id_servicio` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `fecha_hora_cierre` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resultado_atencion` VARCHAR(200) NOT NULL,
  `estado_paciente_final` VARCHAR(20) NOT NULL,
  `destino_traslado` VARCHAR(180) NOT NULL,
  `responsable_atencion` VARCHAR(120) NOT NULL,
  `observaciones_finales` VARCHAR(300) NULL,
  PRIMARY KEY (`id_cierre`),
CONSTRAINT uq_cierre_servicio UNIQUE (id_servicio),
CONSTRAINT fk_cie_srv FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_cie_usr FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_cie_estpac CHECK (estado_paciente_final IN ('Estable','Critico','Fallecido')),
CONSTRAINT chk_cie_rn005 CHECK (CHAR_LENGTH(TRIM(resultado_atencion)) > 0 AND CHAR_LENGTH(TRIM(destino_traslado)) > 0 AND CHAR_LENGTH(TRIM(responsable_atencion)) > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Factura` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `id_servicio` INT NOT NULL,
  `numero_factura` VARCHAR(40) NOT NULL,
  `entidad_pagadora` VARCHAR(150) NOT NULL,
  `valor_total` DECIMAL(12,2) NOT NULL,
  `fecha_emision` DATE NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `dias_mora` INT NOT NULL DEFAULT 0,
  `es_moroso` TINYINT(1) NOT NULL DEFAULT 0,
  `estado_pago` VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
  `es_inmutable` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_factura`),
CONSTRAINT uq_fac_servicio UNIQUE (id_servicio),
CONSTRAINT uq_fac_numero UNIQUE (numero_factura),
CONSTRAINT fk_fac_srv FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_fac_val CHECK (valor_total > 0),
CONSTRAINT chk_fac_fech CHECK (fecha_vencimiento >= fecha_emision),
CONSTRAINT chk_fac_mora CHECK (dias_mora >= 0 AND es_moroso IN (0,1)),
CONSTRAINT chk_fac_est CHECK (estado_pago IN ('Pendiente','Pagada','En mora')),
CONSTRAINT chk_fac_inm CHECK (es_inmutable = 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `NotaContable` (
  `id_nota` INT NOT NULL AUTO_INCREMENT,
  `id_factura` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `tipo_nota` VARCHAR(15) NOT NULL,
  `valor_ajuste` DECIMAL(12,2) NOT NULL,
  `motivo` VARCHAR(250) NOT NULL,
  `fecha_emision` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_nota`),
CONSTRAINT fk_nota_fac FOREIGN KEY (id_factura) REFERENCES Factura(id_factura) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_nota_usr FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_nota_tipo CHECK (tipo_nota IN ('Credito','Debito')),
CONSTRAINT chk_nota_val CHECK (valor_ajuste > 0),
CONSTRAINT chk_nota_mot CHECK (CHAR_LENGTH(TRIM(motivo)) > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `MovimientoFinanciero` (
  `id_movimiento` INT NOT NULL AUTO_INCREMENT,
  `id_factura` INT NULL,
  `id_proveedor` INT NULL,
  `id_usuario` INT NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  `concepto` VARCHAR(180) NOT NULL,
  `monto` DECIMAL(12,2) NOT NULL,
  `soporte_ref` VARCHAR(220) NOT NULL,
  `fecha_movimiento` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_movimiento`),
CONSTRAINT fk_mov_fac FOREIGN KEY (id_factura) REFERENCES Factura(id_factura) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_mov_prov FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_mov_usr FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_mov_tipo CHECK (tipo IN ('Ingreso','Egreso')),
CONSTRAINT chk_mov_monto CHECK (monto > 0),
CONSTRAINT chk_mov_egreso CHECK (tipo <> 'Egreso' OR id_proveedor IS NOT NULL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Visitante` (
  `id_visitante` INT NOT NULL AUTO_INCREMENT,
  `id_usuario_autoriza` INT NULL,
  `tipo_documento` VARCHAR(10) NOT NULL,
  `documento` VARCHAR(35) NOT NULL,
  `nombre_completo` VARCHAR(130) NOT NULL,
  `area_visitada` VARCHAR(100) NOT NULL,
  `es_preautorizado` TINYINT(1) NOT NULL DEFAULT 0,
  `justificacion_manual` VARCHAR(240) NULL,
  `placa_vehiculo` VARCHAR(15) NULL,
  `hora_ingreso` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hora_salida` DATETIME NULL,
  PRIMARY KEY (`id_visitante`),
CONSTRAINT fk_vis_usr FOREIGN KEY (id_usuario_autoriza) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE SET NULL,
CONSTRAINT chk_vis_pre CHECK (es_preautorizado IN (0,1)),
CONSTRAINT chk_vis_rn017 CHECK (es_preautorizado = 1 OR CHAR_LENGTH(TRIM(COALESCE(justificacion_manual,''))) > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Pqrs` (
  `id_pqrs` INT NOT NULL AUTO_INCREMENT,
  `id_paciente` INT NULL,
  `id_usuario_responsable` INT NULL,
  `codigo_radicado` VARCHAR(35) NOT NULL,
  `tipo_pqrs` VARCHAR(20) NOT NULL,
  `descripcion` VARCHAR(350) NOT NULL,
  `fecha_radicacion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_limite` DATE NOT NULL,
  `estado_tramite` VARCHAR(20) NOT NULL DEFAULT 'Radicada',
  `respuesta_formal` VARCHAR(350) NULL,
  PRIMARY KEY (`id_pqrs`),
CONSTRAINT uq_pqrs_radicado UNIQUE (codigo_radicado),
CONSTRAINT fk_pqrs_pac FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente) ON UPDATE CASCADE ON DELETE SET NULL,
CONSTRAINT fk_pqrs_usr FOREIGN KEY (id_usuario_responsable) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE SET NULL,
CONSTRAINT chk_pqrs_tipo CHECK (tipo_pqrs IN ('Peticion','Queja','Reclamo','Sugerencia','Denuncia')),
CONSTRAINT chk_pqrs_est CHECK (estado_tramite IN ('Radicada','En tramite','Respondida','Cerrada')),
CONSTRAINT chk_pqrs_rn011 CHECK (estado_tramite <> 'Cerrada' OR CHAR_LENGTH(TRIM(COALESCE(respuesta_formal,''))) > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Documento` (
  `id_documento` INT NOT NULL AUTO_INCREMENT,
  `id_usuario_carga` INT NOT NULL,
  `id_doc_origen` INT NULL,
  `titulo` VARCHAR(160) NOT NULL,
  `categoria` VARCHAR(60) NOT NULL,
  `nivel_confidencialidad` VARCHAR(20) NOT NULL,
  `version` INT NOT NULL DEFAULT 1,
  `hash_sha256` CHAR(64) NOT NULL,
  `es_oficial` TINYINT(1) NOT NULL DEFAULT 0,
  `fecha_carga` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_documento`),
CONSTRAINT uq_doc_sha UNIQUE (hash_sha256),
CONSTRAINT fk_doc_usr FOREIGN KEY (id_usuario_carga) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_doc_orig FOREIGN KEY (id_doc_origen) REFERENCES Documento(id_documento) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_doc_conf CHECK (nivel_confidencialidad IN ('Publico','Interno','Restringido')),
CONSTRAINT chk_doc_ver CHECK (version >= 1 AND es_oficial IN (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `NovedadOperativa` (
  `id_novedad` INT NOT NULL AUTO_INCREMENT,
  `id_servicio` INT NULL,
  `id_ambulancia` INT NULL,
  `id_usuario_reporta` INT NOT NULL,
  `tipo_novedad` VARCHAR(60) NOT NULL,
  `prioridad` VARCHAR(15) NOT NULL,
  `descripcion` VARCHAR(350) NOT NULL,
  `estado` VARCHAR(20) NOT NULL DEFAULT 'Pendiente',
  `resolucion` VARCHAR(300) NULL,
  `fecha_registro` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_novedad`),
CONSTRAINT fk_nov_srv FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_nov_amb FOREIGN KEY (id_ambulancia) REFERENCES Ambulancia(id_ambulancia) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT fk_nov_usr FOREIGN KEY (id_usuario_reporta) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
CONSTRAINT chk_nov_prio CHECK (prioridad IN ('Baja','Media','Alta','Critica')),
CONSTRAINT chk_nov_est CHECK (estado IN ('Pendiente','En proceso','Resuelto','Cerrado')),
CONSTRAINT chk_nov_rn016 CHECK (estado <> 'Cerrado' OR CHAR_LENGTH(TRIM(COALESCE(resolucion,''))) > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `Auditoria` (
  `id_auditoria` BIGINT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NULL,
  `modulo` VARCHAR(60) NOT NULL,
  `accion` VARCHAR(40) NOT NULL,
  `entidad_afectada` VARCHAR(60) NOT NULL,
  `id_entidad` INT NULL,
  `valores_anteriores` TEXT NULL,
  `valores_nuevos` TEXT NULL,
  `ip_origen` VARCHAR(45) NOT NULL,
  `fecha_evento` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria`),
CONSTRAINT fk_aud_usr FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE SET NULL,
CONSTRAINT chk_aud_nonempty CHECK (CHAR_LENGTH(TRIM(modulo)) > 0 AND CHAR_LENGTH(TRIM(accion)) > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Indices operativos para tablero tiempo real y auditoria (RNF-008, RNF-009, RNF-021)
CREATE INDEX idx_amb_estado_tipo ON Ambulancia(estado_operativo, tipo);
CREATE INDEX idx_sol_prio_est ON Solicitud(prioridad_clinica, estado);
CREATE INDEX idx_srv_estado ON Servicio(estado);
CREATE INDEX idx_fac_mora ON Factura(estado_pago, dias_mora);
CREATE INDEX idx_aud_modulo_fecha ON Auditoria(modulo, fecha_evento);
CREATE INDEX idx_nov_prio_est ON NovedadOperativa(prioridad, estado);

-- Disparadores de inmutabilidad normativa (RN-010 Auditoria, RN-013 Documentos, RN-014 Facturas)
DELIMITER //
CREATE TRIGGER trg_auditoria_no_update BEFORE UPDATE ON Auditoria
FOR EACH ROW
BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'RN-010: Los registros de Auditoria son estrictamente inmutables.';
END//

CREATE TRIGGER trg_auditoria_no_delete BEFORE DELETE ON Auditoria
FOR EACH ROW
BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'RN-010: Prohibido eliminar registros de Auditoria.';
END//

CREATE TRIGGER trg_factura_no_update BEFORE UPDATE ON Factura
FOR EACH ROW
BEGIN
  IF OLD.es_inmutable = 1 AND NEW.valor_total <> OLD.valor_total THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'RN-014: Factura inmutable; use NotaContable para ajustes.';
  END IF;
END//

CREATE TRIGGER trg_doc_oficial_no_update BEFORE UPDATE ON Documento
FOR EACH ROW
BEGIN
  IF OLD.es_oficial = 1 AND (NEW.titulo <> OLD.titulo OR NEW.hash_sha256 <> OLD.hash_sha256) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'RN-013: Documento oficial bloqueado contra edicion.';
  END IF;
END//
DELIMITER ;
