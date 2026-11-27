# Conciliación de alcance entre el SRS y el proyecto SGA

**Evidencia:** G1-P1 - Plan de análisis y casos de uso  
**Proyecto:** Sistema Gestor de Ambulancias (SGA)  
**Fuente principal:** `SGA_SRS.pdf`  
**Fuente de contraste:** `Proyecto Sistema Gestor de ambulancia Version 2.docx`

## 1. Propósito

Registrar, sin ocultar registros ni corregir silenciosamente sus identificadores, la diferencia entre los módulos enumerados en el SRS PDF y el alcance operativo definido en el documento principal del proyecto. Esta conciliación es una propuesta documental de alcance para revisión; no se presenta como aprobación del instructor ni como acta institucional.

## 2. Evidencia del alcance del proyecto

El documento `Proyecto Sistema Gestor de ambulancia Version 2.docx` define en §§1.4-1.5 el SGA como una solución para la gestión prehospitalaria: recepción, registro, procesamiento, asignación, seguimiento y cierre de servicios; administración de ambulancias TAB/TAM, personal y pacientes; seguridad por roles; monitoreo y reportes operativos. Su §1.6 identifica como usuarios al administrador, coordinador operativo, paramédico/técnico y analista/directivo.

El `SGA_SRS.pdf` (§1.5) describe el mismo núcleo funcional y, además, indica que la solución no se integra con aseguradoras/EPS ni con plataformas de facturación. Su §1.6 enumera perfiles operativos y administrativos del SGA, pero no incluye vigilantes, residentes, visitantes, compradores ni proveedores como actores del sistema.

## 3. Conteo verificable de registros en la sección 4 del SRS

Los códigos se conservan tal como aparecen. Cuando una etiqueta RF se repite dentro del mismo módulo, cada aparición se cuenta como un registro distinto y se identifica por orden de aparición.

| Sección | Registros identificados | Propuesta de tratamiento |
|---|---:|---|
| 4.1 Gestión financiera y cartera | 10 | Propuesta de exclusión: el documento principal no define contabilidad, cartera, cobros ni facturación como procesos del SGA. El §1.5 del SRS excluye integraciones con aseguradoras/EPS y plataformas de facturación; esta última exclusión no demuestra, por sí sola, que toda función financiera interna esté descartada. |
| 4.2 Gestión de visitantes | 9 | Propuesta de exclusión: control de visitantes, vigilantes, residentes y acceso físico no aparece en los procesos ni perfiles del SGA prehospitalario. |
| 4.3 PQRS | 9 | Propuesta de exclusión: no se define flujo PQRS, categorías, responsable, plazos ni actor de atención de quejas en el alcance principal. Se conserva como posible ampliación institucional si el instructor la incorpora formalmente. |
| 4.4 Unidades | 8 | Propuesta de exclusión por discrepancia de dominio: la tabla incluye propietarios y residentes. Los registros ambiguos de clasificación/estado no se reinterpretan automáticamente como ambulancias sin aclaración de la fuente. |
| 4.5 Proveedores | 8 | Propuesta de exclusión: no se define proceso de compras, contratación, evaluación ni gestión de proveedores en §§1.4-1.6 del proyecto. |
| 4.6 Gestión documental | 21 | Incluido y trazado a CU-19 y casos transversales. |
| 4.7 Bitácora y auditoría | 20 | Incluido y trazado a CU-18 y casos que generan eventos. |
| 4.8 Novedades y bitácora operativa | 28 | Incluido y trazado a CU-14 y casos transversales. |
| **Total** | **113** | **69 trazados directamente y 44 con propuesta de exclusión individual.** |

## 4. Interpretación de la cobertura

- **Línea base operativa del proyecto:** 31/31 RF trazados a CU-01…CU-22 (100 %).
- **Módulos SRS aplicables al alcance prehospitalario según la documentación disponible:** 69/69 registros de 4.6-4.8 trazados (100 %).
- **Módulos adicionales 4.1-4.5:** 44/44 registros conservados y justificados individualmente en la sección 13.2 de `Matriz-Requisitos-Casos-Uso.md`; son propuestas de exclusión, no aprobaciones formales.
- **Lectura sin filtro de alcance:** 69/113 = 61,1 % de registros mapeados directamente; 44/113 = 38,9 % de registros no mapeados y justificados como discrepancia de alcance.

La rúbrica C3 exige que la matriz cubra al menos 90 % de los requisitos funcionales y que los no cubiertos estén justificados. Esta evidencia conserva todos los registros: 69 se mapean directamente a casos de uso y 44 se marcan, uno por uno, como propuestas de exclusión por discrepancia con el alcance del proyecto. La estimación máxima de C3 es defendible si el instructor acepta el alcance del documento principal y considera justificadas esas exclusiones. Si el instructor determina que los 44 registros sí forman parte del alcance obligatorio, habrá que ampliar la matriz y el modelo; no sería correcto inventar asociaciones o actores para forzar el porcentaje.

## 5. Registros del SRS que tienen identificadores repetidos

En las tablas fuente se observan repeticiones y saltos de numeración. Para preservar la trazabilidad se distingue la aparición por módulo y orden:

- 4.1: RF-6.1.7 aparece dos veces.
- 4.2: RF-6.2.7 aparece dos veces.
- 4.3: RF-6.3.7 aparece dos veces.
- 4.6: RF-27 y RF-37 aparecen dos veces; RF-29 y RF-39 no se observan en la tabla.
- 4.7: RF-47 y RF-57 aparecen dos veces; RF-49 y RF-59 no se observan en la tabla.
- 4.8: RF-67 y RF-77 aparecen dos veces; RF-69 y RF-79 no se observan en la tabla.

No se renumeran los requisitos en el SRS maestro desde esta evidencia. Cualquier normalización de identificadores requiere una revisión y aprobación de la línea base original.

## 6. Recomendación de cierre

Solicitar al instructor/equipo una decisión explícita sobre si las secciones 4.1-4.5 pertenecen al alcance del SGA o fueron incorporadas desde otra plantilla/sistema. Hasta recibirla, la evidencia conserva la discrepancia, la justificación por registro y la diferencia entre cobertura aplicable y cobertura bruta del PDF.
