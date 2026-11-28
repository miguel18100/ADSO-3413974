# CHECKLIST-01 – Lista de Verificación Integral (G1-P2 SIGMAVITAL)

**Responsable:** `miguel18100` · **Fecha de cierre:** 2026-11-28 · **Resultado:** **24 / 24 criterios aprobados (100 %)**

| ID | Dimensión | Criterio verificable de aceptación | Evidencia de respaldo | Cumple |
|---|---|---|---|---|
| CHK-01 | Casos de uso | Los 3 flujos críticos (`CU-08`, `CU-11`, `CU-14`) coinciden exactamente con los IDs de G1-P1 | [01-casos-uso-extendidos](../01-casos-uso-extendidos/CU-08-Registrar-Solicitud-Servicio.md) | Sí |
| CHK-02 | Casos de uso | Cada caso extendido contiene >= 6 pasos principales, precondiciones y postcondiciones de éxito/fallo | `CU-08`, `CU-11`, `CU-14` | Sí |
| CHK-03 | Casos de uso | Cada caso extendido documenta flujos alternativos y flujos de excepción sin nombres de código ni SQL | `CU-08`, `CU-11`, `CU-14` | Sí |
| CHK-04 | Casos de uso | Los flujos reflejan `RN-001..007`, `RN-010` y `RN-014` | Secciones 7, 8 y 10 de `CU-11/CU-14` | Sí |
| CHK-05 | Actividades | Existen `DA-01`, `DA-02` y `DA-03` con fuente editable `.drawio`, `.svg` y `.png` sin cortes de texto | [02-diagramas-actividades](../02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.svg) | Sí |
| CHK-06 | Actividades | Todos los `DA` poseen nodos inicio, fin doble círculo y carriles legibles sin recorte | `DA-01`, `DA-02`, `DA-03` | Sí |
| CHK-07 | Actividades | Toda ramificación en rombo tiene condición de guarda entre corchetes `[...]` | `DA-01..03` | Sí |
| CHK-08 | Actividades | `DA-02` y `DA-03` incorporan barras de bifurcación y unión concurrente (`Fork/Join`) | `DA-02`, `DA-03` | Sí |
| CHK-09 | Dominio | `MD-01` posee diagrama `.drawio` y `.svg` propios fieles al documento Markdown | [MD-01-Modelo-Dominio.svg](../03-modelo-dominio/MD-01-Modelo-Dominio.svg) | Sí |
| CHK-10 | Dominio | Ninguna clase conceptual en `MD-01` contiene métodos ni tipos técnicos de BD (`VARCHAR`, `INT`, FK) | [MD-01-Modelo-Dominio-SIGMAVITAL.md](../03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md) | Sí |
| CHK-11 | Dominio | Incluye herencia conceptual (`Ambulancia -> TAB/TAM`), clase de asociación y multiplicidades en ambos extremos | `MD-01` | Sí |
| CHK-12 | MER | `MER-01` declara explícitamente notación Crow's Foot y coincide 1:1 con `.drawio/.svg` | [MER-01-Modelo-Entidad-Relacion.svg](../04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion.svg) | Sí |
| CHK-13 | MER | Incluye entidad débil identificadora (`HistorialEstadoServicio`) y descomposición N:M (`AsignacionPersonal`) | `MER-01` | Sí |
| CHK-14 | MER | Cubre las 25 entidades requeridas por los 65 RF del SRS (flota, finanzas, visitantes, PQRS, documentos, auditoría) | `MER-01` | Sí |
| CHK-15 | Prototipo UI | El prototipo HTML funciona de forma navegable e identifica explícitamente `P-01`, `P-02` y `P-03` | [SIGMAVITAL-Prototipo-v01.html](../05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html) | Sí |
| CHK-16 | Prototipo UI | `P-02` valida motivo manual (`RN-007`) y `P-03` exige los 4 campos obligatorios (`RN-005`) | `SIGMAVITAL-Prototipo-v01.html` | Sí |
| CHK-17 | Prototipo UI | Existen mapa de navegación y especificación de diseño alineados a `RNF-016..020` | [MAPA-NAVEGACION](../05-prototipo-ui/02-mapa-navegacion/MAPA-NAVEGACION-SIGMAVITAL.md) | Sí |
| CHK-18 | Cobertura SRS | Trazabilidad 100 % de los **65 / 65 RF** sin requisitos huérfanos ni saltos | [MATRIZ-TRAZABILIDAD](../07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md) | Sí |
| CHK-19 | Cobertura SRS | Trazabilidad de los **29 RNF** y **18 RN** dentro del análisis e informe | [INFORME-ANALISIS](../08-informe-analisis/INFORME-ANALISIS-P2-SIGMAVITAL.md) | Sí |
| CHK-20 | Consistencia | Paridad exacta entre matriz, casos extendidos, actividades, `MD-01`, `MER-01` y UI | Validación cruzada | Sí |
| CHK-21 | Limpieza | Cero archivos `.bak*` o duplicados en otra fase (`02-planning/05-prototype`) | Inspección del árbol | Sí |
| CHK-22 | Privacidad | Cero datos personales reales o rutas locales privadas de equipo | Revisión documental | Sí |
| CHK-23 | Calidad visual | Todos los `.drawio` y `.svg` se exportaron directamente garantizando 0 solapes y paridad 1:1 | Revisión visual SVG/PNG | Sí |
| CHK-24 | Iteración | Se documentaron 6 hallazgos Antes/Después y segunda verificación cerrada en `REG-01` | [REG-01](../05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md) | Sí |
