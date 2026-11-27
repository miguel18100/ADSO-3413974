# DA-02 – Asignar ambulancia y personal (CU-11)

**Actores/carriles:** Coordinador operativo y Sistema SIGMAVITAL.
**Inicio y fin:** inicio al seleccionar el servicio; termina con asignación confirmada o con servicio conservado como pendiente.
**Decisiones y guardas:** `[sí]`, `[no]`, `[corregir]`, `[no corregir]`, `[reintento]`. Cada salida de decisión identifica su condición.
**Flujos alternativos:** no hay recursos; reconsulta; recursos incompatibles/cambiados; modificación de selección.
**Excepción:** fallo persistente al guardar; el sistema no confirma la asignación y conserva la solicitud pendiente.

## Fuentes y exportaciones

- `DA-02-Asignar-Ambulancia-CU11.puml`: fuente PlantUML editable con carriles explícitos.
- `DA-02-Asignar-Ambulancia-CU11.dot`: fuente Graphviz de la representación de carriles y decisiones.
- `DA-02-Asignar-Ambulancia-CU11.svg` y `.png`: exportaciones gráficas.

## Trazabilidad

CU-11; RF-17 y RF-18; modelo de dominio `Ambulancia`, `Personal`, `Servicio`, `Asignacion` y `AsignacionPersonal`; modelo de datos `Ambulancia`, `Personal`, `Servicio`, `Asignacion` y `AsignacionPersonal`; pantalla P-02.

**Nota de alcance:** el diagrama describe el flujo esperado de diseño. No acredita que el flujo esté implementado o probado en un sistema desplegado.
