# DA-03 - Diagrama de actividad: Cerrar servicio (CU-22)

**Caso de uso:** CU-22 - Cerrar servicio
**Requisito asociado:** RF-31
**Actor principal:** Coordinador operativo
**Sistema participante:** SIGMAVITAL
**Pantalla asociada:** P-03
**Estado:** Diseño preliminar

## Descripción del flujo

El proceso inicia cuando el coordinador operativo selecciona un servicio que se encuentra en una condición que permite iniciar su cierre. El sistema presenta la información del servicio para su revisión.

El coordinador revisa los datos relacionados con la atención y el cierre, completa o confirma la información requerida y solicita la operación. El sistema valida la integridad de los datos y las condiciones aplicables al cierre.

Cuando la información es válida, el sistema presenta la confirmación de cierre. Una vez confirmada la operación por el coordinador, el sistema registra el cierre y actualiza el estado del servicio, mostrando la confirmación correspondiente.

Si se detectan datos incompletos o inconsistencias, el sistema informa los elementos que requieren corrección y permite retomar el proceso. Si el coordinador cancela antes de confirmar, se conserva el estado previo del servicio.

Ante un error de almacenamiento, el sistema informa que el cierre no ha sido confirmado y permite reintentar. El estado previo del servicio debe conservarse mientras no se complete el registro del cierre.

## Reglas y validaciones

- El servicio debe estar previamente registrado.
- El servicio debe encontrarse en una condición que permita realizar el cierre.
- La información requerida para el cierre debe estar completa y validada.
- El cierre debe confirmarse antes de registrar el cambio de estado.
- La cancelación previa a la confirmación conserva el estado anterior.
- Ante un error de almacenamiento, no se debe confirmar el cierre ni alterar el estado previo.

## Fuentes y exportaciones

- `DA-03-Cerrar-Servicio-CU22.drawio`: fuente editable del diagrama.
- `DA-03-Cerrar-Servicio-CU22.puml`: fuente PlantUML.
- `DA-03-Cerrar-Servicio-CU22.dot`: fuente Graphviz.
- `DA-03-Cerrar-Servicio-CU22.png`: representación gráfica.
- `DA-03-Cerrar-Servicio-CU22.svg`: representación vectorial.

## Trazabilidad

| Elemento | Referencia |
|---|---|
| Requisito funcional | RF-31 |
| Caso de uso | CU-22 |
| Diagrama | DA-03 |
| Pantalla asociada | P-03 |
| Clases conceptuales | Servicio, Intervencion, Paciente, RegistroCierre |
| Actor principal | Coordinador operativo |

**Nota de alcance:** el diagrama describe el flujo esperado de diseño. No acredita que el flujo esté implementado o probado en un sistema desplegado.
