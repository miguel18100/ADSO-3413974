# CU-08 – Registrar solicitud de servicio

## 1. Identificación

| Campo | Descripción |
|---|---|
| ID | CU-08 |
| Nombre | Registrar solicitud de servicio |
| Proyecto | Sistema Gestor de Ambulancias (SGA) |
| Actor principal | Coordinador operativo |
| Requisitos relacionados | RF-12 |
| Prioridad | Alta |
| Tipo | Caso de uso funcional |

## 2. Objetivo

Permitir al coordinador operativo registrar una solicitud de atención de ambulancia en el Sistema Gestor de Ambulancias (SGA), ingresando la información inicial necesaria para que la solicitud pueda continuar con los procesos de clasificación, consulta de disponibilidad y asignación de recursos.

## 3. Actores

- **Actor principal:** Coordinador operativo.
- **Actor secundario:** Sistema SGA.

## 4. Precondiciones

1. El coordinador operativo cuenta con acceso al sistema.
2. El coordinador operativo ha iniciado sesión.
3. El sistema se encuentra disponible para registrar solicitudes.

## 5. Disparador

El coordinador operativo recibe información sobre una necesidad de atención y selecciona la opción para registrar una nueva solicitud de servicio.

## 6. Flujo principal

| Paso | Actor / Sistema | Descripción |
|---|---|---|
| 1 | Coordinador operativo | Accede al módulo de solicitudes de servicio. |
| 2 | Sistema | Presenta la interfaz para registrar una nueva solicitud. |
| 3 | Coordinador operativo | Ingresa la información inicial recibida sobre la solicitud, incluyendo los datos de ubicación y descripción de la necesidad de atención. |
| 4 | Sistema | Valida que los campos obligatorios hayan sido diligenciados y que la información cumpla las validaciones definidas. |
| 5 | Coordinador operativo | Confirma el registro de la solicitud. |
| 6 | Sistema | Registra la solicitud y genera el identificador correspondiente, de acuerdo con las reglas de operación del sistema. |
| 7 | Sistema | Informa al coordinador operativo que la solicitud fue registrada correctamente. |
| 8 | Coordinador operativo | Verifica la información registrada y continúa con el proceso operativo correspondiente. |

## 7. Flujo alternativo

### A1. Información incompleta

| Paso | Descripción |
|---|---|
| A1.1 | En el paso 4, el sistema detecta que uno o más campos obligatorios están incompletos. |
| A1.2 | El sistema identifica los campos que requieren corrección. |
| A1.3 | El coordinador operativo completa o corrige la información. |
| A1.4 | El flujo retoma el paso 4 del flujo principal. |

## 8. Flujo de excepción

### E1. Error al guardar la solicitud

| Paso | Descripción |
|---|---|
| E1.1 | Durante el registro, el sistema presenta un error que impide guardar la solicitud. |
| E1.2 | El sistema informa que el registro no pudo completarse. |
| E1.3 | El sistema evita confirmar la solicitud como registrada si no se ha persistido correctamente. |
| E1.4 | El coordinador operativo puede reintentar el registro después de verificar la información y las condiciones del sistema. |

## 9. Postcondiciones

### Postcondición de éxito

La solicitud queda registrada en el SGA y disponible para los procesos operativos posteriores que correspondan.

### Postcondición de fallo

La solicitud no se confirma como registrada y el sistema informa la situación al coordinador operativo.

## 10. Reglas de negocio relacionadas

- La solicitud debe contener la información obligatoria definida para el registro.
- El sistema debe validar los datos antes de confirmar el registro.
- Una solicitud registrada debe poder identificarse para su gestión posterior.
- El registro de una solicitud no implica por sí mismo la asignación de una ambulancia ni del personal operativo.

## 11. Referencia al prototipo

**Pantalla asociada:** P-01 – Registro de solicitud de servicio.

Esta pantalla será elaborada en el artefacto de prototipo UI y deberá permitir visualizar la interacción correspondiente al CU-08.

## 12. Trazabilidad

| Artefacto | Referencia |
|---|---|
| Requisito funcional | RF-12 |
| Caso de uso | CU-08 |
| Diagrama de actividades | DA-01 – Registrar solicitud de servicio |
| Pantalla | P-01 – Registro de solicitud de servicio |
| Modelo de dominio | Usuario, Solicitud y Servicio (MD-01, secciones 4 y 5) |
| Modelo ER | USUARIO, SOLICITUD y SERVICIO (MER-01, secciones 4 a 6) |

## 13. Observaciones de verificación

Este caso de uso se elaboró tomando como referencia la línea base de requisitos y casos de uso de G1-P1. Los campos específicos del formulario, las validaciones y las reglas detalladas deberán verificarse frente a la documentación consolidada y al alcance del SGA antes de considerar el artefacto validado.
