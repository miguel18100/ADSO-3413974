# Requisitos funcionales preliminares

| ID | Requisito | Prioridad | Fuente/estado |
|---|---|---|---|
| RF-01 | Gestionar instructores | Must | Alcance MVP |
| RF-02 | Registrar tipo de instructor (planta/contratista) | Must | Alcance MVP |
| RF-03 | Gestionar fichas | Must | Alcance MVP |
| RF-04 | Gestionar ambientes de formación | Must | Alcance MVP |
| RF-05 | Registrar/consultar programas de formación | Must | Alcance MVP |
| RF-06 | Registrar asignaciones de formación | Must | Alcance MVP |
| RF-07 | Asociar instructor, ficha, ambiente, fecha y franja a una asignación | Must | Alcance MVP |
| RF-08 | Registrar competencia, RAP y actividad cuando estén disponibles | Must | Alcance MVP |
| RF-09 | Registrar observaciones/novedades asociadas a programación | Must | Alcance MVP |
| RF-10 | Registrar días sin programación | Must | Alcance MVP |
| RF-11 | Detectar o advertir cruces de instructor | Must | Alcance MVP; bloqueo/advertencia por confirmar |
| RF-12 | Detectar o advertir cruces de ficha | Must | Alcance MVP; bloqueo/advertencia por confirmar |
| RF-13 | Detectar o advertir cruces de ambiente | Must | Alcance MVP; bloqueo/advertencia por confirmar |
| RF-14 | Consultar programación por fecha, ficha, instructor y ambiente | Should | Alcance MVP |
| RF-15 | Consultar resumen diario o por periodo | Should | Alcance MVP |
| RF-16 | Exportar programación para revisión operativa | Should | Condicional, sujeto a alcance |

## Requisitos no funcionales candidatos
- RNF-01: las reglas críticas de negocio deben validarse en backend.
- RNF-02: persistencia centralizada en PostgreSQL.
- RNF-03: interfaz web accesible desde entorno local MVP.
- RNF-04: mantener integridad referencial de datos.
- RNF-05: datos institucionales no confirmados deben marcarse como pendientes y no inventarse.
- RNF-06: arquitectura modular con separación de responsabilidades web/API/DB.

Estos RNF se derivan de los principios técnicos documentados; deben validarse antes de considerarlos definitivos.
