$ErrorActionPreference = "Stop"

$base = ".\02-training-project\01-phase\02-planning\05-prototype\04-evidence-learning\03-modelo-dominio"
$file = Join-Path $base "MD-01-Modelo-Dominio-SIGMAVITAL.md"
$backup = Join-Path $base "MD-01-Modelo-Dominio-SIGMAVITAL-backup.md"

if (!(Test-Path $file)) {
    throw "No se encontró el archivo MD-01."
}

if (!(Test-Path $backup)) {
    Copy-Item $file $backup
}

$content = Get-Content $file -Raw -Encoding UTF8

$content = $content.Replace(
    "Una asignación relaciona integrantes del personal con un servicio.",
    "La asignación vincula al personal mediante la clase de asociación AsignacionPersonal."
)

$content = $content.Replace(
    "| Servicio | Tiene | Asignación | 1 | 1..* | Un servicio puede contar con una o varias asignaciones operativas. |",
    "| Servicio | Tiene | Asignación | 1 | 0..* | Un servicio puede contar con ninguna o varias asignaciones operativas. |"
)

$content = $content.Replace(
    "| Asignación | Vincula | Personal | 0..* | 1..* | Una asignación relaciona integrantes del personal con un servicio. |",
    "| Asignación | Vincula | AsignacionPersonal | 1 | 1..* | Una asignación puede incluir uno o varios registros de participación del personal. |`r`n| AsignacionPersonal | Vincula | Personal | 0..* | 1 | Cada registro de participación corresponde a un integrante del personal. |"
)

$content = $content.Replace(
    "| Ambulancia | Consulta | Disponibilidad de recurso | 1 | 0..* | Una ambulancia puede contar con registros de disponibilidad a lo largo del tiempo. |",
    ""
)

$content = $content.Replace(
    "| Personal | Consulta | Disponibilidad de recurso | 1 | 0..* | El personal puede contar con registros de disponibilidad a lo largo del tiempo. |",
    ""
)

$content = $content.Replace(
    "class DisponibilidadRecurso {",
    "class DisponibilidadRecurso {"
)

$content = $content -replace '(?ms)    class DisponibilidadRecurso \{.*?\n    \}', ''

$content = $content -replace '(?m)^\s*Ambulancia\s+"1"\s+-->\s+"0\.\.\*"\s+DisponibilidadRecurso\s+:\s+registra\s*$', ''
$content = $content -replace '(?m)^\s*Personal\s+"1"\s+-->\s+"0\.\.\*"\s+DisponibilidadRecurso\s+:\s+registra\s*$', ''

$content = $content.Replace(
    'Servicio "1" --> "1..*" Asignacion : tiene',
    'Servicio "1" --> "0..*" Asignacion : tiene'
)

$content = $content.Replace(
    'Asignacion "0..*" --> "1..*" Personal : incluye',
    'Asignacion "1" --> "1..*" AsignacionPersonal : incluye`r`n    AsignacionPersonal "0..*" --> "1" Personal : vincula'
)

$content = $content.Replace(
    "La asignación permite representar la participación de una ambulancia y uno o varios integrantes del personal.",
    "La asignación permite representar la participación de una ambulancia y uno o varios integrantes del personal mediante AsignacionPersonal."
)

$content = $content.Replace(
    "DisponibilidadRecurso",
    "DisponibilidadRecurso"
)

Set-Content -Path $file -Value $content -Encoding UTF8

Write-Host ""
Write-Host "MD-01 actualizado." -ForegroundColor Green
Write-Host "Archivo: $file"
Write-Host "Respaldo: $backup"