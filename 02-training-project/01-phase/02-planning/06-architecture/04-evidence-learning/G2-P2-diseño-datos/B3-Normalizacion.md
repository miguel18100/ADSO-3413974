# B3 – Proceso Formal de Normalización (0FN -> 1FN -> 2FN -> 3FN) – SIGMAVITAL

## 1. Caso 1 · Planilla Operativa de Despacho y Tripulación (`DespachoAmbulanciaRaw`)

### 1.1 Estado inicial no normalizado (0FN)
```
DespachoAmbulanciaRaw(
  id_asignacion, fecha_asignacion, criterio, asignacion_manual, motivo_manual,
  id_servicio, estado_servicio, id_paciente, nombre_pac, telefonos_pac_csv,
  id_ambulancia, placa, tipo_unidad, num_reps, id_propietario, razon_prop, nit_prop,
  tripulantes_csv [id_personal, nombre_pers, perfil, tarjeta_prof, funcion]
)
```
- **Problemas detectados:** grupos repetitivos en `telefonos_pac_csv` y `tripulantes_csv`, valores no atómicos y transitividad desde `placa` hacia `id_propietario`.

### 1.2 Primera Forma Normal (1FN – Atomicidad)
Se eliminan los grupos repetitivos separando:
- `PacienteTelefono(id_telefono, id_paciente, telefono, etiqueta)`
- Tabla plana `AsignacionTripulante(id_asignacion, id_personal, placa, tipo_unidad, id_propietario, razon_prop, nombre_pers, tarjeta_prof, funcion, fecha_asignacion)` con clave compuesta `(id_asignacion, id_personal)`.

### 1.3 Segunda Forma Normal (2FN – Eliminación de dependencias parciales)
Sobre la clave compuesta `(id_asignacion, id_personal)`:
- `nombre_pers`, `tarjeta_prof` dependen **solo de `id_personal`** -> se trasladan a `Personal(id_personal, ...)`.
- `fecha_asignacion`, `id_ambulancia`, `placa`, `id_propietario`, `razon_prop` dependen **solo de `id_asignacion`** -> permanecen en `Asignacion` y `Ambulancia`.
- En la tabla asociativa `AsignacionPersonal(id_asignacion_personal, id_asignacion, id_personal, funcion, fecha_hora_vinculacion)` únicamente subsisten atributos dependientes de la pareja completa.

### 1.4 Tercera Forma Normal (3FN – Eliminación de dependencias transitivas)
- `id_asignacion -> id_ambulancia -> id_propietario -> razon_social_prop`: se extrae `PropietarioUnidad(id_propietario, identificacion, nombre_razon_social, ...)` dejando únicamente `FK id_propietario` en `Ambulancia`.
- `id_servicio -> id_paciente -> nombre_completo, identificacion`: permanecen en `Paciente`, referenciado desde `Servicio(id_servicio, id_paciente)`.

---

## 2. Caso 2 · Comprobante Consolidado de Cierre, Facturación y Contratos (`LiquidacionFinancieraRaw`)

### 2.1 Estado inicial no normalizado (0FN)
```
LiquidacionFinancieraRaw(
  id_servicio, fecha_cierre, resultado_atencion, destino_traslado, responsable,
  id_usuario_cierre, nombre_usuario, correo_usuario, id_rol, nombre_rol,
  id_factura, numero_factura, valor_total, dias_mora,
  ajustes_notas_csv [id_nota, tipo_nota, valor_ajuste, motivo]
)
```

### 2.2 Primera Forma Normal (1FN)
Se separan las repeticiones de notas crédito/débito en `NotaContable(id_nota, id_factura, id_usuario, tipo_nota, valor_ajuste, motivo, fecha_emision)`.

### 2.3 Segunda Forma Normal (2FN)
Se asegura que `RegistroCierre` (`PK id_cierre, UK id_servicio`) y `Factura` (`PK id_factura, UK id_servicio`) contengan exclusivamente atributos dependientes de su clave primaria completa.

### 2.4 Tercera Forma Normal (3FN)
- Dependencia transitiva `id_usuario_cierre -> id_rol -> nombre_rol, descripcion`: se aísla en `Rol(id_rol, nombre, descripcion)` y `Usuario(id_usuario, id_rol, ...)`.
- `id_contrato -> id_proveedor -> nit, razon_social`: se separa en `Proveedor` y `ContratoProveedor`.

## 3. Verificación global de 3FN en las 25 tablas finales

- **Cero atributos multivaluados (`1FN`):** `PacienteTelefono` y tablas atómicas.
- **Cero dependencias parciales (`2FN`):** en tablas con clave compuesta/candidata (`HistorialEstadoServicio`, `AsignacionPersonal`), cada columna no clave depende de toda la clave.
- **Cero dependencias transitivas (`3FN`):** roles, propietarios, proveedores, categorías y cierres están desacoplados en sus entidades propietarias.
