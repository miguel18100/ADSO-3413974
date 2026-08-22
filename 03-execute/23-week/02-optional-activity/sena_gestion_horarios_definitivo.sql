-- ============================================================
-- MODELO DE DATOS DEFINITIVO
-- Sistema de Gestión de Horarios SENA
-- Motor: MySQL 8.x
--
-- Base del modelo:
-- 1) Mockup / interacción de los roles
-- 2) BPMN de Aprendiz, Instructor, Coordinador Académico,
--    Director de Centro y Administrador de Soporte
-- 3) Ingeniería inversa: funcionalidad -> información -> entidad
--
-- Regla de consistencia:
-- Este script debe coincidir 1:1 con el MER y el diccionario.
-- ============================================================

CREATE DATABASE IF NOT EXISTS sena_gestion_horarios
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE sena_gestion_horarios;

SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- A. ORGANIZACIÓN Y ACCESO
-- ============================================================

CREATE TABLE roles (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(40) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(255) NULL
) ENGINE=InnoDB;

CREATE TABLE usuarios (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    rol_id BIGINT UNSIGNED NOT NULL,
    sede_id BIGINT UNSIGNED NULL,
    nombre_completo VARCHAR(150) NOT NULL,
    correo_institucional VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_usuarios_rol
        FOREIGN KEY (rol_id) REFERENCES roles(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    INDEX idx_usuarios_rol (rol_id),
    INDEX idx_usuarios_sede (sede_id)
) ENGINE=InnoDB;

CREATE TABLE centros (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    regional VARCHAR(100) NULL,
    director_id BIGINT UNSIGNED NULL,
    estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_centros_director
        FOREIGN KEY (director_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE sedes (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    centro_id BIGINT UNSIGNED NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    ciudad VARCHAR(100) NULL,
    direccion VARCHAR(255) NULL,
    estado ENUM('activa','inactiva') NOT NULL DEFAULT 'activa',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_sedes_centro
        FOREIGN KEY (centro_id) REFERENCES centros(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    INDEX idx_sedes_centro (centro_id)
) ENGINE=InnoDB;

ALTER TABLE usuarios
    ADD CONSTRAINT fk_usuarios_sede
        FOREIGN KEY (sede_id) REFERENCES sedes(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL;

CREATE TABLE tokens_recuperacion (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT UNSIGNED NOT NULL,
    token VARCHAR(255) NOT NULL UNIQUE,
    expira_en TIMESTAMP NOT NULL,
    usado BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_tokens_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    INDEX idx_tokens_usuario (usuario_id),
    INDEX idx_tokens_expira (expira_en)
) ENGINE=InnoDB;

-- ============================================================
-- B. DATOS DE REFERENCIA / FORMACIÓN
-- ============================================================

CREATE TABLE programas_formacion (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(200) NOT NULL,
    nivel VARCHAR(80) NULL,
    duracion_meses TINYINT UNSIGNED NULL,
    estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB;

CREATE TABLE prerrequisitos_programa (
    programa_id BIGINT UNSIGNED NOT NULL,
    prerrequisito_id BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (programa_id, prerrequisito_id),

    CONSTRAINT fk_prereq_programa
        FOREIGN KEY (programa_id) REFERENCES programas_formacion(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_prereq_requisito
        FOREIGN KEY (prerrequisito_id) REFERENCES programas_formacion(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT chk_programa_no_es_prerequisito_de_si_mismo
        CHECK (programa_id <> prerrequisito_id)
) ENGINE=InnoDB;

CREATE TABLE fichas (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numero_ficha VARCHAR(30) NOT NULL UNIQUE,
    programa_id BIGINT UNSIGNED NOT NULL,
    sede_id BIGINT UNSIGNED NOT NULL,
    coordinador_id BIGINT UNSIGNED NOT NULL,
    jornada ENUM('mañana','tarde','noche','mixta','virtual') NULL,
    fecha_inicio DATE NULL,
    fecha_fin DATE NULL,
    estado ENUM('activa','finalizada','cancelada') NOT NULL DEFAULT 'activa',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_fichas_programa
        FOREIGN KEY (programa_id) REFERENCES programas_formacion(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_fichas_sede
        FOREIGN KEY (sede_id) REFERENCES sedes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_fichas_coordinador
        FOREIGN KEY (coordinador_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_fichas_fechas
        CHECK (
            fecha_fin IS NULL
            OR fecha_inicio IS NULL
            OR fecha_fin >= fecha_inicio
        ),

    INDEX idx_fichas_programa (programa_id),
    INDEX idx_fichas_sede (sede_id),
    INDEX idx_fichas_coordinador (coordinador_id)
) ENGINE=InnoDB;

CREATE TABLE matriculas (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    aprendiz_id BIGINT UNSIGNED NOT NULL,
    ficha_id BIGINT UNSIGNED NOT NULL,
    fecha_matricula DATE NULL,
    estado ENUM('activa','retirada','finalizada') NOT NULL DEFAULT 'activa',

    UNIQUE KEY uq_matricula (aprendiz_id, ficha_id),

    CONSTRAINT fk_matriculas_aprendiz
        FOREIGN KEY (aprendiz_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_matriculas_ficha
        FOREIGN KEY (ficha_id) REFERENCES fichas(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    INDEX idx_matriculas_ficha (ficha_id)
) ENGINE=InnoDB;

-- ============================================================
-- C. INFRAESTRUCTURA Y DISPONIBILIDAD
-- ============================================================

CREATE TABLE ambientes (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sede_id BIGINT UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('aula','laboratorio','taller','virtual','otro')
        NOT NULL DEFAULT 'aula',
    capacidad SMALLINT UNSIGNED NULL,
    estado ENUM('disponible','mantenimiento','inactivo')
        NOT NULL DEFAULT 'disponible',

    CONSTRAINT fk_ambientes_sede
        FOREIGN KEY (sede_id) REFERENCES sedes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    INDEX idx_ambientes_sede (sede_id)
) ENGINE=InnoDB;

CREATE TABLE disponibilidad_instructor (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    instructor_id BIGINT UNSIGNED NOT NULL,
    dia_semana ENUM(
        'lunes','martes','miercoles','jueves',
        'viernes','sabado','domingo'
    ) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    vigente_desde DATE NULL,
    vigente_hasta DATE NULL,
    estado ENUM('activa','inactiva') NOT NULL DEFAULT 'activa',

    CONSTRAINT fk_disponibilidad_instructor
        FOREIGN KEY (instructor_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_disponibilidad_horas
        CHECK (hora_fin > hora_inicio),

    CONSTRAINT chk_disponibilidad_fechas
        CHECK (
            vigente_hasta IS NULL
            OR vigente_desde IS NULL
            OR vigente_hasta >= vigente_desde
        ),

    INDEX idx_disponibilidad_instructor (instructor_id)
) ENGINE=InnoDB;

CREATE TABLE excepciones_disponibilidad (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    instructor_id BIGINT UNSIGNED NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    archivo_soporte VARCHAR(500) NULL,
    estado ENUM('pendiente','aprobada','rechazada')
        NOT NULL DEFAULT 'pendiente',
    revisado_por BIGINT UNSIGNED NULL,
    fecha_revision TIMESTAMP NULL,
    observaciones TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_excepciones_instructor
        FOREIGN KEY (instructor_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_excepciones_revisor
        FOREIGN KEY (revisado_por) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    CONSTRAINT chk_excepciones_fechas
        CHECK (fecha_fin >= fecha_inicio),

    INDEX idx_excepciones_instructor (instructor_id),
    INDEX idx_excepciones_estado (estado)
) ENGINE=InnoDB;

-- ============================================================
-- D. PROGRAMACIÓN ACADÉMICA
-- ============================================================

CREATE TABLE horarios (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ficha_id BIGINT UNSIGNED NOT NULL,
    nombre VARCHAR(150) NULL,
    fecha_inicio DATE NULL,
    fecha_fin DATE NULL,
    estado ENUM('borrador','publicado','finalizado')
        NOT NULL DEFAULT 'borrador',
    creado_por BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_horarios_ficha
        FOREIGN KEY (ficha_id) REFERENCES fichas(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_horarios_creador
        FOREIGN KEY (creado_por) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_horarios_fechas
        CHECK (
            fecha_fin IS NULL
            OR fecha_inicio IS NULL
            OR fecha_fin >= fecha_inicio
        ),

    INDEX idx_horarios_ficha (ficha_id)
) ENGINE=InnoDB;

CREATE TABLE sesiones (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    horario_id BIGINT UNSIGNED NOT NULL,
    instructor_id BIGINT UNSIGNED NOT NULL,
    ambiente_id BIGINT UNSIGNED NOT NULL,
    dia_semana ENUM(
        'lunes','martes','miercoles','jueves',
        'viernes','sabado','domingo'
    ) NULL,
    fecha_sesion DATE NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    tipo ENUM('teorica','practica','mixta') NOT NULL DEFAULT 'teorica',
    resultado_aprendizaje VARCHAR(255) NULL,
    estado ENUM('programada','con_conflicto','cancelada')
        NOT NULL DEFAULT 'programada',

    CONSTRAINT fk_sesiones_horario
        FOREIGN KEY (horario_id) REFERENCES horarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_sesiones_instructor
        FOREIGN KEY (instructor_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_sesiones_ambiente
        FOREIGN KEY (ambiente_id) REFERENCES ambientes(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_sesiones_horas
        CHECK (hora_fin > hora_inicio),

    INDEX idx_sesiones_horario (horario_id),
    INDEX idx_sesiones_instructor (instructor_id),
    INDEX idx_sesiones_ambiente (ambiente_id)
) ENGINE=InnoDB;

CREATE TABLE conflictos (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    sesion_id BIGINT UNSIGNED NOT NULL,
    sesion_conflicto_id BIGINT UNSIGNED NULL,
    tipo ENUM('instructor','ambiente','horario') NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    estado ENUM('pendiente','resuelto') NOT NULL DEFAULT 'pendiente',
    resuelto_por BIGINT UNSIGNED NULL,
    fecha_resolucion TIMESTAMP NULL,
    observaciones TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_conflictos_sesion
        FOREIGN KEY (sesion_id) REFERENCES sesiones(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_conflictos_sesion_conflicto
        FOREIGN KEY (sesion_conflicto_id) REFERENCES sesiones(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    CONSTRAINT fk_conflictos_resuelto_por
        FOREIGN KEY (resuelto_por) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    INDEX idx_conflictos_estado (estado),
    INDEX idx_conflictos_sesion (sesion_id)
) ENGINE=InnoDB;

-- ============================================================
-- E. SEGUIMIENTO Y COMUNICACIONES
-- ============================================================

CREATE TABLE seguimiento_ficha (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ficha_id BIGINT UNSIGNED NOT NULL,
    instructor_id BIGINT UNSIGNED NOT NULL,
    fecha_seguimiento DATE NOT NULL,
    tema_avance TEXT NULL,
    aprendices_matriculados SMALLINT UNSIGNED NOT NULL,
    aprendices_asistentes SMALLINT UNSIGNED NOT NULL,
    observaciones TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_seguimiento_ficha
        FOREIGN KEY (ficha_id) REFERENCES fichas(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_seguimiento_instructor
        FOREIGN KEY (instructor_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_seguimiento_asistencia
        CHECK (aprendices_asistentes <= aprendices_matriculados),

    INDEX idx_seguimiento_ficha (ficha_id),
    INDEX idx_seguimiento_instructor (instructor_id)
) ENGINE=InnoDB;

CREATE TABLE notificaciones (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT UNSIGNED NOT NULL,
    tipo ENUM(
        'cambio_horario',
        'cambio_ambiente',
        'alerta',
        'general'
    ) NOT NULL DEFAULT 'general',
    titulo VARCHAR(150) NOT NULL,
    mensaje TEXT NOT NULL,
    leida BOOLEAN NOT NULL DEFAULT FALSE,
    entidad_relacionada VARCHAR(50) NULL,
    entidad_id BIGINT UNSIGNED NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_notificaciones_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    INDEX idx_notificaciones_usuario (usuario_id),
    INDEX idx_notificaciones_leida (usuario_id, leida)
) ENGINE=InnoDB;

-- ============================================================
-- F. SOPORTE, MONITOREO Y RESPALDOS
-- Respaldado por el BPMN de Administrador de Soporte.
-- ============================================================

CREATE TABLE tickets_soporte (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT UNSIGNED NOT NULL,
    asunto VARCHAR(200) NOT NULL,
    descripcion TEXT NOT NULL,
    prioridad ENUM('baja','media','alta','critica')
        NOT NULL DEFAULT 'media',
    estado ENUM('abierto','en_proceso','resuelto','cerrado')
        NOT NULL DEFAULT 'abierto',
    asignado_a BIGINT UNSIGNED NULL,
    respuesta TEXT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_tickets_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_tickets_asignado
        FOREIGN KEY (asignado_a) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    INDEX idx_tickets_estado (estado),
    INDEX idx_tickets_usuario (usuario_id),
    INDEX idx_tickets_asignado (asignado_a)
) ENGINE=InnoDB;

CREATE TABLE logs_sistema (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT UNSIGNED NULL,
    nivel ENUM('info','warning','error','critico') NOT NULL DEFAULT 'info',
    origen VARCHAR(100) NOT NULL,
    evento VARCHAR(150) NOT NULL,
    mensaje TEXT NOT NULL,
    ip_origen VARCHAR(45) NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_logs_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    INDEX idx_logs_nivel (nivel),
    INDEX idx_logs_origen (origen),
    INDEX idx_logs_fecha (created_at)
) ENGINE=InnoDB;

CREATE TABLE respaldos_sistema (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ejecutado_por BIGINT UNSIGNED NULL,
    nombre_archivo VARCHAR(255) NOT NULL,
    ruta_archivo VARCHAR(500) NULL,
    fecha_inicio TIMESTAMP NOT NULL,
    fecha_fin TIMESTAMP NULL,
    estado ENUM('iniciado','exitoso','fallido')
        NOT NULL DEFAULT 'iniciado',
    tamano_bytes BIGINT UNSIGNED NULL,
    mensaje TEXT NULL,

    CONSTRAINT fk_respaldos_usuario
        FOREIGN KEY (ejecutado_por) REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    INDEX idx_respaldos_estado (estado),
    INDEX idx_respaldos_fecha (fecha_inicio)
) ENGINE=InnoDB;

-- ============================================================
-- G. PARAMETRIZACIÓN
-- ============================================================

CREATE TABLE parametros_sistema (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    clave VARCHAR(100) NOT NULL UNIQUE,
    valor VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- DATOS INICIALES
-- ============================================================

INSERT INTO roles (codigo, nombre, descripcion) VALUES
('aprendiz', 'Aprendiz', 'Consulta horario y notificaciones'),
('instructor', 'Instructor', 'Gestiona disponibilidad y seguimiento'),
('coordinador_academico', 'Coordinador Académico',
 'Gestiona fichas, horarios, sesiones y conflictos'),
('director_centro', 'Director de Centro',
 'Administra usuarios, sedes, datos de referencia y parametrización'),
('administrador_soporte', 'Administrador de Soporte',
 'Gestiona tickets, monitoreo y respaldos');

INSERT INTO centros (nombre, regional) VALUES
('Centro de Formación SENA', NULL);

INSERT INTO sedes (centro_id, nombre) VALUES
(1, 'Sede principal');

INSERT INTO programas_formacion (codigo, nombre, nivel) VALUES
('ADSO', 'Análisis y Desarrollo de Software', 'Tecnólogo');

-- ============================================================
-- FIN DEL MODELO
-- Total: 21 tablas
-- ============================================================
