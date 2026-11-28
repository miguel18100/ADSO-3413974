# CU-02 — Crear y gestionar sesión de asistencia

**Actor principal:** Instructor  
**Objetivo:** Crear una sesión de asistencia para una ficha, consultar los registros generados y finalizar la sesión.

## Precondiciones
- El instructor está autenticado.
- La ficha seleccionada existe y está activa.
- El instructor tiene acceso a las funciones de gestión de asistencia.

## Flujo principal
1. El instructor accede al módulo de toma de asistencia.
2. Selecciona la ficha para la cual desea abrir la sesión.
3. Configura la fecha y hora de inicio y la tolerancia permitida.
4. El sistema valida los parámetros ingresados.
5. El sistema genera el token de sesión y el código de acceso.
6. El sistema crea la sesión con su vigencia definida.
7. El sistema presenta el QR y el código para facilitar el registro.
8. El instructor consulta los registros asociados a la sesión.
9. El instructor supervisa el registro de los aprendices.
10. El instructor decide finalizar la sesión.
11. El sistema desactiva la sesión.
12. El sistema confirma el cierre.

## Flujos alternativos
- **A1 — Consulta de registros:** El instructor consulta los registros sin cerrar la sesión.
- **A2 — Registro manual:** El instructor accede al proceso de registro manual para un aprendiz de la ficha.

## Flujos de excepción
- **E1 — Ficha inactiva:** El sistema impide la creación de la sesión.
- **E2 — Parámetros inválidos:** El sistema solicita corregir la fecha, hora o tolerancia.
- **E3 — Instructor no autorizado:** El sistema rechaza la operación.
- **E4 — Sesión vencida:** El sistema informa que la sesión ya no permite registros.

## Postcondiciones
- La sesión queda creada y disponible mientras esté activa y vigente.
- Los registros generados quedan asociados a la sesión.
- Al cerrar la sesión, esta queda inactiva.
