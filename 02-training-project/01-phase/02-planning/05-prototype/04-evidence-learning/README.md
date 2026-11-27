# G1-P2 – Modelo de análisis y verificación SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL  
**Usuario de GitHub del autor:** `miguel18100`  
**Ficha:** 3413974 – Análisis y Desarrollo de Software  
**Producto:** G1-P2 – Modelo de análisis y verificación  
**Versión:** 1.2 – 27/11/2026

## 1. Objetivo y alcance

Este producto elabora y verifica los artefactos de análisis exigidos para los tres casos críticos del SGA: registrar solicitud (CU-08), asignar ambulancia y personal (CU-11) y cerrar servicio (CU-22). Se incluyen plantillas extendidas, diagramas de actividades, modelo de dominio, modelo entidad-relación, prototipo inicial, checklist diligenciado, matriz de trazabilidad, registro de ajustes e informe.

El prototipo es académico: usa datos ficticios, navegación local y formularios demostrativos. No implementa persistencia, backend ni integración con base de datos.

## 2. Índice de evidencias

| Artefacto | Evidencia |
|---|---|
| Plantillas CU-08, CU-11 y CU-22 | [01 – Casos de uso extendidos](./01-casos-uso-extendidos/) |
| DA-01 – Registrar solicitud | [Fuente Markdown/Mermaid original](./02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.md) – Se conserva como fuente textual preexistente; no se regeneró ni exportó en esta corrección. |
| DA-02 – Asignar ambulancia y personal | [Markdown](./02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.md) · [DOT](./02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.dot) · [PlantUML](./02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.puml) · [PNG](./02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.png) · [SVG](./02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.svg) – Fuente editable y exportaciones originales conservadas; no modificadas. |
| DA-03 – Cerrar servicio | [Markdown](./02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.md) · [DOT](./02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.dot) · [PlantUML](./02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.puml) · [PNG](./02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.png) · [SVG](./02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.svg) – Fuente editable y exportaciones originales conservadas; no modificadas. |
| MD-01 – Modelo de dominio | [Modelo de dominio](./03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md) |
| MER-01 – Modelo entidad-relación | [MER](./04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md) |
| Prototipo y mapa de navegación | [HTML](./05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html) · [Mapa](./05-prototipo-ui/02-mapa-navegacion/MAPA-NAVEGACION-SIGMAVITAL.md) · [Especificación](./05-prototipo-ui/03-especificacion-diseno/ESPECIFICACION-DISENO-SIGMAVITAL.md) |
| Checklist | [CHECKLIST-01](./06-checklist-verificacion/CHECKLIST-01-Verificacion-Evidencias-P2.md) |
| Matriz de trazabilidad | [MATRIZ-TRAZABILIDAD-P2](./07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md) |
| Registro de ajustes | [REG-01](./05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md) |
| Informe de análisis | [INFORME-ANALISIS-P2](./08-informe-analisis/INFORME-ANALISIS-P2-SIGMAVITAL.md) |

## 3. Reutilización de fuentes

Se reutilizó como línea base la documentación de G1-P1: caracterización, 31 requisitos funcionales, requisitos no funcionales, catálogo de casos de uso y diagrama general. También se reutilizaron los documentos y modelos del proyecto formativo SGA disponibles en el fork. Los tres casos críticos se seleccionaron para detallar los flujos principales, alternos y de excepción.

## 4. Qué ajusté en esta evidencia

| # | Artefacto | Cambio concreto y criterio atendido | Historial de la carpeta |
|---|---|---|---|
| 1 | Diagramas de actividades | Conservé las fuentes originales DA-01, DA-02 y DA-03; los dos diagramas DA-02 y DA-03 disponen de fuente editable y exportaciones originales. Se documenta la ausencia de concurrencia cuando corresponde. | [Historial DA](https://github.com/miguel18100/ADSO-3413974/commits/main/02-training-project/01-phase/01-analysis/03-conceptual-model/04-evidence-learning/G1-P2-Modelo-Analisis-Verificacion/02-diagramas-actividades/) |
| 2 | Dominio y MER | Añadí `NovedadOperativa`/`NOVEDAD_OPERATIVA` para RF-21 y corregí las claves de paciente y responsable de intervención; diferencié novedad operativa de intervención asistencial. | [Historial de modelos](https://github.com/miguel18100/ADSO-3413974/commits/main/02-training-project/01-phase/01-analysis/03-conceptual-model/04-evidence-learning/G1-P2-Modelo-Analisis-Verificacion/03-modelo-dominio/) |
| 3 | Verificación y trazabilidad | Reemplacé el checklist de seguimiento por 31 criterios con evidencia, actualicé matriz a 31/31 RF hasta entidad, completé REG-01 y el informe. | [Historial de verificación](https://github.com/miguel18100/ADSO-3413974/commits/main/02-training-project/01-phase/01-analysis/03-conceptual-model/04-evidence-learning/G1-P2-Modelo-Analisis-Verificacion/06-checklist-verificacion/) |

Los enlaces abren el historial de cada carpeta en GitHub cuando esta versión se publique; no se inventan identificadores de commits antes de realizar el commit.

## 5. Artefactos entregados

- [x] Tres plantillas extendidas, cada una con precondiciones, flujo principal, alternos, excepción y postcondiciones.
- [x] Tres fuentes de diagramas de actividades; DA-02 y DA-03 cuentan además con fuentes editables y exportaciones PNG/SVG originales. DA-01 se conserva en su formato Markdown/Mermaid original.
- [x] Modelo de dominio con doce clases conceptuales, asociaciones y multiplicidades.
- [x] MER con doce entidades, PK/FK, cardinalidades y relación N:M resuelta mediante ASIGNACION_PERSONAL.
- [x] Prototipo con pantallas rotuladas P-01/CU-08, P-02/CU-11 y P-03/CU-22.
- [x] Checklist diligenciado de 31 criterios con evidencia.
- [x] Registro de siete hallazgos, correcciones y segunda verificación.
- [x] Informe de análisis de 1–2 páginas y matriz de trazabilidad P2.

## 6. Autoría y uso de IA

La reutilización de insumos colaborativos se declara en la sección 3. La selección de casos críticos, adaptación de plantillas, actualización de modelos, diagramas, matriz, checklist, registro e informe son ajustes de esta evidencia. Se utilizó ChatGPT como apoyo para revisar coherencia documental, estructurar criterios de comprobación y proponer correcciones. El aprendiz debe revisar el resultado, ejecutar las comprobaciones en su entorno y poder explicar cada decisión; la IA no sustituye la autoría ni la sustentación.

## 7. Límites y estado de validación

La verificación documentada es interna y documental. No se afirma que se hayan realizado pruebas con usuarios, aprobación de stakeholders, accesibilidad formal, backend, persistencia ni despliegue. Las cardinalidades y reglas operativas son propuestas que deben validarse antes de implementar.

## 8. Control de publicación

La rúbrica exige cambios sustantivos propios publicados en al menos dos días distintos dentro de la ventana 21–28/11/2026. Esta carpeta se entrega preparada localmente; el historial real del fork debe verificarse después de publicar. No se ha realizado commit ni push de este paquete durante la preparación.

## 9. Conservación de diagramas

No se redibujó ni se modificó el contenido de DA-01, DA-02 o DA-03. La carpeta de diagramas se repuso desde el snapshot original para preservar sus fuentes y exportaciones. En la valoración mínima de C1 se consideran los diagramas DA-02 y DA-03, que cuentan con fuente editable y exportación visual; DA-01 se mantiene como evidencia adicional.
