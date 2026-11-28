# DA-02 - Diagrama de actividad: Asignar ambulancia y personal (CU-11)

**Caso de uso:** CU-11 - Asignar ambulancia y personal
**Requisitos asociados:** RF-17 y RF-18
**Actor principal:** Coordinador operativo
**Sistema participante:** SIGMAVITAL
**Pantalla asociada:** P-02
**Estado:** Diseño preliminar

## Descripción del flujo

El proceso inicia cuando el coordinador operativo selecciona un servicio que requiere asignación de recursos. El sistema consulta la disponibilidad mediante el caso de uso CU-07 y presenta las ambulancias y el personal disponibles.

El coordinador selecciona los recursos que desea asignar. El sistema verifica nuevamente su disponibilidad y las condiciones de asignación antes de permitir la confirmación. Si la selección es válida, el coordinador confirma la operación y el sistema registra la asignación asociada al servicio.

Cuando no existen recursos disponibles, el sistema informa la situación y permite realizar una nueva consulta o mantener el servicio pendiente. Si los recursos seleccionados dejan de estar disponibles o la selección debe modificarse, se permite repetir la consulta y selección.

Si ocurre un error de almacenamiento, el sistema informa que la asignación no fue confirmada y permite reintentar. No se presenta una asignación exitosa hasta que el registro se haya completado correctamente.

## Reglas y validaciones

- La asignación debe corresponder a un servicio previamente registrado.
- Los recursos seleccionados deben estar registrados y disponibles.
- La disponibilidad debe verificarse antes de confirmar la asignación.
- La asignación debe quedar asociada al servicio correspondiente.
- La consulta de disponibilidad se relaciona con CU-07.
- Ante una falla de almacenamiento, no se debe presentar confirmación de asignación.

## Fuentes y exportaciones

- `DA-02-Asignar-Ambulancia-CU11.drawio`: fuente editable del diagrama.
- `DA-02-Asignar-Ambulancia-CU11.puml`: fuente PlantUML.
- `DA-02-Asignar-Ambulancia-CU11.dot`: fuente Graphviz.
- `DA-02-Asignar-Ambulancia-CU11.png`: representación gráfica.
- `DA-02-Asignar-Ambulancia-CU11.svg`: representación vectorial.

## Trazabilidad

| Elemento | Referencia |
|---|---|
| Requisitos funcionales | RF-17 y RF-18 |
| Caso de uso | CU-11 |
| Caso de uso relacionado | CU-07 |
| Diagrama | DA-02 |
| Pantalla asociada | P-02 |
| Clases conceptuales | Ambulancia, Personal, Servicio, Asignacion, AsignacionPersonal |
| Actor principal | Coordinador operativo |

**Nota de alcance:** el diagrama describe el flujo esperado de diseño. No acredita que el flujo esté implementado o probado en un sistema desplegado.
