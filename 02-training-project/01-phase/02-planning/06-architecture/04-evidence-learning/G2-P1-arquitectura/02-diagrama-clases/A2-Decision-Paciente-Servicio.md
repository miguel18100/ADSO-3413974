# A2 - Registro de Decisión: Asociación Paciente–Servicio

**Proyecto:** SIGMAVITAL  
**Evidencia:** G2-P1 - Diseño de arquitectura y clases  
**Estado:** Validado a nivel de diseño UML

## Contexto

La clase `Paciente` está definida en el diagrama de clases A2 para representar los datos básicos necesarios durante la atención prehospitalaria.

El requisito funcional RF-29 establece que el sistema debe permitir registrar y consultar los datos básicos del paciente asociados a un servicio prehospitalario, limitándose a la información necesaria para la operación y atención inicial.

## Decisión

Se incorpora una asociación simple entre `Paciente` y `Servicio` en el diagrama de clases A2:

`Paciente "1" -- "0..*" Servicio : recibe atención`

La relación representa que un paciente puede estar asociado a varios servicios prehospitalarios a lo largo del tiempo y que cada servicio del modelo se relaciona con un paciente.

La asociación es simple y no corresponde a una composición, debido a que el paciente conserva su identidad y existencia independientemente de los servicios registrados.

## Justificación

La asociación responde al alcance definido en RF-29 y permite relacionar los datos básicos del paciente con el servicio prehospitalario correspondiente.

La decisión favorece la trazabilidad de la atención sin plantear la construcción de una historia clínica electrónica integral, cuyo alcance no está contemplado en los requisitos actuales.

## Trazabilidad

- **RF-29:** Registro y consulta de datos básicos del paciente asociados a un servicio prehospitalario.
- **CU-20:** Registro y consulta de información básica del paciente.
- **A2:** Diagrama de clases UML, asociación `Paciente–Servicio`.

## Alcance de la decisión

La asociación queda incorporada en el diseño UML de A2. Su implementación física en el modelo de datos y las reglas definitivas de persistencia deberán ser verificadas en las etapas correspondientes del proyecto.

Esta decisión no reemplaza la revisión integral de trazabilidad ni las validaciones posteriores del modelo de datos.
