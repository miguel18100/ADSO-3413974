# CHECKLIST-01 – Verificación de evidencias G1-P2 SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL  
**Ficha:** 3413974 – ADSO  
**Producto:** G1-P2 – Modelo de análisis y verificación  
**Versión:** 1.2 – 27/11/2026  
**Alcance:** comprobación documental y estructural de los artefactos de este producto. No se presenta como prueba con usuarios, auditoría formal de accesibilidad ni aprobación del instructor.

## 1. Método

Cada criterio se responde **Sí** solo cuando el archivo señalado permite comprobarlo directamente. Los criterios se concentran en los productos exigidos por la rúbrica: actividades, plantillas, dominio, MER, prototipo, verificación, ajustes, informe y trazabilidad. La validación con usuarios, accesibilidad y ejecución de backend se reportan como límites del prototipo, no como criterios de análisis documental supuestamente ejecutados.

## 2. Lista de chequeo diligenciada

| ID | Criterio verificable | Sí/No | Evidencia | Resultado comprobado |
|---|---|---|---|---|
| C-01 | Existen al menos tres plantillas extendidas independientes. | Sí | `01-casos-uso-extendidos/CU-08`, `CU-11`, `CU-22` | Tres archivos de casos críticos. |
| C-02 | Las tres plantillas identifican actor, objetivo y precondiciones. | Sí | CU-08, CU-11 y CU-22 | Los tres apartados están presentes. |
| C-03 | Cada plantilla contiene un flujo principal de al menos seis pasos. | Sí | CU-08, CU-11 y CU-22 | Se verificaron los pasos de cada flujo principal. |
| C-04 | Cada plantilla documenta al menos un flujo alternativo ligado al principal. | Sí | CU-08 A1; CU-11 A1/A2; CU-22 A1/A2 | Las variantes remiten a pasos del flujo principal. |
| C-05 | Cada plantilla documenta al menos una excepción con resultado. | Sí | CU-08 E1; CU-11 E1; CU-22 E1 | Se describe el error y el estado resultante. |
| C-06 | Las plantillas tienen postcondiciones de éxito y/o fallo coherentes. | Sí | CU-08, CU-11 y CU-22 | Se separan los resultados exitosos de los fallidos/cancelados. |
| C-07 | DA-02 tiene fuente editable y exportación visual, con carriles por actor/sistema. | Sí | `02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.dot`, `.puml`, `.png`, `.svg` | Se conserva el diagrama original con carriles diferenciados y exportación visual. |
| C-08 | DA-02 muestra decisiones con guardas para recursos disponibles, selección y error. | Sí | DA-02 `.dot`, `.puml` y `.svg` originales | Las rutas alternativas se contrastan con CU-11. |
| C-09 | DA-03 tiene fuente editable y exportación visual, con inicio, fin y carriles. | Sí | DA-03 `.dot`, `.puml`, `.png`, `.svg` originales | Coordinador y Sistema se distinguen. |
| C-10 | DA-03 muestra guardas para información incompleta, cancelación y error. | Sí | DA-03 `.dot` / `.puml` y CU-22 | Las decisiones tienen salidas rotuladas y coinciden con A1/A2/E1. |
| C-11 | DA-02 representa el flujo operativo con inicio, fin y carriles. | Sí | DA-02 `.dot`, `.puml`, `.png`, `.svg` originales | Coordinador y Sistema se distinguen. |
| C-12 | DA-03 representa las rutas alternas y excepciones del caso de uso. | Sí | DA-03 `.dot` / `.puml` y CU-22 | Las rutas coinciden con A1/A2/E1. |
| C-13 | DA-02 y DA-03 documentan el flujo secuencial y la ausencia de concurrencia cuando no aplica. | Sí | DA-02 y DA-03 `.md` | Cada documento incluye la justificación correspondiente. DA-01 se conserva como fuente original adicional, sin atribuirle una exportación que no existe. |
| C-14 | MD-01 contiene al menos ocho clases conceptuales distintas. | Sí | `03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md` | Se documentan doce clases. |
| C-15 | Al menos cinco clases tienen dos o más atributos de negocio. | Sí | MD-01, sección 4 | Solicitud, Servicio, Paciente, Ambulancia, Personal y otras superan el mínimo. |
| C-16 | MD-01 presenta asociaciones con verbos y multiplicidades mínimas/máximas. | Sí | MD-01, sección 5 y diagrama | Cada asociación se describe y se interpreta. |
| C-17 | MD-01 incluye una clase de asociación y no contiene métodos ni claves foráneas. | Sí | MD-01, secciones 4, 7 y 8 | AsignacionPersonal modela la participación con atributos propios. |
| C-18 | MER-01 identifica doce entidades con identificadores. | Sí | `04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md` | Todas las entidades tienen PK; las relaciones usan FK declaradas. |
| C-19 | MER-01 declara notación, cardinalidad y participación. | Sí | MER-01, secciones 1, 3, 5 y 6 | Se declara Crow's Foot y se documentan mínimos/máximos. |
| C-20 | La relación N:M entre asignación y personal está resuelta con entidad asociativa y atributos propios. | Sí | MER-01, `ASIGNACION_PERSONAL` | Incluye rol y fecha de vinculación. |
| C-21 | MER-01 justifica la ausencia de entidad débil o relación recursiva. | Sí | MER-01, sección 8 | Las fuentes no definen jerarquía de supervisión ni dependencia de identificación. |
| C-22 | La matriz identifica los 31 RF de la línea base con caso de uso. | Sí | `07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md` | 31/31 RF están relacionados con un CU. |
| C-23 | La matriz relaciona los 31 RF con clases de dominio. | Sí | Matriz P2, columna “Clases MD-01” | 31/31 RF tienen una o más clases relacionadas. |
| C-24 | La matriz relaciona los 31 RF con entidades de datos. | Sí | Matriz P2, columna “Entidades MER-01” | 31/31 RF tienen una o más entidades relacionadas; RF-21 usa NOVEDAD_OPERATIVA. |
| C-25 | Los requisitos de los casos críticos tienen las pantallas exigidas identificadas. | Sí | Matriz P2, sección 3 y prototipo HTML | P-01/CU-08, P-02/CU-11 y P-03/CU-22; cuatro RF relacionados. |
| C-26 | El prototipo rotula P-01 con CU-08 y RF-12. | Sí | `05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html` | Etiqueta visible en la pantalla de solicitudes. |
| C-27 | El prototipo rotula P-02 con CU-11 y RF-17/RF-18. | Sí | Prototipo HTML | Etiqueta visible en la pantalla de asignaciones. |
| C-28 | El prototipo rotula P-03 con CU-22 y RF-31. | Sí | Prototipo HTML | Etiqueta visible en la pantalla de cierres. |
| C-29 | Existe un registro con al menos cinco hallazgos, antes/después y segunda verificación. | Sí | `05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md` | Se registran siete hallazgos con comprobación posterior. |
| C-30 | Existe informe con requisitos interpretados, enlaces a todos los modelos, verificación y ajustes. | Sí | `08-informe-analisis/INFORME-ANALISIS-P2-SIGMAVITAL.md` | Se documentan las cuatro partes y la matriz. |
| C-31 | README identifica reutilización, cambios, rutas de evidencia, autoría y uso de IA. | Sí | `README.md` de G1-P2 | Incluye índice enlazado, fuentes, ajustes, límites y declaración. |

## 3. Resultado

- **Criterios comprobados:** 31/31 Sí.
- **Criterios de cobertura/trazabilidad:** C-22 a C-25 (4 criterios explícitos).
- **Cobertura:** 31/31 RF a caso de uso (100 %), 31/31 a clase de dominio (100 %) y 31/31 a entidad MER (100 %).
- **Casos críticos con pantalla:** CU-08, CU-11 y CU-22.

## 4. Límites que no se confunden con verificación documental

El prototipo es una representación académica con datos ficticios, navegación local y formularios demostrativos. No tiene persistencia ni backend. No se declara prueba formal con usuarios, informe de accesibilidad, aprobación de stakeholders ni validación institucional de cardinalidades. Estas actividades se deben realizar antes de implementar o presentar la solución como sistema operativo; no son evidencia que pueda inferirse de la existencia de los archivos.

---

**SENA – ADSO – Ficha 3413974**
