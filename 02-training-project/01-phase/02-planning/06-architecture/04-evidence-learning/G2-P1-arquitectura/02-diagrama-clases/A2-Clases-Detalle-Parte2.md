# A2 - Detalle de clases, atributos y operaciones (Parte 2)

## Clase: Servicio

**Responsabilidad:** Gestionar el ciclo operativo del servicio derivado de una solicitud.

### Atributos
- -idServicio: int
- -fechaHoraInicio: DateTime
- -estado: String
- -observaciones: String

### Operaciones
- +iniciar(): void
- +actualizarEstado(estado: String): void
- +consultarEstado(): String
- +finalizar(): void

## Clase: Asignacion

**Responsabilidad:** Gestionar la asignación de una ambulancia a un servicio.

### Atributos
- -idAsignacion: int
- -fechaHoraAsignacion: DateTime
- -estado: String
- -criterio: String

### Operaciones
- +asignarAmbulancia(ambulancia: Ambulancia): Boolean
- +validarDisponibilidad(): Boolean
- +cancelar(): void

## Clase: AsignacionPersonal

**Responsabilidad:** Asociar personal operativo a una asignación.

### Atributos
- -idAsignacionPersonal: int
- -funcion: String
- -fechaHoraVinculacion: DateTime

### Operaciones
- +vincularPersonal(personal: Personal): void
- +desvincularPersonal(): void
- +validarPerfil(): Boolean

## Clase: Paciente

**Responsabilidad:** Gestionar datos básicos del paciente asociados al servicio.

### Atributos
- -idPaciente: int
- -identificacion: String
- -nombre: String
- -fechaNacimiento: Date
- -datosMinimosRegistrados: Boolean

### Operaciones
- +registrarDatosBasicos(): void
- +actualizarDatosBasicos(): void
- +consultarDatos(): String

## Clase: Intervencion

**Responsabilidad:** Registrar intervenciones prehospitalarias realizadas durante el servicio.

### Atributos
- -idIntervencion: int
- -fechaHora: DateTime
- -descripcion: String
- -tipoIntervencion: String
- -responsable: String

### Operaciones
- +registrar(): void
- +actualizarRegistro(descripcion: String): void
- +consultar(): String

## Clase: RegistroCierre

**Responsabilidad:** Consolidar información autorizada al finalizar un servicio.

### Atributos
- -idRegistroCierre: int
- -fechaHoraCierre: DateTime
- -condicionSalida: String
- -destinoAsistencial: String
- -resumenAtencion: String
- -observaciones: String

### Operaciones
- +registrarCierre(): Boolean
- +validarServicioFinalizado(): Boolean
- +consultarResumen(): String

## Estado

Se completa el detalle preliminar de las seis clases restantes. Las operaciones y atributos son una propuesta de diseño que deberá validarse con las reglas de negocio y los requisitos.
