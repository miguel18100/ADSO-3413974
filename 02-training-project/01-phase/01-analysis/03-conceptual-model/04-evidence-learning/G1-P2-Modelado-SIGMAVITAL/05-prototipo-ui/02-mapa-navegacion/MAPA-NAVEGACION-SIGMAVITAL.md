# Mapa de Navegación – Prototipo SIGMAVITAL

**Artefacto:** Mapa de navegación  
**Archivo HTML:** [SIGMAVITAL-Prototipo-v01.html](../01-mockups/SIGMAVITAL-Prototipo-v01.html)

## Estructura principal por rol

1. **Tablero Operativo (`CU-10`)**: vista inicial con indicadores de unidades `TAB`/`TAM` disponibles, servicios activos y alertas de vencimientos (`RF-028`, `RF-029`).
2. **`P-01` – Registro de Solicitudes (`CU-08`)**: recepción de evento, coordenadas GPS, prioridad clínica y acceso extendido a `Pacientes (CU-09)`.
3. **`P-02` – Despacho y Asignación (`CU-11`)**: inclusión obligatoria de disponibilidad (`CU-06`), sugerencia <= 2 s y asignación manual con motivo obligatorio (`RN-007`).
4. **`P-03` – Cierre Formal del Servicio (`CU-14`)**: validación de campos obligatorios `RN-005`, liberación de recursos y emisión de factura inmutable (`CU-15`).
5. **Módulos complementarios**: Flota y Propietarios (`CU-04`), Personal y Jornadas (`CU-05`), Novedades (`CU-13`), Facturación y Cartera (`CU-15`), PQRS y Visitantes (`CU-16/CU-17`), Documentos y Auditoría (`CU-18/CU-19`).

## Flujo crítico verificado

`Tablero (CU-10)` -> `P-01 Solicitudes (CU-08)` -> `P-02 Asignación (CU-11)` -> `P-03 Cierre Formal (CU-14)` -> `Factura / Auditoría (CU-15 / CU-19)`
