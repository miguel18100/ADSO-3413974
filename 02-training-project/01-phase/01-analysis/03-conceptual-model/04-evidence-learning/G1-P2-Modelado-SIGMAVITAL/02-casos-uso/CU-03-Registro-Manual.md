# CU-03 — Registrar asistencia manualmente

**Actor principal:** Instructor  
**Objetivo:** Registrar la asistencia de un aprendiz de forma manual dentro de una sesión de asistencia válida.

## Precondiciones
- El instructor está autenticado.
- Existe una sesión de asistencia activa y vigente.
- El instructor tiene acceso a dicha sesión.
- El aprendiz está registrado y activo.

## Flujo principal
1. El instructor abre la sesión de asistencia.
2. Selecciona la opción de registro manual.
3. Ingresa el documento de identidad del aprendiz.
4. El sistema busca al aprendiz en sus registros.
5. El sistema verifica que el aprendiz esté activo.
6. El sistema comprueba que el aprendiz corresponda a la ficha de la sesión.
7. El sistema valida que la sesión esté activa y vigente.
8. El sistema registra la asistencia manual.
9. El sistema confirma que el registro fue realizado.

## Flujos alternativos
- **A1 — Consulta previa:** El instructor consulta la lista de aprendices registrados en la sesión antes de efectuar el registro manual.

## Flujos de excepción
- **E1 — Documento no encontrado:** El sistema informa que el aprendiz no existe.
- **E2 — Aprendiz inactivo:** El sistema rechaza el registro.
- **E3 — Ficha no coincidente:** El sistema impide registrar al aprendiz en la sesión seleccionada.
- **E4 — Sesión vencida o inactiva:** El sistema rechaza el registro.
- **E5 — Registro duplicado:** El sistema impide insertar una asistencia repetida y comunica el resultado.
- **E6 — Instructor no autorizado:** El sistema rechaza la operación.

## Postcondiciones
- Si el proceso es exitoso, queda registrada una asistencia asociada al aprendiz y a la sesión.
- Si se produce una excepción, no se genera una nueva asistencia.
- La asistencia manual queda identificada mediante el detalle de registro definido por el sistema.
