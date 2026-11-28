# REG-01 – Registro de Hallazgos, Iteración y Segunda Verificación (G1-P2)

| # | Hallazgo detectado | Corrección aplicada | Estado tras 2ª verificación |
|---|---|---|---|
| 1 | El entregable previo estaba duplicado en `02-planning/05-prototype/04-evidence-learning` | Se consolidó 100 % en la ruta oficial de Guía 1 `G1-P2-Modelado-SIGMAVITAL` y se limpió el duplicado | Resuelto |
| 2 | `DA-01` carecía de SVG y `DA-02/DA-03` tenían textos rotados recortados en carriles (`rril`) | Se reconstruyeron `DA-01`, `DA-02` y `DA-03` con encabezados horizontales limpios, guardas `[ ]` y Fork/Join exportados 1:1 a SVG | Resuelto |
| 3 | El cierre formal figuraba como `CU-22` huérfano frente a `CU-01..CU-18` de G1-P1 | Se unificó la nomenclatura en todo el repositorio como `CU-14 Realizar cierre formal del servicio` | Resuelto |
| 4 | `MD-01` presentaba truncamiento de texto, cardinalidades invertidas y no tenía diagrama `.drawio/.svg` | Se creó `MD-01-Modelo-Dominio.drawio/.svg` puro sin métodos/SQL, con herencia `TAB/TAM`, `AsignacionPersonal` y tablas corregidas | Resuelto |
| 5 | `MER-01` carecía de diagrama gráfico Crow's Foot y entidad débil explícita | Se creó `MER-01-Modelo-Entidad-Relacion.drawio/.svg` en notación Crow's Foot con 25 entidades incluyendo `HistorialEstadoServicio` (débil) | Resuelto |
| 6 | Faltaban `08-informe-analisis`, matriz completa a 65 RF y badges actualizados en el HTML | Se incorporó `INFORME-ANALISIS-P2-SIGMAVITAL.md`, la matriz 65/65 RF y el prototipo v1.0 con `P-01/P-02/P-03` | Resuelto |
