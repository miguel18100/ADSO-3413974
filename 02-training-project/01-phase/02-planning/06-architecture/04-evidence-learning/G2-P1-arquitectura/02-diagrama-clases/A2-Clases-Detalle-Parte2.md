# A2 – Detalle de Clases y Operaciones (Parte 2: Operación, Finanzas, Gobernanza e Infraestructura)

## \`Servicio\`, \`Asignacion\`, \`AsignacionPersonal\`, \`Intervencion\` y \`RegistroCierre\` (\`RF-018..029\`)
- **\`Servicio\`:** \`-idServicio: int\`, \`-fechaHoraInicio: datetime\`, \`-estado: string\`, \`-destinoTraslado: string\`, \`-estadoPacienteFinal: string\` | \`+transicionarEstado(nuevo): void\`, \`+validarCierreRN005(): bool\`, \`+cancelarSiPermitido(mot): bool\`.
- **\`Asignacion\` y \`AsignacionPersonal\`:** coordinan despacho vía \`+aplicarEstrategia(estrat): Ambulancia\` y \`+vincularTripulante(p): bool\`.
- **\`RegistroCierre\`:** exige resultado, estado paciente, destino y responsable mediante \`+validarCamposObligatorios(): bool\`.

## Orquestación, Contabilidad e Infraestructura (\`RF-030..RF-065\`)
- **\`GestionServicioFacade\` (\`«Facade»\`):** \`+registrarSolicitud(datos): Servicio\`, \`+asignarRecursos(id, man): Asignacion\`, \`+cerrarServicioYFacturar(id, dto): Factura\`.
- **\`Factura\` (\`«Inmutable»\`), \`NotaContable\`, \`MovimientoFinanciero\`:** emisión automática al cierre y ajustes vía nota crédito/débito (\`RN-014\`).
- **\`Proveedor\`, \`ContratoProveedor\`, \`Visitante\`, \`Pqrs\`, \`Documento\`, \`NovedadOperativa\`, \`Auditoria\` (\`«Inmutable»\`), \`ServicioReportesKPI\` e \`IRepositorioDatos\` (\`«interface»\`):** aseguran cobertura total **65/65 RF** sin acoplar dominio ni vistas con MySQL.
