# A2 – Relaciones, Multiplicidades y Reglas de Diseño UML

## 1. Multiplicidades y tipos de relación verificados

| Clase origen | Mult. | Tipo de relación | Mult. | Clase destino | Sustento en SRS / Modelo de Datos |
|---|---:|---|---:|---|---|
| `Rol` | `1` | Asociación simple | `0..*` | `Usuario` | Un único rol principal persistido (`Usuario.id_rol`), alineado 100 % con `B1/B2/B5` |
| `AmbulanciaTAB / TAM` | — | Generalización (`--|>`) | — | `Ambulancia` | Especialización de categorías REPS TAB y TAM (Res. 3100/2017) |
| `EstrategiaAsignacionUrgente / General` | — | Realización (`..|>`) | — | `EstrategiaAsignacion` | Implementación intercambiable de criterios de despacho (`RF-022`) |
| `Solicitud` | `1` | Asociación | `0..1` | `Servicio` | Cada solicitud válida origina un servicio prehospitalario (`RF-021/024`) |
| `Paciente` | `1` | Asociación simple | `0..*` | `Servicio` | El paciente conserva identidad independiente del servicio (`RF-018`) |
| `Servicio` | `1` | Composición (`*--`) | `0..*` | `Intervencion` / `Asignacion` | No existen actuaciones ni despachos fuera del ciclo de un servicio |
| `Servicio` | `1` | Composición (`*--`) | `0..1` | `RegistroCierre` | Consolidación única de cierre obligatorio REPS (`RN-005`) |
| `Asignacion` | `1` | Composición (`*--`) | `1..*` | `AsignacionPersonal` | Resuelve tripulación (`Personal 1 -- 0..* AsignacionPersonal`) |
| `RegistroCierre` | `1` | Asociación | `0..1` | `Factura` | Dispara emisión contable inmutable automática al cierre (`RF-031`, `RN-014`) |
| `GestionServicioFacade` | — | Dependencia (`..>`) | — | `IRepositorioDatos`, `Servicio`, `Factura` | Desacopla controladores web de la persistencia MySQL (`Regla 5`) |
