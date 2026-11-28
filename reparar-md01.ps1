$ErrorActionPreference = "Stop"

$file = ".\02-training-project\01-phase\02-planning\05-prototype\04-evidence-learning\03-modelo-dominio\MD-01-Modelo-Dominio-SIGMAVITAL.md"

$content = Get-Content $file -Raw -Encoding UTF8

# Reparar salto de línea literal introducido en el diagrama
$content = $content.Replace('`r`n', "`r`n")

# Corregir la asociación de personal en la tabla
$content = $content.Replace(
    '| Asignación | Vincula | Personal | 0..* | 1..* | La asignación vincula al personal mediante la clase de asociación AsignacionPersonal. |',
    '| Asignación | Vincula | AsignacionPersonal | 1 | 1..* | Una asignación puede incluir uno o varios registros de participación del personal. |' + "`r`n" + '| AsignacionPersonal | Vincula | Personal | 0..* | 1 | Cada registro de participación corresponde a un integrante del personal. |'
)

# Eliminar filas de disponibilidad si permanecen en la tabla
$content = $content -replace '(?m)^\| Ambulancia \| Consulta \| Disponibilidad de recurso.*\r?\n', ''
$content = $content -replace '(?m)^\| Personal \| Consulta \| Disponibilidad de recurso.*\r?\n', ''

Set-Content -Path $file -Value $content -Encoding UTF8

Write-Host "Reparacion aplicada." -ForegroundColor Green
