# CU-11 – Asignar ambulancia y personal

## 1. Identificación

| Campo | Descripción |
|---|---|
| ID | CU-11 |
| Nombre | Asignar ambulancia y personal |
| Proyecto | Sistema Gestor de Ambulancias (SGA) |
| Actor principal | Coordinador operativo |
| Requisitos relacionados | RF-17, RF-18 |
| Prioridad | Alta |
| Tipo | Caso de uso funcional |

## 2. Objetivo

Permitir al coordinador operativo asignar una ambulancia y el personal operativo correspondiente a un servicio, considerando la disponibilidad de los recursos y la información registrada en el SGA, para facilitar la ejecución de la atención solicitada.

## 3. Actores

- **Actor principal:** Coordinador operativo.
- **Actor secundario:** Ninguno identificado en la línea base para este flujo.

## 4. Precondiciones

1. El coordinador operativo ha iniciado sesión en el SGA.
2. Existe un servicio registrado que requiere asignación de recursos.
3. El servicio se encuentra en una condición operativa que permite su asignación.
4. El sistema dispone de información sobre ambulancias y personal operativo registrados.

## 5. Disparador

El coordinador operativo selecciona un servicio pendiente de asignación e inicia el proceso de asignación de ambulancia y personal operativo.

## 6. Flujo principal

| Paso | Actor / Sistema | Descripción |
|---|---|---|
| 1 | Coordinador operativo | Selecciona el servicio que requiere asignación de recursos. |
| 2 | Sistema | Presenta la información disponible del servicio seleccionado. |
| 3 | Coordinador operativo | Solicita consultar los recursos disponibles para realizar la asignación. |
| 4 | Sistema | Ejecuta la consulta de disponibilidad de recursos mediante el caso de uso CU-07. |
| 5 | Sistema | Presenta las ambulancias y el personal operativo que cumplen las condiciones de disponibilidad consultadas. |
| 6 | Coordinador operativo | Selecciona la ambulancia apropiada para el servicio. |
| 7 | Coordinador operativo | Selecciona el personal operativo correspondiente para la asignación. |
| 8 | Sistema | Verifica la información de los recursos seleccionados y las condiciones de asignación. |
| 9 | Coordinador operativo | Confirma la asignación de los recursos al servicio. |
| 10 | Sistema | Registra la asignación de ambulancia y personal operativo asociada al servicio. |
| 11 | Sistema | Informa que la asignación se registró correctamente. |

## 7. Flujo alternativo

### A1. No se encuentran recursos disponibles

| Paso | Descripción |
|---|---|
| A1.1 | En el paso 5, el sistema no encuentra ambulancias o personal operativo disponibles que permitan completar la asignación. |
| A1.2 | El sistema informa al coordinador operativo que no se encontraron recursos disponibles para completar la asignación. |
| A1.3 | El coordinador operativo puede volver a consultar la disponibilidad o dejar pendiente el proceso de asignación. |
| A1.4 | Si se realiza una nueva consulta, el flujo retoma el paso 3 del flujo principal. |

### A2. El coordinador modifica la selección

| Paso | Descripción |
|---|---|
| A2.1 | Antes de confirmar la asignación, el coordinador operativo decide cambiar alguno de los recursos seleccionados. |
| A2.2 | El coordinador operativo selecciona otros recursos entre los disponibles. |
| A2.3 | El sistema verifica nuevamente las condiciones de asignación. |
| A2.4 | El flujo continúa en el paso 9 del flujo principal. |

## 8. Flujo de excepción

### E1. Error al registrar la asignación

| Paso | Descripción |
|---|---|
| E1.1 | Durante el registro de la asignación, el sistema presenta un error que impide guardar la operación. |
| E1.2 | El sistema informa que la asignación no pudo registrarse. |
| E1.3 | El sistema no confirma la asignación como exitosa si no se ha guardado correctamente. |
| E1.4 | El coordinador operativo puede revisar la situación e intentar nuevamente el proceso. |

## 9. Postcondiciones

### Postcondición de éxito

La asignación de ambulancia y personal operativo queda registrada y relacionada con el servicio correspondiente en el SGA.

### Postcondición de fallo

La asignación no se confirma como realizada y el sistema informa la situación al coordinador operativo.

## 10. Reglas de negocio relacionadas

- La asignación debe relacionarse con un servicio previamente registrado.
- La asignación debe considerar la disponibilidad de los recursos consultada en el sistema.
- La ambulancia y el personal operativo deben estar registrados en el SGA.
- La asignación debe quedar asociada al servicio correspondiente.
- La consulta de disponibilidad corresponde al caso de uso CU-07, relacionado mediante <<include>> con CU-11.
- La consulta de disponibilidad no garantiza por sí sola que el recurso continúe disponible al momento de confirmar; el sistema deberá verificar las condiciones de asignación antes de registrar la operación.

## 11. Referencia al prototipo

**Pantalla asociada:** P-02 – Asignación de ambulancia y personal.

Esta pantalla deberá representar la consulta de recursos, la selección de ambulancia, la selección del personal operativo y la confirmación de la asignación.

## 12. Trazabilidad

| Artefacto | Referencia |
|---|---|
| Requisitos funcionales | RF-17, RF-18 |
| Caso de uso | CU-11 |
| Caso de uso incluido | CU-07 – Consultar disponibilidad de recursos |
| Diagrama de actividades | DA-02 – Asignar ambulancia y personal |
| Pantalla | P-02 – Asignación de ambulancia y personal |
| Modelo de dominio | Ambulancia, Personal, Servicio, Asignacion y AsignacionPersonal (MD-01, secciones 4 y 5) |
| Modelo ER | AMBULANCIA, PERSONAL, SERVICIO, ASIGNACION y ASIGNACION_PERSONAL (MER-01, secciones 4 a 7) |

## 13. Observaciones de verificación

Este caso de uso se elaboró tomando como referencia la línea base de requisitos y casos de uso de G1-P1. Las restricciones específicas de selección de ambulancias, composición del personal, validaciones de compatibilidad y reglas de asignación deberán contrastarse con los artefactos consolidados antes de considerar el caso de uso validado.
