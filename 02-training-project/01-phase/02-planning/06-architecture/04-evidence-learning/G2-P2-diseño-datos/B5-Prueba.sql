-- =========================================================
-- B5 - Script de creación de base de datos SIGMAVITAL
-- Motor: MySQL 8.x
-- =========================================================

CREATE DATABASE IF NOT EXISTS sigmavital_prueba
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE sigmavital_prueba;

-- =========================================================
-- 1. Tabla Rol
-- =========================================================

CREATE TABLE Rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

-- =========================================================
-- 2. Tabla Usuario
-- =========================================================

CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_rol INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    estado VARCHAR(20) NOT NULL CHECK (estado IN ('Activo','Inactivo','Pendiente','Disponible','En servicio','Fuera de servicio')),
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_usuario_rol
        FOREIGN KEY (id_rol)
        REFERENCES Rol(id_rol) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- =========================================================
-- 3. Tabla Solicitud
-- =========================================================

CREATE TABLE Solicitud (
    id_solicitud INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_recepcion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ubicacion_incidente VARCHAR(255) NOT NULL,
    prioridad VARCHAR(20) NOT NULL CHECK (prioridad IN ('Baja','Media','Alta','Critica')),
    descripcion TEXT NOT NULL,
    estado VARCHAR(30) NOT NULL CHECK (estado IN ('Pendiente','En proceso','Asignado','Activo','Finalizado','Cancelado','Disponible','En servicio','Fuera de servicio')),

    CONSTRAINT fk_solicitud_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES Usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- =========================================================
-- 4. Tabla Paciente
-- =========================================================

CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    identificacion_referencia VARCHAR(30),
    nombre_referencia VARCHAR(100),
    informacion_basica TEXT
);

-- =========================================================
-- 5. Tabla Servicio
-- =========================================================

CREATE TABLE Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_solicitud INT NOT NULL UNIQUE,
    id_paciente INT NOT NULL,
    fecha_inicio DATETIME NOT NULL,
    estado VARCHAR(30) NOT NULL CHECK (estado IN ('Pendiente','En proceso','Asignado','Activo','Finalizado','Cancelado','Disponible','En servicio','Fuera de servicio')),
    fecha_finalizacion DATETIME CHECK (fecha_finalizacion IS NULL OR fecha_finalizacion >= fecha_inicio),
    destino VARCHAR(255),

    CONSTRAINT fk_servicio_solicitud
        FOREIGN KEY (id_solicitud)
        REFERENCES Solicitud(id_solicitud) ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_servicio_paciente
        FOREIGN KEY (id_paciente)
        REFERENCES Paciente(id_paciente) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- =========================================================
-- 6. Tabla RegistroCierre
-- =========================================================

CREATE TABLE RegistroCierre (
    id_cierre INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL UNIQUE,
    fecha_cierre DATETIME NOT NULL,
    resumen_condicion TEXT,
    destino VARCHAR(255),
    observaciones_finales TEXT,

    CONSTRAINT fk_cierre_servicio
        FOREIGN KEY (id_servicio)
        REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE CASCADE
);

-- =========================================================
-- 7. Tabla Ambulancia
-- =========================================================

CREATE TABLE Ambulancia (
    id_ambulancia INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(15) NOT NULL UNIQUE,
    tipo VARCHAR(50) NOT NULL,
    estado_operativo VARCHAR(30) NOT NULL,
    ubicacion_referencia VARCHAR(255)
);

-- =========================================================
-- 8. Tabla Asignacion
-- =========================================================

CREATE TABLE Asignacion (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_ambulancia INT NOT NULL,
    fecha_asignacion DATETIME NOT NULL,
    estado VARCHAR(30) NOT NULL CHECK (estado IN ('Pendiente','En proceso','Asignado','Activo','Finalizado','Cancelado','Disponible','En servicio','Fuera de servicio')),
    observaciones TEXT,

    CONSTRAINT fk_asignacion_servicio
        FOREIGN KEY (id_servicio)
        REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT fk_asignacion_ambulancia
        FOREIGN KEY (id_ambulancia)
        REFERENCES Ambulancia(id_ambulancia) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- =========================================================
-- 9. Tabla Personal
-- =========================================================

CREATE TABLE Personal (
    id_personal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    identificacion_referencia VARCHAR(30),
    perfil_operativo VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL CHECK (estado IN ('Activo','Inactivo','Pendiente','Disponible','En servicio','Fuera de servicio')),
    contacto VARCHAR(100)
);

-- =========================================================
-- 10. Tabla AsignacionPersonal
-- =========================================================

CREATE TABLE AsignacionPersonal (
    id_asignacion_personal INT AUTO_INCREMENT PRIMARY KEY,
    id_asignacion INT NOT NULL,
    id_personal INT NOT NULL,
    funcion VARCHAR(50) NOT NULL,
    fecha_vinculacion DATETIME NOT NULL,

    CONSTRAINT fk_asignacionpersonal_asignacion
        FOREIGN KEY (id_asignacion)
        REFERENCES Asignacion(id_asignacion) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT fk_asignacionpersonal_personal
        FOREIGN KEY (id_personal)
        REFERENCES Personal(id_personal) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- =========================================================
-- 11. Tabla Intervencion
-- =========================================================

CREATE TABLE Intervencion (
    id_intervencion INT AUTO_INCREMENT PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_personal INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    descripcion TEXT NOT NULL,
    observaciones TEXT,

    CONSTRAINT fk_intervencion_servicio
        FOREIGN KEY (id_servicio)
        REFERENCES Servicio(id_servicio) ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT fk_intervencion_personal
        FOREIGN KEY (id_personal)
        REFERENCES Personal(id_personal) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- =========================================================
-- FIN DEL SCRIPT
-- =========================================================
