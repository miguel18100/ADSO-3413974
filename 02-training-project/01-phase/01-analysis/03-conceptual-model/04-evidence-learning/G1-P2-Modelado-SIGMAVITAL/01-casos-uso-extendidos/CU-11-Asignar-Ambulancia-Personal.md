# CU-11 – Asignar ambulancia y personal al servicio

## 1. Identificación

| Campo | Descripción |
|---|---|
| **ID** | CU-11 |
| **Nombre** | Asignar ambulancia y personal al servicio |
| **Proyecto** | SIGMAVITAL – Sistema Gestor de Ambulancias (SGA) |
| **Actor principal** | Coordinador operativo |
| **Actor secundario** | Sistema Automático SGA |
| **Requisitos relacionados** | RF-022, RF-023, RN-001, RN-002, RN-003, RN-004, RN-007 |
| **Relación estructural** | Incluye obligatoriamente `CU-06 Consultar disponibilidad y vigencia de recursos` (`«include»`) |
| **Pantalla asociada** | `P-02` – Despacho y asignación de recursos |
| **Diagrama de actividades** | [DA-02 – Asignar ambulancia](../02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.md) |
| **Prioridad** | Alta |

## 2. Objetivo

Asignar de manera ágil una ambulancia habilitada (TAB o TAM) y su tripulación operativa disponible a un servicio en curso, combinando sugerencia automática oportuna y posibilidad de selección manual justificada conforme a las reglas operativas y de habilitación REPS.

## 3. Actores

- **Actor principal:** Coordinador operativo.
- **Actor secundario:** Sistema Automático SGA (cálculo de sugerencia en <= 2 s y bloqueo de unidades/personal no habilitados).

## 4. Precondiciones

1. El coordinador operativo ha iniciado sesión con permisos de despacho.
2. Existe un servicio en estado `Solicitado` listo para recibir asignación.
3. Existen ambulancias y personal operativo registrados en SIGMAVITAL.

## 5. Disparador

El coordinador selecciona un servicio pendiente desde el tablero operativo o pantalla `P-02` y pulsa **Asignar recursos**.

## 6. Flujo principal

| Paso | Responsable | Acción |
|---|---|---|
| 1 | Coordinador operativo | Selecciona el servicio pendiente de despacho. |
| 2 | Sistema | Ejecuta `CU-06 («include»)` filtrando ambulancias en estado `Disponible` con SOAT, revisión técnico-mecánica y REPS vigentes (RN-001, RN-003). |
| 3 | Sistema | Filtra personal operativo `Disponible` con certificaciones vigentes y dentro del límite de jornada continua (RN-004). |
| 4 | Sistema | Calcula y presenta en un máximo de 2 segundos la unidad TAB/TAM y tripulación sugerida según prioridad clínica y proximidad (RF-022, RNF-009). |
| 5 | Coordinador operativo | Revisa la sugerencia automática y selecciona la tripulación complementaria requerida (conductor y paramédico). |
| 6 | Coordinador operativo | Confirma la asignación sugerida. |
| 7 | Sistema | Verifica nuevamente en transacción única que ni la unidad ni el personal hayan sido asignados a otro servicio simultáneo ni tengan vencimientos (RN-001, RN-003, RN-004). |
| 8 | Sistema | Registra la asignación, vincula la tripulación, cambia la unidad y personal a `En servicio`, actualiza el servicio a `Asignado` y graba la auditoría inmutable (RN-010). |
| 9 | Sistema | Emite la confirmación de despacho e informa al personal asignado. |

## 7. Flujos alternativos

### A1. Asignación manual que reemplaza la sugerencia automática (RF-023, RN-007)
- **A1.1** En el paso 5, el coordinador decide seleccionar otra unidad habilitada diferente a la propuesta automática por condiciones operativas en vía.
- **A1.2** El sistema habilita el selector manual excluyendo unidades bloqueadas (RN-001, RN-003) y solicita el campo obligatorio **Motivo de asignación manual** (RN-007).
- **A1.3** Si el tipo seleccionado difiere de la prioridad clínica, muestra advertencia preventiva (RN-002).
- **A1.4** El coordinador ingresa el motivo y confirma; el flujo continúa en el paso 7.

### A2. No existen recursos habilitados disponibles en ese instante
- **A2.1** En los pasos 2 o 3, todas las ambulancias compatibles o tripulantes se encuentran `En servicio`, `En mantenimiento` o con documentos vencidos.
- **A2.2** El sistema muestra alerta crítica en el tablero indicando la carencia de flota/tripulación y mantiene el servicio en estado `Solicitado` para reintento o coordinación externa.

## 8. Flujos de excepción

### E1. Confirmación manual sin motivo obligatorio (RN-007)
- **E1.1** En el alternativo A1, el coordinador intenta confirmar una asignación manual dejando el motivo vacío.
- **E1.2** El sistema bloquea el registro e indica que la justificación es obligatoria para auditoría.

### E2. Conflicto de concurrencia al confirmar
- **E2.1** En el paso 7, otro despacho asignó milisegundos antes la misma ambulancia o tripulante.
- **E2.2** El sistema aborta la operación, preserva integridad sin duplicar asignaciones y recarga la lista actualizada desde el paso 2.

## 9. Postcondiciones

- **Éxito:** la ambulancia y la tripulación quedan vinculados al servicio en estado `Asignado` con registro histórico e inalterable de auditoría.
- **Fallo:** la unidad y el personal conservan su estado previo sin doble asignación.

## 10. Reglas de negocio aplicables

- **RN-001, RN-003, RN-004:** bloqueo estricto de unidades y personal no disponibles o con documentos vencidos.
- **RN-002:** advertencia cuando la categoría TAB/TAM no corresponde a la complejidad clínica.
- **RN-007:** exigencia obligatoria de motivo registrado para toda asignación manual diferente a la sugerida.
