# CU-14 – Realizar cierre formal del servicio

## 1. Identificación

| Campo | Descripción |
|---|---|
| **ID** | CU-14 |
| **Nombre** | Realizar cierre formal del servicio |
| **Proyecto** | SIGMAVITAL – Sistema Gestor de Ambulancias (SGA) |
| **Actor principal** | Paramédico / Tripulación |
| **Actores secundarios** | Coordinador operativo, Sistema Automático SGA |
| **Requisitos relacionados** | RF-025, RF-031, RN-005, RN-010, RN-014 |
| **Relación estructural** | Incluye obligatoriamente `CU-15 Gestionar facturación, cartera y movimientos financieros` (`«include»`) |
| **Pantalla asociada** | `P-03` – Cierre formal REPS del servicio |
| **Diagrama de actividades** | [DA-03 – Cerrar servicio](../02-diagramas-actividades/DA-03-Cerrar-Servicio-CU14.md) |
| **Prioridad** | Alta |

## 2. Objetivo

Consolidar los datos clínicos y operativos mínimos exigidos al concluir una atención o traslado prehospitalario para cerrar formalmente el servicio, liberar los recursos asistenciales y disparar la emisión automática de la factura inmutable.

## 3. Actores

- **Actor principal:** Paramédico / Tripulación (responsable directo del cierre asistencial).
- **Actores secundarios:** Coordinador operativo (supervisión) y Sistema Automático SGA (validación RN-005, liberación y facturación).

## 4. Precondiciones

1. El usuario responsable se encuentra autenticado y autorizado sobre el servicio.
2. El servicio se encuentra en un estado operativo que habilita cierre (`En atención` o `Traslado`).
3. Las intervenciones prehospitalarias realizadas ya han sido registradas.

## 5. Disparador

Concluida la entrega del paciente o finalización asistencial, el responsable abre la ficha de cierre `P-03` y selecciona **Registrar cierre**.

## 6. Flujo principal

| Paso | Responsable | Acción |
|---|---|---|
| 1 | Paramédico / Tripulación | Selecciona el servicio activo pendiente de cierre en `P-03`. |
| 2 | Sistema | Presenta el resumen del servicio, unidad asignada, paciente vinculado e intervenciones previas. |
| 3 | Paramédico / Tripulación | Registra los cuatro campos obligatorios de cierre: resultado de la atención, estado final del paciente, destino de traslado y responsable de la atención (RF-025, RN-005). |
| 4 | Paramédico / Tripulación | Agrega observaciones finales y solicita confirmar cierre (con confirmación explícita requerida por RNF-007). |
| 5 | Sistema | Valida que ninguno de los cuatro campos obligatorios esté vacío y que el estado actual habilite la transición a `Finalizado`. |
| 6 | Sistema | Registra el cierre formal y la transición cronológica en el historial del servicio. |
| 7 | Sistema | Libera automáticamente la ambulancia y los integrantes de la tripulación pasando su estado a `Disponible`. |
| 8 | Sistema | Ejecuta `CU-15 («include»)` emitiendo la factura automática inmutable vinculada al servicio, paciente y unidad (RF-031, RN-014). |
| 9 | Sistema | Registra el evento en el módulo de auditoría inmutable (RN-010) y confirma el número de cierre y factura al usuario. |

## 7. Flujos alternativos

### A1. Cancelación previa del servicio antes de iniciar ruta (`RN-006`)
- **A1.1** Si el servicio aún está en estado `Solicitado` o `Asignado`, el coordinador puede solicitar cancelación desde seguimiento (`CU-12`) registrando justificación obligatoria.
- **A1.2** Si el servicio ya pasó a `En ruta`, `En atención` o `Traslado`, el sistema prohíbe cancelar y exige registrar una novedad operativa (`CU-13`) para documentar la interrupción.

### A2. Usuario cancela la ventana de confirmación explícita (RNF-007)
- **A2.1** En el paso 4, antes de aprobar el diálogo de confirmación, el responsable cancela la acción.
- **A2.2** El servicio conserva su estado activo para completar o corregir datos antes de un cierre definitivo.

## 8. Flujos de excepción

### E1. Campos obligatorios de cierre incompletos (RN-005)
- **E1.1** En el paso 5, falta resultado de atención, estado final del paciente, destino de traslado o responsable.
- **E1.2** El sistema bloquea el cierre, señala cada campo faltante y recuerda el cumplimiento obligatorio de RN-005.

### E2. Incidencia al generar el cierre o la factura vinculada
- **E2.1** Si falla la persistencia del cierre o la generación contable vinculada, el sistema revierte la transacción para no dejar un servicio cerrado sin respaldo financiero ni unidades bloqueadas.

## 9. Postcondiciones

- **Éxito:** el servicio pasa a estado `Finalizado`, `RegistroCierre` queda grabado, unidad y tripulación vuelven a `Disponible`, la `Factura` inmutable queda emitida y el evento figura en `Auditoria`.
- **Fallo:** el servicio conserva su estado previo sin facturación huérfana ni cambios inconsistentes.

## 10. Reglas de negocio aplicables

- **RN-005:** prohibición estricta de cierre sin resultado, estado final del paciente, destino y responsable.
- **RN-006:** prohibición de cancelar servicios ya iniciados (`En ruta`, `En atención`, `Traslado`); uso obligatorio de novedad operativa.
- **RN-014:** inmutabilidad inmediata de la factura emitida al cierre (correcciones posteriores solo mediante nota crédito/débito).
