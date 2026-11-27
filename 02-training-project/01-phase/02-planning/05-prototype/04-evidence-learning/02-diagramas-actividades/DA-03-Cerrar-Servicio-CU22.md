# DA-03 – Cerrar servicio (CU-22)

**Actores/carriles:** Coordinador operativo y Sistema SIGMAVITAL.
**Inicio y fin:** inicia al seleccionar un servicio finalizado; termina con cierre confirmado o con el servicio conservando su estado previo.
**Decisiones y guardas:** `[sí]`, `[no]`, `[corregir]`, `[cancelar]`, `[reintento]`. Cada salida de decisión identifica su condición.
**Flujos alternativos:** datos incompletos, corrección de información y regla de cierre que impide continuar.
**Excepción:** error persistente de guardado; no se confirma el cierre ni se altera el estado previo.

## Fuentes y exportaciones

- `DA-03-Cerrar-Servicio-CU22.puml`: fuente PlantUML editable con carriles explícitos.
- `DA-03-Cerrar-Servicio-CU22.dot`: fuente Graphviz de la representación de carriles y decisiones.
- `DA-03-Cerrar-Servicio-CU22.svg` y `.png`: exportaciones gráficas.

## Trazabilidad

CU-22; RF-31; modelo de dominio `Servicio`, `Intervencion`, `Paciente` y `RegistroCierre`; modelo de datos `Servicio`, `Intervencion`, `Paciente` y `RegistroCierre`; pantalla P-03.

**Nota de alcance:** el diagrama describe el flujo esperado de diseño. No acredita que el flujo esté implementado o probado en un sistema desplegado.
