# REG-01 – Registro de ajustes y segunda verificación SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL
**Actividad:** G1-P2 – Modelado, prototipado y verificación
**Registro:** REG-01 – Versión 1.1
**Fecha de actualización:** 27/11/2026
**Tipo:** Revisión documental comparativa y segunda verificación de artefactos.

## 1. Propósito y método

Registrar hallazgos identificados al contrastar los artefactos P2 con la rúbrica G1, describir su corrección y ejecutar una segunda revisión de consistencia sobre los archivos modificados. La segunda verificación corresponde a inspección documental del paquete; no equivale a validación con usuarios ni prueba de ejecución del sistema.

## 2. Registro de hallazgos, antes/después y segunda verificación

| ID | Hallazgo / evidencia anterior | Antes | Después / corrección aplicada | Segunda verificación | Estado |
|---|---|---|---|---|---|
| H-01 | DA-02 no diferenciaba explícitamente las responsabilidades en particiones UML y sus ramas no mostraban todas las guardas en notación de calle. | Flujo genérico con nodos mezclados. | Se incorporaron particiones `Coordinador operativo` y `Sistema SIGMAVITAL`, decisiones con `[sí]`/`[no]`, salidas de reintento y fin sin asignación. Se añadió fuente PlantUML y exportación SVG/PNG. | Se revisó el `.puml`, el SVG y su correspondencia con A1/A2/E1 de CU-11. Se identifican ambas calles y cada salida de decisión tiene condición. | Corregido y verificado documentalmente |
| H-02 | DA-03 no mostraba claramente las calles ni separaba la cancelación del cierre de la excepción de guardado. | Flujo genérico con decisiones poco diferenciadas. | Se añadieron particiones del coordinador y sistema, validación de datos, reglas de cierre, cancelación y reintento de guardado con guardas. | Se comparó contra CU-22: información incompleta, cancelación y error de guardado tienen ruta en el diagrama; estado previo se conserva cuando no hay cierre. | Corregido y verificado documentalmente |
| H-03 | La matriz P2 registraba relaciones pendientes y no permitía calcular cobertura completa hasta clases y entidades. | Varios RF sin clase o entidad específica identificada. | Se construyó una matriz de 31 RF con CU, clase MD-01, entidad MER-01 y pantalla/módulo; RF-21 se marca parcial con explicación. | Se contó el total: 31/31 CU, 31/31 clase, 30/31 entidades completas (96,8 %); 4/4 RF de casos críticos con pantalla. | Corregido; RF-21 requiere decisión de alcance |
| H-04 | El checklist era un tablero de seguimiento sin respuestas binarias por criterio ni evidencia individual suficiente. | Estados generales “elaborado/pendiente”. | Se sustituyó por 24 criterios Sí/No, cada uno con evidencia y resultado; cuatro criterios evalúan cobertura/trazabilidad. | Se verificó conteo de 24 filas, 22 “Sí”, 2 “No” justificados y referencias a archivos concretos. | Corregido y verificado documentalmente |
| H-05 | No existía informe consolidado de una a dos páginas con interpretación de RF/RNF, modelos, resultado de verificación y ajustes. | Informe consolidado: ausente. | Se creó `INFORME-ANALISIS-P2-SIGMAVITAL.md` con requisitos interpretados, enlaces a artefactos, resultado de trazabilidad y limitaciones. | Se comprobó que el informe enlaza CU, DA, MD, MER, prototipo, checklist, matriz y registro; se declara explícitamente lo no probado. | Corregido y verificado documentalmente |
| H-06 | README de P2 no explicaba de forma suficiente la reutilización, cambios, enlaces y uso de IA. | Descripción breve de módulos y próximos pasos. | Se creó índice de evidencias, tabla de enlaces, declaración de reutilización, cambios, autoría y uso de IA. | Se verificó que los enlaces relativos apuntan a los archivos existentes y que las limitaciones del prototipo se expresan sin sobreafirmar. | Corregido y verificado documentalmente |

## 3. Iteración visual anterior

La comparación entre `SIGMAVITAL-Prototipo-v01-backup.html` y `SIGMAVITAL-Prototipo-v01.html` identificó la sustitución de emojis por iconografía SVG y una mayor consistencia visual. Esa modificación se conserva como evolución visual, pero no se presenta como prueba formal de usabilidad.

## 4. Criterios de segunda verificación

1. El archivo corregido existe y abre como texto UTF-8.
2. Las referencias internas y los enlaces relativos resuelven a artefactos existentes.
3. Las ramas de DA-02/DA-03 coinciden con los flujos alternos y de excepción de sus plantillas.
4. La matriz tiene 31 requisitos y declara el porcentaje de cobertura con RF-21 como parcial.
5. El checklist contiene al menos 15 criterios con respuesta Sí/No y evidencia por fila.
6. El informe identifica modelos, verificaciones, cambios y limitaciones.

## 5. Resultado y límites

Se documentan seis hallazgos, sus estados anteriores, correcciones y segunda verificación. La inspección no acredita pruebas con usuarios, accesibilidad, backend, persistencia ni aceptación del instructor. RF-21 permanece como decisión de alcance pendiente.

---

**SENA – ADSO – Ficha 3413974**
