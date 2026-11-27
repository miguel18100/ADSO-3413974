# CU-22 - Cerrar servicio

## 1. Identificación

| Campo | Descripción |
|---|---|
| Código | CU-22 |
| Nombre | Cerrar servicio |
| Requisito asociado | RF-31 |
| Actor principal | Coordinador operativo |
| Prioridad | Alta |

## 2. Objetivo

Permitir al coordinador operativo registrar y confirmar el cierre de un servicio de ambulancia, consolidando la información necesaria para dejar constancia de su finalización en el sistema.

## 3. Actores

- **Actor principal:** Coordinador operativo.
- **Actores secundarios:** No identificados en esta versión preliminar.

## 4. Precondiciones

- El coordinador operativo debe haber iniciado sesión.
- El servicio debe estar previamente registrado en el sistema.
- El servicio debe encontrarse en un estado que permita su cierre.
- La información operativa requerida para el cierre debe estar disponible.

## 5. Disparador

El coordinador operativo selecciona un servicio y solicita iniciar el proceso de cierre.

## 6. Flujo principal

1. El coordinador operativo ingresa al módulo de gestión de servicios.
2. El sistema presenta los servicios disponibles para consulta y gestión.
3. El coordinador selecciona el servicio que desea cerrar.
4. El sistema presenta la información registrada del servicio.
5. El coordinador revisa la información operativa y los datos asociados.
6. El coordinador ingresa o confirma la información requerida para el cierre.
7. El sistema valida los datos y las condiciones necesarias para cerrar el servicio.
8. El sistema presenta la confirmación del cierre.
9. El coordinador confirma la operación.
10. El sistema registra el cierre del servicio y actualiza su estado.
11. El sistema informa que el cierre se realizó correctamente.

## 7. Flujos alternativos

### A1. Información incompleta

1. Durante la validación, el sistema detecta que falta información requerida para el cierre.
2. El sistema informa los campos o datos pendientes.
3. El coordinador completa o corrige la información.
4. El flujo continúa desde el paso 7 del flujo principal.

### A2. El coordinador cancela el cierre

1. El coordinador decide cancelar antes de confirmar el cierre.
2. El sistema cancela la operación sin registrar el cierre.
3. El servicio conserva su estado previo.

## 8. Flujos de excepción

### E1. Error al guardar el cierre

1. El sistema presenta un error durante el registro del cierre.
2. El sistema informa que no fue posible completar la operación.
3. El sistema no confirma el cierre como exitoso.
4. El coordinador puede intentar nuevamente, según las condiciones del sistema.

## 9. Postcondiciones

### En caso de éxito

- El cierre del servicio queda registrado.
- El estado del servicio se actualiza conforme al proceso de cierre.
- La información del cierre queda disponible para consulta.

### En caso de cancelación o error

- El sistema no confirma el cierre.
- El servicio conserva el estado previo al cierre, siempre que la operación no se haya registrado.

## 10. Reglas de negocio preliminares

- El servicio debe existir y ser identificable.
- El servicio debe cumplir las condiciones definidas para permitir su cierre.
- El sistema debe validar la información requerida antes de registrar el cierre.
- El cierre debe quedar asociado al servicio correspondiente.
- El cierre debe reflejarse en el estado del servicio.

> Estas reglas son preliminares y deben contrastarse con los artefactos de P1 y las reglas de negocio documentadas.

## 11. Pantalla asociada al prototipo

| Código | Pantalla | Descripción |
|---|---|---|
| P-03 | Cierre de servicio | Interfaz para revisar la información, completar los datos requeridos y confirmar el cierre. |

## 12. Trazabilidad preliminar

| Elemento | Referencia |
|---|---|
| Requisito funcional | RF-31 |
| Caso de uso | CU-22 |
| Diagrama de actividad | DA-03 – Cerrar servicio (CU-22) |
| Prototipo | P-03 |
| Modelo de dominio | Servicio, Paciente, Intervencion y RegistroCierre (MD-01, secciones 4 y 5) |
| Modelo ER | SERVICIO, PACIENTE, INTERVENCION, REGISTRO_CIERRE y USUARIO (MER-01, secciones 4 a 6) |

## 13. Observaciones

La información, los campos obligatorios, las validaciones y las condiciones de cierre deben verificarse frente a los documentos de análisis de P1. Este caso de uso constituye una versión preliminar de diseño para la actividad de prototipado P2.

