$ErrorActionPreference = "Stop"

$file = ".\02-training-project\01-phase\02-planning\05-prototype\04-evidence-learning\03-modelo-dominio\MD-01-Modelo-Dominio-SIGMAVITAL.md"

$content = Get-Content $file -Raw -Encoding UTF8

$old = @'
### 9.1 Clase de asociación: AsignacionPersonal

Se propone la clase Asignación para representar la relación operativa entre un servicio y una ambulancia. La participación del personal se modela mediante la clase de asociación AsignacionPersonal, que permite representar la vinculación de uno o varios integrantes del personal con una asignación.

Asignación contiene información propia del evento operativo, como fecha y hora, estado y observaciones. AsignacionPersonal representa la participación individual del personal en una asignación. De esta manera se evita una asociación directa entre Asignación y Personal y se facilita la representación de la participación operativa.
'@

$new = @'
### 9.1 Clase de asociación: AsignacionPersonal

AsignacionPersonal representa la participación individual de un integrante del personal en una asignación operativa. Se plantea como clase de asociación entre Asignación y Personal, permitiendo registrar información propia de la participación, sin establecer una relación directa simple entre ambas clases.

Sus atributos conceptuales, identificadorParticipacion, rolEnAsignacion y observaciones, permiten documentar las características de la participación del personal dentro de una asignación.
'@

$content = $content.Replace($old, $new)

$content = $content.Replace(
    '| Se identifican al menos 8 clases conceptuales | Cumple preliminarmente | 10 clases representadas en el modelo |',
    '| Se identifican al menos 8 clases conceptuales | Cumple preliminarmente | 10 clases conceptuales, incluida AsignacionPersonal |'
)

Set-Content -Path $file -Value $content -Encoding UTF8

Write-Host "Ajuste final de MD-01 aplicado." -ForegroundColor Green