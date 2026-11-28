# A2 – Detalle de Clases y Operaciones (Parte 1: Núcleo Acceso, Flota y Solicitudes)

## \`Rol\` y \`Usuario\` (\`RF-001..RF-007\`)
- **\`Rol\`:** \`-idRol: int\`, \`-nombre: string\`, \`-descripcion: string\` | \`+validarPermiso(modulo): bool\`, \`+listarPermisos(): array\`.
- **\`Usuario\`:** \`-idUsuario: int\`, \`-idRol: int\`, \`-nombre: string\`, \`-correo: string\`, \`-passwordHash: string\`, \`-intentosFallidos: int\` | \`+autenticar(clave): bool\`, \`+bloquearPorIntentos(): void\`, \`+cambiarClave(nueva): bool\`.

## \`PropietarioUnidad\`, \`Ambulancia\` (\`«abstract»\`), \`AmbulanciaTAB\`, \`AmbulanciaTAM\` (\`RF-008..013, 045..046\`)
- **\`Ambulancia\`:** \`#idAmbulancia: int\`, \`#numeroUnidad: string\`, \`#placa: string\`, \`#tipo: string\`, \`#numHabilitacionReps: string\`, \`#vigenciaSoat: date\`, \`#estadoOperativo: string\` | \`+tieneDocsVigentes(): bool\`, \`+cambiarEstado(estado): void\`.
- **\`AmbulanciaTAB\` / \`AmbulanciaTAM\`:** especializan \`Ambulancia\` validando dotación mínima Res. 3100 (\`+validarDotacionTAB()\`, \`+validarDotacionTAM()\`).

## \`Personal\` y \`Solicitud\` (\`RF-014..017, RF-021\`)
- **\`Personal\`:** \`-idPersonal: int\`, \`-documento: string\`, \`-tarjetaProfesional: string\`, \`-vigenciaCertificacion: date\`, \`-estadoDisponibilidad: string\` | \`+estaHabilitado(): bool\`, \`+validarJornadaMax(): bool\`.
- **\`Solicitud\`:** \`-idSolicitud: int\`, \`-fechaHoraSolicitud: datetime\`, \`-prioridadClinica: string\`, \`-direccionEvento: string\`, \`-estado: string\` | \`+validarTriageClinico(): bool\`, \`+originarServicio(): Servicio\`.
