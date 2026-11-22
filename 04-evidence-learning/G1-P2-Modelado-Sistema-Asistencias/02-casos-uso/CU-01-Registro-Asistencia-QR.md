# CU-01 — Registrar asistencia mediante QR

**Actor principal:** Aprendiz  
**Actor de apoyo:** Instructor  
**Objetivo:** Registrar la asistencia del aprendiz a una sesión habilitada mediante la lectura de su código QR.

## Precondiciones
- El aprendiz está registrado y activo en el sistema.
- El aprendiz dispone de su QR personal.
- Existe una sesión de asistencia activa y vigente.
- La sesión corresponde a la ficha del aprendiz.
- El servicio web está disponible.

## Flujo principal
1. El aprendiz presenta su código QR personal.
2. El instructor abre el escáner de la sesión correspondiente.
3. El sistema recibe el token del aprendiz y el identificador de sesión.
4. El sistema valida el token y el estado del aprendiz.
5. El sistema verifica la vigencia de la sesión y la correspondencia de ficha.
6. El sistema verifica la ubicación cuando la geolocalización está configurada.
7. El sistema evalúa el estado de red del registro.
8. El sistema calcula la tardanza según el inicio y la tolerancia de la sesión.
9. El sistema almacena el registro de asistencia.
10. El sistema confirma el resultado del registro.

## Flujos alternativos
- **A1 — Geolocalización no configurada:** El sistema omite la validación de distancia y continúa con las demás validaciones.
- **A2 — Registro por fuera de la tolerancia:** El sistema calcula y almacena los minutos de tardanza según las reglas aplicables.

## Flujos de excepción
- **E1 — QR inválido:** El sistema rechaza el token y muestra un mensaje de validación.
- **E2 — Aprendiz inactivo:** El sistema impide el registro.
- **E3 — Sesión vencida o inactiva:** El sistema rechaza la solicitud.
- **E4 — Ficha no coincidente:** El sistema impide el registro.
- **E5 — Ubicación fuera del radio configurado:** El sistema rechaza el registro.
- **E6 — Precisión GPS insuficiente:** El sistema rechaza la ubicación cuando supera el límite permitido.
- **E7 — Red bloqueada:** El sistema rechaza el registro según las reglas de evaluación de red.
- **E8 — Asistencia duplicada:** El sistema no inserta un segundo registro y comunica la situación.

## Postcondiciones
- Si el flujo es exitoso, la asistencia queda almacenada asociada al aprendiz y a la sesión.
- Si una validación falla, no se genera una nueva asistencia.
- La información de validación disponible queda reflejada en el registro correspondiente.
