$ErrorActionPreference = "Stop"

$file = ".\02-training-project\01-phase\02-planning\05-prototype\04-evidence-learning\03-modelo-dominio\MD-01-Modelo-Dominio-SIGMAVITAL.md"

$content = Get-Content $file -Raw -Encoding UTF8

$content = $content.Replace(
    '- Asignación se plantea como clase de asociación para representar la vinculación de recursos operativos con el servicio.',
    '- Asignación representa la vinculación operativa de una ambulancia con un servicio y contiene información propia del evento de asignación.'
)

$content = $content.Replace(
    '- La asignación permite representar la participación de una ambulancia y uno o varios integrantes del personal mediante AsignacionPersonal.',
    '- La participación del personal se representa mediante AsignacionPersonal, asociada a Asignación y a Personal.'
)

$content = $content.Replace(
    '### 9.1 Clase de asociación: Asignación',
    '### 9.1 Clase de asociación: AsignacionPersonal'
)

$content = $content.Replace(
    'Asignación y AsignacionPersonal permiten representar las relaciones de recursos operativos en el alcance seleccionado, sin introducir una jerarquía artificial de clases.',
    'Asignación y AsignacionPersonal permiten representar la vinculación de la ambulancia y la participación del personal en el servicio, sin introducir una jerarquía artificial de clases.'
)

$content = $content.Replace(
    '| Las clases contienen atributos de negocio | Cumple | Secciones 5.1 a 5.10 |',
    '| Las clases contienen atributos de negocio | Cumple preliminarmente | Secciones 5.1 a 5.10 |'
)

Set-Content -Path $file -Value $content -Encoding UTF8

Write-Host "Armonización documental aplicada." -ForegroundColor Green