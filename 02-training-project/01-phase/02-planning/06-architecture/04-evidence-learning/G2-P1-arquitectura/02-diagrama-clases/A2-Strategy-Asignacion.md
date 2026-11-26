# A2 - Diseño de estrategia de asignación

## Interfaz: EstrategiaAsignacion

**Responsabilidad:** Definir el contrato para evaluar y seleccionar recursos de ambulancia según criterios de asignación.

### Operaciones

- +seleccionarAmbulancia(ambulancias: List<Ambulancia>, solicitud: Solicitud): Ambulancia
- +evaluar(ambulancia: Ambulancia, solicitud: Solicitud): Boolean

## Implementación: EstrategiaAsignacionUrgente

**Responsabilidad:** Aplicar criterios de evaluación de recursos para solicitudes clasificadas como urgentes, respetando la disponibilidad y las reglas operativas definidas.

### Operaciones

- +seleccionarAmbulancia(ambulancias: List<Ambulancia>, solicitud: Solicitud): Ambulancia
- +evaluar(ambulancia: Ambulancia, solicitud: Solicitud): Boolean

## Implementación: EstrategiaAsignacionGeneral

**Responsabilidad:** Aplicar criterios de selección para solicitudes generales, considerando disponibilidad y criterios operativos establecidos.

### Operaciones

- +seleccionarAmbulancia(ambulancias: List<Ambulancia>, solicitud: Solicitud): Ambulancia
- +evaluar(ambulancia: Ambulancia, solicitud: Solicitud): Boolean

## Relación

- EstrategiaAsignacionUrgente implementa EstrategiaAsignacion.
- EstrategiaAsignacionGeneral implementa EstrategiaAsignacion.
- Asignacion utiliza EstrategiaAsignacion como abstracción para delegar la evaluación o selección del recurso.

## Patrón propuesto

**Strategy (Estrategia).**

Este patrón permite encapsular criterios de asignación que pueden variar sin modificar directamente la clase que coordina la asignación. La selección de una estrategia concreta deberá definirse mediante reglas operativas que aún requieren validación.

## Limitaciones

No se afirma que el algoritmo de asignación automática esté implementado. Las estrategias representan un diseño propuesto para encapsular criterios diferenciados de selección.

## Estado
Diseño de Strategy incorporado y revisado en el diagrama UML A2. Las reglas operativas y la implementación del algoritmo de asignación permanecen pendientes de validación en etapas posteriores.

