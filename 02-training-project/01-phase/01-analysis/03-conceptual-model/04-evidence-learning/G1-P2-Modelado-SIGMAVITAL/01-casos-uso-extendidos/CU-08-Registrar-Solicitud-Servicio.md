# CU-08 – Registrar solicitud de servicio y clasificar prioridad

## 1. Identificación

| Campo | Descripción |
|---|---|
| **ID** | CU-08 |
| **Nombre** | Registrar solicitud de servicio y clasificar prioridad |
| **Proyecto** | SIGMAVITAL – Sistema Gestor de Ambulancias (SGA) |
| **Actor principal** | Coordinador operativo |
| **Actor secundario** | Sistema Automático SGA |
| **Requisitos relacionados** | RF-021, RN-002 |
| **Pantalla asociada** | `P-01` – Registro y triage de solicitudes |
| **Diagrama de actividades** | [DA-01 – Registrar solicitud](../02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.md) |
| **Prioridad** | Alta |

## 2. Objetivo

Permitir al coordinador operativo registrar una nueva solicitud de servicio prehospitalario con la información del evento, los datos del solicitante y la clasificación de prioridad clínica inicial para habilitar la creación y despacho oportuno del servicio.

## 3. Actores

- **Actor principal:** Coordinador operativo.
- **Actor secundario:** Sistema Automático SGA (validación de completitud y consistencia clínica).

## 4. Precondiciones

1. El coordinador operativo ha iniciado sesión con un perfil autorizado.
2. El módulo de gestión de solicitudes se encuentra operativo.
3. Los catálogos de tipos de emergencia y niveles de prioridad clínica (`Verde`, `Amarillo`, `Naranja`, `Rojo`) están configurados.

## 5. Disparador

Se recibe una llamada o requerimiento de traslado/emergencia y el coordinador selecciona **Nueva solicitud**.

## 6. Flujo principal

| Paso | Responsable | Acción |
|---|---|---|
| 1 | Coordinador operativo | Accede al módulo de registro de solicitudes (`P-01`). |
| 2 | Sistema | Presenta el formulario estructurado de recepción de evento. |
| 3 | Coordinador operativo | Ingresa fecha/hora de solicitud, dirección o coordenadas geográficas, tipo de emergencia y datos del solicitante. |
| 4 | Coordinador operativo | Clasifica la prioridad clínica inicial (`Verde`, `Amarillo`, `Naranja` o `Rojo`) y solicita guardar. |
| 5 | Sistema | Verifica que todos los campos obligatorios tengan información completa y coherente. |
| 6 | Sistema | Evalúa la correspondencia preliminar entre la prioridad clínica y el nivel de atención requerido (RN-002). |
| 7 | Sistema | Registra la solicitud con estado `Solicitado`, origina el servicio pendiente y guarda la trazabilidad inicial en auditoría. |
| 8 | Sistema | Muestra el identificador generado de la solicitud y habilita el acceso al despacho (`CU-11`). |

## 7. Flujos alternativos

### A1. Asociación inmediata de datos del paciente (`«extend» CU-09`)
- **A1.1** En el paso 4, si el informante suministra identificación o estado clínico inicial del paciente, el coordinador activa el registro de paciente.
- **A1.2** Se invoca la extensión `CU-09` para vincular paciente con el servicio originado.
- **A1.3** El flujo retorna al paso 7 del flujo principal.

### A2. Advertencia por correspondencia prioridad vs unidad solicitada (RN-002)
- **A2.1** En el paso 6, el sistema detecta que la prioridad clínica sugerida requiere atención medicalizada y el tipo preliminar indica traslado básico.
- **A2.2** El sistema muestra una alerta preventiva al coordinador para confirmar o ajustar la prioridad antes de guardar.
- **A2.3** Confirmado o ajustado el nivel, el flujo continúa en el paso 7.

## 8. Flujos de excepción

### E1. Datos obligatorios incompletos o con formato incorrecto
- **E1.1** En el paso 5, falta dirección/coordenadas, prioridad o datos mínimos del solicitante.
- **E1.2** El sistema resalta los campos faltantes con mensajes claros de acción correctiva (RNF-018) sin guardar registros parciales.
- **E1.3** El coordinador corrige la información y repite desde el paso 5.

### E2. Error de almacenamiento del registro
- **E2.1** En el paso 7, ocurre una falla que impide consolidar la solicitud.
- **E2.2** El sistema informa al coordinador que no fue posible completar el registro y mantiene los datos en pantalla para reintento seguro.

## 9. Postcondiciones

- **Éxito:** la solicitud queda registrada en estado `Solicitado`, vinculada al servicio originado y visible en el tablero de despacho.
- **Fallo:** no se crea solicitud incompleta ni evento fantasma en la operación.

## 10. Reglas de negocio aplicables

- **RN-002:** coherencia entre la complejidad clínica del paciente y la categoría asistencial requerida.
- **RN-010 / RNF-028:** registro cronológico inalterable del usuario y momento exacto de creación.
