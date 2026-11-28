$ErrorActionPreference = "Stop"

$file = ".\02-training-project\01-phase\02-planning\05-prototype\04-evidence-learning\03-modelo-dominio\MD-01-Modelo-Dominio-SIGMAVITAL.md"

$content = Get-Content $file -Raw -Encoding UTF8

# Declarar la clase de asociación que faltaba en el diagrama
$insertClass = @'
    class AsignacionPersonal {
        identificadorParticipacion
        rolEnAsignacion
        observaciones
    }

'@

$content = $content.Replace(
    '    class Intervencion {',
    $insertClass + '    class Intervencion {'
)

# Mejorar la explicación de la asociación
$content = $content.Replace(
    'Se propone la clase conceptual Asignación para representar la relación entre un servicio, una ambulancia y el personal operativo involucrado.',
    'Se propone la clase Asignación para representar la relación operativa entre un servicio y una ambulancia. La participación del personal se modela mediante la clase de asociación AsignacionPersonal, que permite representar la vinculación de uno o varios integrantes del personal con una asignación.'
)

$content = $content.Replace(
    'Esta clase permite representar información propia de la asignación, como la fecha y hora, el estado y las observaciones. La propuesta evita representar la asignación únicamente como una relación simple, debido a que constituye un evento operativo con información de negocio propia.',
    'Asignación contiene información propia del evento operativo, como fecha y hora, estado y observaciones. AsignacionPersonal representa la participación individual del personal en una asignación. De esta manera se evita una asociación directa entre Asignación y Personal y se facilita la representación de la participación operativa.'
)

$content = $content.Replace(
    'La clase de asociación Asignación se considera suficiente para representar la relación de recursos operativos en el alcance seleccionado, sin introducir una jerarquía artificial de clases.',
    'Asignación y AsignacionPersonal permiten representar las relaciones de recursos operativos en el alcance seleccionado, sin introducir una jerarquía artificial de clases.'
)

# Actualizar criterio de verificación de clase de asociación
$content = $content.Replace(
    '| Se incluye una clase de asociación | Cumple | Asignación |',
    '| Se incluye una clase de asociación | Cumple preliminarmente | AsignacionPersonal |'
)

# Actualizar conteo de clases documentadas
$content = $content.Replace(
    '| Se identifican al menos 8 clases conceptuales | Cumple | 10 clases documentadas |',
    '| Se identifican al menos 8 clases conceptuales | Cumple preliminarmente | 10 clases representadas en el modelo |'
)

Set-Content -Path $file -Value $content -Encoding UTF8

Write-Host "Ajuste estructural aplicado." -ForegroundColor Green
