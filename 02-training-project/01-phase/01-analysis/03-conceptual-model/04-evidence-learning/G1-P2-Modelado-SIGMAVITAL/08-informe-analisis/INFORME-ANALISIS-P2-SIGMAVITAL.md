# Informe Ejecutivo de Análisis y Modelado – SIGMAVITAL (G1-P2)

**Proyecto:** SIGMAVITAL – Sistema Gestor de Ambulancias (SGA)  
**Autor:** `miguel18100` · **Fecha:** 2026-11-28 · **Estado:** Consolidado al 100 %

## 1. Síntesis de interpretación de requisitos y reglas de negocio

A partir del documento SRS unificado del proyecto SIGMAVITAL, el análisis abarcó los **65 requisitos funcionales (`RF-001` a `RF-065`)**, los **29 requisitos no funcionales (`RNF-001` a `RNF-029`)** y las **18 reglas de negocio (`RN-001` a `RN-018`)** correspondientes a los 15 módulos institucionales (Autenticación RBAC, Ambulancias TAB/TAM, Talento Humano, Pacientes, Emergencias, Monitoreo, Finanzas, Visitantes, PQRS, Propietarios, Proveedores, Gestión Documental, Auditoría Inmutable, Novedades y Reportes).

## 2. Resumen de modelos elaborados y validados

1. **Casos de uso extendidos (`CU-08`, `CU-11`, `CU-14`):** especifican los flujos críticos de registro con triage, asignación asistida/manual y cierre formal obligatorio alineado a `RN-001..007` y `RN-014`.
2. **Diagramas de actividades (`DA-01`, `DA-02`, `DA-03`):** modelan con carriles por rol/sistema, rombos con guardas `[...]` y barras concurrentes `Fork/Join` el paralelismo real entre cierre clínico, liberación de flota, facturación inmutable y auditoría.
3. **Modelo de dominio (`MD-01`):** representa los **25 conceptos puros del dominio** (con herencia `Ambulancia -> TAB/TAM` y clase de asociación `AsignacionPersonal`), sin acoplamiento SQL ni métodos de implementación.
4. **Modelo Entidad–Relación (`MER-01`):** normaliza en notación Crow's Foot las **25 entidades**, incluyendo la entidad débil identificadora `HistorialEstadoServicio`, la descomposición multivaluada `PacienteTelefono` y el puente `AsignacionPersonal`.
5. **Prototipo UI navegable (`SIGMAVITAL-Prototipo-v01.html`):** implementa las pantallas `P-01`, `P-02` y `P-03` con validación interactiva de `RN-007` y campos obligatorios `RN-005`, más vistas para los módulos complementarios.

## 3. Verificación cruzada y cierre

La auditoría registrada en [CHECKLIST-01](../06-checklist-verificacion/CHECKLIST-01-Verificacion-Evidencias-P2.md) confirma **24 / 24 criterios cumplidos** y [REG-01](../05-prototipo-ui/03-especificacion-diseno/REG-01-Registro-Iteracion-Visual.md) evidencia los 6 ajustes de consolidación ejecutados antes de publicar la línea base hacia la fase de Diseño y Arquitectura (Guía 2).
