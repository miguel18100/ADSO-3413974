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
- **Actividades:** DA-01, DA-02 y DA-03 se incluyen como evidencias gráficas relacionadas con los casos de uso críticos de la fase P2. Su contenido se mantiene fuera del alcance de esta revisión documental.
- **Modelo de dominio:** [MD-01](../03-modelo-dominio/MD-01-Modelo-Dominio-SIGMAVITAL.md), como evidencia de representación conceptual de las entidades, atributos y asociaciones del sistema.
- **Modelo entidad-relación:** [MER-01](../04-modelo-entidad-relacion/MER-01-Modelo-Entidad-Relacion-SIGMAVITAL.md), derivado del modelo conceptual y con entidad asociativa para la participación del personal.
- **Prototipo:** [SIGMAVITAL v01](../05-prototipo-ui/01-mockups/SIGMAVITAL-Prototipo-v01.html), con pantallas rotuladas P-01/CU-08, P-02/CU-11 y P-03/CU-22; ver [mapa de navegación](../05-prototipo-ui/02-mapa-navegacion/MAPA-NAVEGACION-SIGMAVITAL.md) y [especificación](../05-prototipo-ui/03-especificacion-diseno/ESPECIFICACION-DISENO-SIGMAVITAL.md).
- **Verificación:** [CHECKLIST-01](../06-checklist-verificacion/CHECKLIST-01-Verificacion-Evidencias-P2.md), [REG-01 – Registro de ajustes](../05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md) y [matriz de trazabilidad](../07-matriz-trazabilidad/MATRIZ-TRAZABILIDAD-P2-SIGMAVITAL.md).

## 3. Resultado de la verificación

La revisión documental permitió identificar los artefactos relacionados con los casos de uso extendidos, modelos conceptuales y de datos, prototipo de interfaz, mapa de navegación, especificación de diseño, registro de ajustes, checklist y matriz de trazabilidad.

El checklist CHECKLIST-01 funciona como instrumento de seguimiento de las evidencias y actividades de verificación. Su contenido registra aspectos revisados, pendientes y observaciones; por tanto, no se interpreta como una certificación de cumplimiento total ni como una evaluación binaria concluida de todos los criterios.

La matriz de trazabilidad relaciona los requisitos funcionales con los casos de uso, elementos del modelo de dominio, entidades de datos y referencias de interfaz cuando corresponde. La revisión documental identificó relaciones consignadas en la matriz, así como aspectos cuya correspondencia requiere completar, revisar o validar. En consecuencia, no se establece un porcentaje global de cobertura de clases o entidades sin un cálculo verificable sustentado por la matriz.

Las evidencias de interfaz identifican las pantallas asociadas a los flujos operativos representados en el prototipo. Esta correspondencia documental no constituye por sí sola una prueba funcional de implementación.

## 4. Ajustes realizados

Durante la revisión documental se identificaron ajustes puntuales para mejorar la consistencia entre las evidencias textuales. Se corrigieron aspectos de presentación y correspondencia documental en el modelo entidad-relación y se revisaron referencias, descripciones y alcance de los artefactos.

El modelo de dominio y el modelo entidad-relación se consideran documentos relacionados, cuya correspondencia de nombres, atributos y relaciones debe mantenerse coherente y continuar siendo validada cuando se consolide la línea base definitiva.

El checklist y la matriz de trazabilidad se conservan como instrumentos de seguimiento y documentación del estado de las evidencias. Este informe consolida las observaciones identificadas en la revisión documental, sin atribuir resultados cuantitativos de cobertura que no hayan sido calculados y comprobados.

## 5. Limitaciones y pendientes reales

La validación es documental y de consistencia entre artefactos. No se ejecutaron pruebas formales con usuarios, pruebas de accesibilidad, evaluación de stakeholders ni pruebas de persistencia/backend. RF-21 requiere confirmar si las novedades se registran como entidad independiente. La aprobación definitiva de multiplicidades y reglas operativas corresponde al instructor o responsable del proceso. El prototipo conserva datos ficticios y mensajes de demostración.

---

**Conclusión:** G1-P2 reúne evidencias documentales relacionadas con el análisis, modelado conceptual, modelado de datos, prototipo de interfaz, especificación de diseño, seguimiento y trazabilidad. La revisión identificó aspectos de consistencia documental que deben mantenerse bajo seguimiento. La existencia de estas evidencias no implica que todas las relaciones de trazabilidad, reglas operativas o validaciones hayan sido concluidas. Las validaciones funcionales, externas y de implementación permanecen fuera de los resultados demostrados en este informe.
