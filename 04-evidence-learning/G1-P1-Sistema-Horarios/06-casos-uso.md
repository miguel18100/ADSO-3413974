# Casos de uso — descripción textual

## Actores
- **Coordinador de programación (primario):** administra la programación operativa.
- **Administrador funcional (primario):** mantiene catálogos.
- **Consultor institucional (primario):** consulta programación y novedades.
- **Instructor (secundario):** actor de dominio representado en asignaciones; el MVP no define acceso propio para este actor.
- **Aprendiz:** beneficiario asociado a una ficha; no se gestiona individualmente en el MVP.

## Casos de uso
| ID | Caso de uso | Actor(es) | Objetivo |
|---|---|---|---|
| UC-01 | Consultar programación | Coordinador, Consultor | Visualizar horarios |
| UC-02 | Gestionar instructores | Administrador | Crear y consultar instructores y tipo |
| UC-03 | Gestionar fichas | Administrador | Registrar y consultar fichas |
| UC-04 | Gestionar ambientes | Administrador | Registrar y consultar ambientes |
| UC-05 | Gestionar programas | Administrador | Registrar/consultar programas |
| UC-06 | Registrar asignación formativa | Coordinador | Programar actividad relacionando recursos |
| UC-07 | Registrar día sin programación | Coordinador | Identificar fecha sin programación |
| UC-08 | Registrar novedad | Coordinador | Asociar observación a programación |
| UC-09 | Validar posibles cruces | Coordinador | Revisar conflicto de instructor, ficha o ambiente |
| UC-10 | Consultar programación filtrada | Coordinador, Consultor | Filtrar por fecha, ficha, instructor o ambiente |
| UC-11 | Exportar programación | Coordinador | Obtener formato de revisión, si se prioriza |

## Relaciones
- **UC-06 `include` UC-09:** registrar asignación requiere ejecutar la validación de cruces como parte del proceso. La validación es comportamiento obligatorio dentro de la asignación.
- **UC-06 `include` UC-05 / UC-03 / UC-02 / UC-04 (conceptual):** el registro requiere relacionar programa, ficha, instructor y ambiente. Se evita modelar cada consulta de catálogo como un `include` si solo representa selección de datos; estas relaciones se pueden reconsiderar en la revisión UML.
- **UC-08 `extend` UC-06:** registrar novedad es comportamiento opcional que puede ocurrir durante o después de una asignación, no requisito obligatorio para todas.
- **UC-07** es independiente; no se usa `extend` por no ser una extensión condicional de un caso base.

## Límites
El sistema representa la aplicación web de programación. No se incluyen gestión individual de aprendices, asistencia, matrícula, evaluación ni integraciones externas.
