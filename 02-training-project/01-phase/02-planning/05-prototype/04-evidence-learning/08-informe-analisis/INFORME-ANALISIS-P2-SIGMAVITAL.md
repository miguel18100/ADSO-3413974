# INFORME DE ANÁLISIS Y VERIFICACIÓN – G1-P2 SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL  
**Usuario de GitHub:** `miguel18100` · **Ficha:** 3413974 – ADSO  
**Producto:** G1-P2 – Modelo de análisis y verificación  
**Versión:** 1.2 – 27 de noviembre de 2026

## 1. Requisitos interpretados

La línea base derivada de G1-P1 contiene 31 requisitos funcionales (RF-01 a RF-31). Estos cubren autenticación y permisos; gestión de ambulancias y personal; recepción, consulta y clasificación de solicitudes; disponibilidad y asignación de recursos; estados, novedades, historial y reportes; datos básicos del paciente; intervenciones prehospitalarias y cierre del servicio. Los requisitos no funcionales condicionan el diseño mediante control de acceso por rol, protección y minimización de datos, integridad de la información, trazabilidad de operaciones, disponibilidad y recuperación. No se considera que estas cualidades estén demostradas por el prototipo, que no cuenta con backend ni persistencia.

## 2. Modelos y artefactos elaborados

- **Plantillas extendidas:** [CU-08 – Registrar solicitud](../01-casos-uso-extendidos/CU-08-Registrar-Solicitud-Servicio.md), [CU-11 – Asignar ambulancia y personal](../01-casos-uso-extendidos/CU-11-Asignar-Ambulancia-Personal.md) y [CU-22 – Cerrar servicio](../01-casos-uso-extendidos/CU-22-Cerrar-Servicio.md). Cada una presenta precondiciones, flujo principal, variantes, excepción y postcondiciones.
- **Diagramas de actividades:** [DA-01](../02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.md), [DA-02](../02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.md) y [DA-03](../02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.md). DA-02 y DA-03 se conservan con fuentes editables y exportaciones PNG/SVG originales, carriles por responsable y decisiones. DA-01 se mantiene como fuente Markdown/Mermaid original; no se afirma que tenga exportación independiente. Se declara ausencia de concurrencia cuando corresponde.
- **Modelo de dominio:** [MD-01](../03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md), con doce clases conceptuales, atributos de negocio, asociaciones y multiplicidades. `AsignacionPersonal` modela la participación del personal.
- **Modelo entidad-relación:** [MER-01](../04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md), con doce entidades, identificadores, claves foráneas y relaciones. `ASIGNACION_PERSONAL` resuelve la relación N:M y tiene atributos propios.
- **Prototipo:** [SIGMAVITAL v01](../05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html), con [mapa de navegación](../05-prototipo-ui/02-mapa-navegacion/MAPA-NAVEGACION-SIGMAVITAL.md) y [especificación de diseño](../05-prototipo-ui/03-especificacion-diseno/ESPECIFICACION-DISENO-SIGMAVITAL.md). Las pantallas críticas se rotulan P-01/CU-08, P-02/CU-11 y P-03/CU-22.
- **Verificación y ajustes:** [CHECKLIST-01](../06-checklist-verificacion/CHECKLIST-01-Verificacion-Evidencias-P2.md), [matriz de trazabilidad](../07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md) y [REG-01](../05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md).

## 3. Resultado de la verificación

La lista de chequeo contiene **31 criterios binarios**, cada uno con evidencia y resultado; los 31 se comprobaron documentalmente. Cuatro criterios verifican cobertura y trazabilidad. La matriz muestra **31/31 RF (100 %) relacionados con casos de uso, 31/31 (100 %) con clases de dominio y 31/31 (100 %) con entidades del MER**. RF-21 se relaciona con `NovedadOperativa`/`NOVEDAD_OPERATIVA`, además de `Servicio`/`SERVICIO` y `Usuario`/`USUARIO`; no se equipara una novedad operativa con una intervención asistencial.

Los tres casos críticos cuentan con plantilla, diagrama y pantalla asociada. El registro REG-01 documenta siete hallazgos con estado anterior, corrección y segunda comprobación documental. No se atribuye a esta revisión una prueba con usuarios ni aprobación institucional.

## 4. Ajustes aplicados

Se conservaron sin redibujar las fuentes originales de DA-01/DA-02/DA-03; DA-02 y DA-03 mantienen sus exportaciones preexistentes. Se sincronizaron las referencias documentales de actividad con CU-08/CU-11/CU-22, se incorporó la clase y entidad independiente de novedades, se corrigieron las FK de paciente en SERVICIO y responsable en INTERVENCION, se actualizó la matriz a cobertura de 31/31, se sustituyó el checklist de seguimiento por una lista verificable y se consolidaron el informe y README en la ruta oficial de entrega.

## 5. Límites y supuestos

El prototipo usa datos ficticios y navegación local; sus formularios son demostrativos y no guardan datos. No se declara backend, persistencia, prueba formal de usabilidad, evaluación formal de accesibilidad ni retroalimentación de stakeholders. La ausencia de una entidad débil o relación recursiva se justifica porque el material del proyecto no define jerarquía de supervisión ni dependencia de identificación. Las cardinalidades y reglas de negocio son una propuesta documental que deberá validarse antes de implementar.

---

**SENA – ADSO – Ficha 3413974**
