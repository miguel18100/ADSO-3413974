$ErrorActionPreference = "Stop"

$file = ".\02-training-project\01-phase\02-planning\05-prototype\04-evidence-learning\03-modelo-dominio\MD-01-Modelo-Dominio-SIGMAVITAL.md"

$content = Get-Content $file -Raw -Encoding UTF8

# Reemplazar clase 5.10: Disponibilidad de recurso por AsignacionPersonal
$oldSection = @'
### 5.10 Disponibilidad de recurso

Representa la información de disponibilidad de un recurso operativo para la gestión de asignaciones.

| Atributo | Descripción |
|---|---|
| identificadorDisponibilidad | Identificador del registro |
| fechaHoraActualizacion | Fecha y hora de actualización |
| estadoDisponibilidad | Estado registrado |
| observaciones | Observaciones sobre la disponibilidad |
'@

$newSection = @'
### 5.10 AsignacionPersonal

Representa la participación de un integrante del personal en una asignación operativa. Esta clase de asociación permite registrar información propia de la participación.

| Atributo | Descripción |
|---|---|
| identificadorParticipacion | Identificador de la participación |
| rolEnAsignacion | Función desempeñada dentro de la asignación |
| observaciones | Observaciones relacionadas con la participación |
'@

$content = $content.Replace($oldSection, $newSection)

# Precisar la descripción de Asignación
$content = $content.Replace(
    'Representa la asignación de recursos operativos a un servicio. Se propone como clase de asociación para registrar la participación de ambulancias y personal.',
    'Representa la asignación operativa de una ambulancia a un servicio. Permite registrar información propia del evento de asignación y relacionar la participación del personal mediante AsignacionPersonal.'
)

# Corregir la consideración sobre disponibilidad
$content = $content.Replace(
    '- Disponibilidad de recurso permite representar cambios de disponibilidad asociados a ambulancias y personal.',
    '- La disponibilidad de ambulancias y personal se representa mediante estados y reglas operativas, sin incorporar una clase conceptual independiente de disponibilidad en este modelo.'
)

Set-Content -Path $file -Value $content -Encoding UTF8

Write-Host "Catálogo de clases corregido." -ForegroundColor Green