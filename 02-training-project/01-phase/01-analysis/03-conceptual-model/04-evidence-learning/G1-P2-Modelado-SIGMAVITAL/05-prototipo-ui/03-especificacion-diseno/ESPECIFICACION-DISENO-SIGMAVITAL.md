# Especificación de Diseño de Interfaz – SIGMAVITAL

## 1. Principios de usabilidad y consistencia (RNF-016 a RNF-020)

- Flujo completo de emergencia (recepción `P-01` -> asignación `P-02`) optimizado en **<= 4 pasos** (`RNF-016`).
- Priorización visual de estados críticos (`Rojo/Naranja/Verde`), alertas documentales (`RN-003`) y etiquetas trazables `P-01`, `P-02`, `P-03` vinculadas a casos de uso extendidos y reglas de negocio.
- Mensajes de error accionables en cliente y respaldo institucional con paleta sobria azul marino (`#123b5d`), cian operativo (`#176b87`) y verde esmeralda (`#16a085`).

## 2. Mapeo de pantallas críticas

| Código | Sección HTML | Caso de uso / Flujo | Reglas visibles en interfaz |
|---|---|---|---|
| `P-01` | `#solicitudes` | `CU-08` (`DA-01`) | Prioridad clínica 4 niveles, dirección/GPS, datos del solicitante |
| `P-02` | `#asignaciones` | `CU-11` (`DA-02`) | Bloqueo de unidades vencidas (`RN-003`), validación en JS de motivo manual (`RN-007`) |
| `P-03` | `#cierres` | `CU-14` (`DA-03`) | 4 campos obligatorios REPS (`RN-005`), aviso prohibición cancelar en ruta (`RN-006`) |
