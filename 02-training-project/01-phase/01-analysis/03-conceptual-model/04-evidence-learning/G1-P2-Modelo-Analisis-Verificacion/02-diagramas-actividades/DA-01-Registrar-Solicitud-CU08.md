# DA-01 - Diagrama de actividad: Registrar solicitud de servicio (CU-08)

**Caso de uso:** CU-08 - Registrar solicitud de servicio  
**Requisito asociado:** RF-12  
**Actor principal:** Coordinador operativo  
**Estado:** Diseño preliminar

## Diagrama de actividad

```mermaid
flowchart TD
    A([Inicio]) --> B

    subgraph CO["Coordinador operativo"]
        B[Acceder al módulo de solicitudes]
        D[Ingresar datos de la solicitud]
        H[Corregir información pendiente]
        I[Confirmar registro]
        M{¿Desea reintentar?}
    end

    subgraph SI["Sistema"]
        C[Presentar formulario]
        E[Validar datos ingresados]
        F{¿Datos completos y válidos?}
        G[Informar datos faltantes o errores]
        J[Guardar solicitud]
        K{¿Registro exitoso?}
        L[Informar error de almacenamiento]
        N[Generar identificador]
        O[Mostrar confirmación]
    end

    B --> C
    C --> D
    D --> E
    E --> F
    F -- "[No]" --> G
    G --> H
    H --> E
    F -- "[Sí]" --> I
    I --> J
    J --> K
    K -- "[No]" --> L
    L --> M
    M -- "[Sí]" --> I
    M -- "[No]" --> P([Fin sin registro confirmado])
    K -- "[Sí]" --> N
    N --> O
    O --> Q([Fin])
`
## Descripción

El diagrama representa el proceso de registro de una solicitud de servicio por parte del coordinador operativo. El coordinador accede al módulo, diligencia los datos y confirma la operación. El sistema valida la información y permite corregir los datos cuando se presentan inconsistencias o campos incompletos.

Cuando la información es válida, el sistema intenta guardar la solicitud. Si el almacenamiento falla, se informa al coordinador y se permite reintentar o finalizar sin confirmar el registro. Cuando el registro se completa correctamente, el sistema genera un identificador y presenta la confirmación.

## Trazabilidad

| Elemento | Referencia |
|---|---|
| Requisito funcional | RF-12 |
| Caso de uso | CU-08 |
| Diagrama | DA-01 |
| Pantalla asociada | P-01 |
| Clase conceptual principal | Solicitud |
| Actor principal | Coordinador operativo |
| Estado | Diseño preliminar |

