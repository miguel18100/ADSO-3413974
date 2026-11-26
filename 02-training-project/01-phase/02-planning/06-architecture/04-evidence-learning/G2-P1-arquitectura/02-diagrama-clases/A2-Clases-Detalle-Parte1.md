# A2 - Detalle de clases, atributos y operaciones (Parte 1)

## Clase: Usuario

**Responsabilidad:** Gestionar la identidad básica y estado de una cuenta del sistema.

### Atributos
- -idUsuario: int
- -nombre: String
- -correo: String
- -hashContrasena: String
- -activo: Boolean

### Operaciones
- +autenticar(correo: String, contrasena: String): Boolean
- +actualizarDatos(nombre: String, correo: String): void
- +desactivar(): void

## Clase: Rol

**Responsabilidad:** Representar un rol de acceso del sistema.

### Atributos
- -idRol: int
- -nombre: String
- -descripcion: String

### Operaciones
- +asignarA(usuario: Usuario): void
- +revocarA(usuario: Usuario): void
- +consultarPermisos(): List<String>

## Clase: Ambulancia

**Responsabilidad:** Representar una ambulancia registrada y sus condiciones operativas.

### Atributos
- -idAmbulancia: int
- -placa: String
- -tipo: String
- -estadoOperativo: String
- -ubicacion: String

### Operaciones
- +actualizarEstado(estado: String): void
- +consultarDisponibilidad(): Boolean
- +actualizarUbicacion(ubicacion: String): void

## Clase: Personal

**Responsabilidad:** Representar al personal operativo habilitado para participar en servicios.

### Atributos
- -idPersonal: int
- -nombre: String
- -documento: String
- -cargo: String
- -estado: String

### Operaciones
- +actualizarEstado(estado: String): void
- +consultarDisponibilidad(): Boolean
- +validarParticipacion(): Boolean

## Clase: Solicitud

**Responsabilidad:** Registrar y administrar la entrada de solicitudes de transporte asistencial.

### Atributos
- -idSolicitud: int
- -fechaHora: DateTime
- -descripcion: String
- -prioridad: String
- -estado: String

### Operaciones
- +registrar(): void
- +actualizarEstado(estado: String): void
- +consultarDetalle(): String

## Estado

Este documento detalla las clases Usuario, Rol, Ambulancia, Personal y Solicitud, con sus atributos, tipos de datos, visibilidad y operaciones. El diseño fue revisado a nivel UML y mantiene su correspondencia con los requisitos seleccionados. La validación definitiva de las reglas de negocio corresponde a etapas posteriores del desarrollo.

