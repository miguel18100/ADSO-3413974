# A3 – Selección y Justificación de Patrones de Diseño – SIGMAVITAL

## 1. Resumen de patrones aplicados

| Patrón | Categoría GoF / Empresarial | Clases participantes en `A2` | Requisitos resueltos |
|---|---|---|---|
| **Strategy** | Comportamiento | `EstrategiaAsignacion`, `EstrategiaAsignacionUrgente`, `EstrategiaAsignacionGeneral`, `Asignacion` | `RF-022`, `RF-023`, `RNF-009` (`<= 2 s`), `RN-002` |
| **Facade** | Estructural | `GestionServicioFacade`, `Solicitud`, `Servicio`, `Asignacion`, `RegistroCierre`, `Factura`, `Auditoria` | `RF-021..025`, `RF-031`, `RNF-016` (`<= 4 pasos`), `RNF-025` |
| **Repository (`IRepositorioDatos`)** | Arquitectura / Persistencia | `IRepositorioDatos` implementado en capa de infraestructura Laravel/MySQL | `RNF-025`, `RNF-027`, separación de responsabilidades |

## 2. Justificación técnica y mantenibilidad

1. **Strategy (`EstrategiaAsignacion`):** evita condicionales rígidos `if/else` en `Asignacion` al separar las reglas de prioridad clínica crítica (`EstrategiaAsignacionUrgente`, priorizando ambulancias TAM y cercanía) de traslados estándar (`EstrategiaAsignacionGeneral`). Permite incorporar futuras reglas geográficas GPS (`RNF-027`) sin modificar los controladores.
2. **Facade (`GestionServicioFacade`):** encapsula las transacciones coordinadas entre múltiples entidades —por ejemplo, cerrar formalmente `RegistroCierre`, liberar flota y disparar `Factura` inmutable más `Auditoria` en una sola transacción ACID— manteniendo los controladores HTTP Laravel livianos y legibles.
3. **Repository (`IRepositorioDatos`):** desacopla las reglas de negocio de las consultas SQL concretas sobre MySQL/InnoDB, facilitando pruebas unitarias aisladas y cumplimiento del principio de única responsabilidad.
