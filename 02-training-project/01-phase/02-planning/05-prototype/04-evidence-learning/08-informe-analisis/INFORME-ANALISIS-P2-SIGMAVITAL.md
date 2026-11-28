# INFORME DE ANÁLISIS Y VERIFICACIÓN – G1-P2 SIGMAVITAL

**Proyecto:** Sistema Gestor de Ambulancias (SGA) – SIGMAVITAL
**Aprendiz:** Juan Miguel Muñoz Castañeda
**Ficha:** 3413974 – ADSO
**Producto:** G1-P2 – Modelo de análisis y verificación
**Versión:** 1.1 – 27 de noviembre de 2026

## 1. Requisitos interpretados

El análisis parte de la línea base de 31 requisitos funcionales (RF-01 a RF-31) y sus actores definidos en G1-P1. Se interpretan como funciones del núcleo operativo: autenticación y permisos; administración de ambulancias y personal; recepción, consulta y clasificación de solicitudes; disponibilidad y asignación de recursos; seguimiento, novedades, historial, reportes e indicadores; datos mínimos del paciente; intervenciones y cierre del servicio.

Los requisitos no funcionales relacionados condicionan el diseño: control de acceso por rol, protección y minimización de datos personales, integridad y consistencia de solicitudes/asignaciones/estados, trazabilidad de operaciones, disponibilidad y recuperación. Las evidencias de P2 describen un prototipo académico sin persistencia ni backend; por tanto, los requisitos de seguridad, disponibilidad y rendimiento se consideran restricciones para diseño e implementación posterior, no propiedades ya demostradas.

## 2. Modelos y evidencias relacionadas

- **Casos de uso extendidos:** [CU-08 – Registrar solicitud](../01-casos-uso-extendidos/CU-08-Registrar-Solicitud-Servicio.md), [CU-11 – Asignar ambulancia y personal](../01-casos-uso-extendidos/CU-11-Asignar-Ambulancia-Personal.md) y [CU-22 – Cerrar servicio](../01-casos-uso-extendidos/CU-22-Cerrar-Servicio.md).
- **Actividades:** [DA-01 – CU-08](../02-diagramas-actividades/DA-01-Registrar-Solicitud-CU08.md), [DA-02 – CU-11](../02-diagramas-actividades/DA-02-Asignar-Ambulancia-CU11.md) y [DA-03 – CU-22](../02-diagramas-actividades/DA-03-Cerrar-Servicio-CU22.md). DA-02 y DA-03 se ajustaron con particiones para Coordinador operativo y Sistema SIGMAVITAL, y decisiones con guardas completas.
- **Modelo de dominio:** [MD-01](../03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md), con once clases conceptuales y asociaciones con verbos y multiplicidades.
- **Modelo entidad-relación:** [MER-01](../04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md), derivado del modelo conceptual y con entidad asociativa para la participación del personal.
- **Prototipo:** [SIGMAVITAL v01](../05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html), con pantallas rotuladas P-01/CU-08, P-02/CU-11 y P-03/CU-22; ver [mapa de navegación](../05-prototipo-ui/02-mapa-navegacion/MAPA-NAVEGACION-SIGMAVITAL.md) y [especificación](../05-prototipo-ui/03-especificacion-diseno/ESPECIFICACION-DISENO-SIGMAVITAL.md).
- **Verificación:** [CHECKLIST-01](../06-checklist-verificacion/CHECKLIST-01-Verificacion-Evidencias-P2.md), [REG-01 – Registro de ajustes](../05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md) y [matriz de trazabilidad](../07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md).

## 3. Resultado de la verificación

La lista de chequeo contiene 24 criterios verificables con respuesta Sí/No, evidencia y resultado; incluye criterios explícitos de cobertura y trazabilidad. La revisión documental confirma tres plantillas extendidas, tres diagramas, once clases conceptuales, un MER con entidades identificadas, tres pantallas críticas y un registro de seis hallazgos con verificación posterior.

La matriz relaciona los 31 RF con su caso de uso, clases de dominio y entidades de datos. La cobertura directa de clases es 31/31 (100 %). La cobertura directa de entidades es 30/31 (96,8 %); RF-21 queda parcial porque el modelo no define una entidad `NOVEDAD_OPERATIVA` independiente y no se asume que `INTERVENCION` sea equivalente a una novedad. Los cuatro requisitos de los casos críticos (RF-12, RF-17, RF-18 y RF-31) tienen pantalla identificada.

## 4. Ajustes realizados

Se sustituyó la representación genérica de DA-02 y DA-03 por diagramas UML de actividades con calles separadas y guardas explícitas; se alinearon sus ramas con los flujos alternos y excepciones de CU-11 y CU-22. Se completó el MD-01 con la clase Rol, verbos, cardinalidades y multiplicidades mínimas/máximas. Se rotularon las tres pantallas críticas. Se reemplazó el checklist de seguimiento por una lista binaria de criterios con evidencias. Se actualizó la matriz RF→CU→clase→entidad→pantalla y se elaboró el presente informe.

## 5. Limitaciones y pendientes reales

La validación es documental y de consistencia entre artefactos. No se ejecutaron pruebas formales con usuarios, pruebas de accesibilidad, evaluación de stakeholders ni pruebas de persistencia/backend. RF-21 requiere confirmar si las novedades se registran como entidad independiente. La aprobación definitiva de multiplicidades y reglas operativas corresponde al instructor o responsable del proceso. El prototipo conserva datos ficticios y mensajes de demostración.

---

**Conclusión:** G1-P2 cuenta con los artefactos mínimos identificados y una trazabilidad documental superior al 90 % hasta clases y entidades. La única cobertura marcada como parcial es RF-21; las validaciones externas y funcionales no se declaran realizadas.
