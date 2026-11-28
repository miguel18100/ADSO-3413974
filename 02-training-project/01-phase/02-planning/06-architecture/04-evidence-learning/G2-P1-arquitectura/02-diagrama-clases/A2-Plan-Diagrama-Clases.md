# A2 – Plan y Validación del Diagrama de Clases UML – SIGMAVITAL

**Proyecto:** SIGMAVITAL – Sistema Gestor de Ambulancias (SGA)  
**Evidencia:** G2-P1 Arquitectura  
**Estado:** Validado al 100 % frente al SRS (65 RF / 29 RNF / 18 RN)

## 1. Criterios verificados en \`A2-Diagrama-Clases.drawio\` / \`.svg\`

- [x] Modela las **29 clases e interfaces** necesarias para cubrir **65 / 65 RF (100 %)** sin clases huérfanas.
- [x] Todas las clases especifican visibilidad (\`-\`, \`#\`, \`+\`), atributos tipados y operaciones con parámetros y retorno.
- [x] Se corrigió \`Rol "1" -- "0..*" Usuario\` para alinearse 100 % con \`B1\`, \`B2\` y \`B5\`.
- [x] Incorpora herencia REPS (\`Ambulancia\` abstracta <- \`AmbulanciaTAB\` / \`AmbulanciaTAM\`), clase de asociación \`AsignacionPersonal\`, composición en \`Servicio\` (\`Intervencion\`, \`Asignacion\`, \`RegistroCierre\`), patrón **Strategy** (\`EstrategiaAsignacion\`) y **Facade** (\`GestionServicioFacade\`).
- [x] Separa la infraestructura mediante \`IRepositorioDatos\` y reportes en \`ServicioReportesKPI\` (cumplimiento \`Regla 5\`).
- [x] Fuente editable [\`.drawio\`](A2-Diagrama-Clases.drawio), exportación vectorial fiel 1:1 [\`.svg\`](A2-Diagrama-Clases.svg) y vista [\`.png\`](A2-Diagrama-Clases.png) revisadas visualmente sin etiquetas literales residuales ni solapes.
