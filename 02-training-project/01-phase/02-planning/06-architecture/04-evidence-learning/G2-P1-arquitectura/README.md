# Guía 2 – Producto 1: Arquitectura de Software y Diseño Orientado a Objetos – SIGMAVITAL

## 1. Datos de la entrega

| Campo | Valor |
|---|---|
| **Ficha** | 3413974 |
| **Proyecto** | SIGMAVITAL – Sistema Gestor de Ambulancias (SGA) |
| **Aprendiz (usuario GitHub)** | `miguel18100` |
| **Fecha de entrega / actualización** | 2026-11-28 |
| **Alcance cubierto** | **65 / 65 RF (100 %)** · **29 RNF** · **18 RN** |

---

## 2. Qué se diseñó o ajustó en arquitectura y OO

Se unificó el diseño arquitectónico completo de **SIGMAVITAL** sobre la plataforma **PHP 8.3 / Laravel 11 API REST + React 18 SPA + MySQL 8.0 (InnoDB)** en cuatro capas estrictas. Se corrigieron las inconsistencias previas detectadas en `A1`, `A2`, `A4`, `A5`, `A6` y `A7`: se amplió la trazabilidad de 38,7 % al **100 % (65 / 65 RF)**, se eliminó la etiqueta literal errónea en `A2`, se alineó `Rol 1 -- 0..* Usuario` con `G2-P2`, se invirtió correctamente la dirección de herencia/realización de `Strategy` y `AmbulanciaTAB/TAM`, se separó la persistencia mediante `IRepositorioDatos` y se exportaron todas las vistas `.svg` directamente desde sus fuentes `.drawio`.

---

## 3. Evidencias incluidas (links)

- **A1 Requisitos y Decisiones Tecnológicas:** [A1-Requisitos-Decisiones-Tecnologicas.md](01-requisitos/A1-Requisitos-Decisiones-Tecnologicas.md)
- **A2 Diagrama de Clases UML:** [A2-Diagrama-Clases.drawio](02-diagrama-clases/A2-Diagrama-Clases.drawio) · [SVG](02-diagrama-clases/A2-Diagrama-Clases.svg) · [Relaciones](02-diagrama-clases/A2-Relaciones-Multiplicidades.md) · [Trazabilidad](02-diagrama-clases/A2-Trazabilidad-Clases-Requisitos.md)
- **A3 Patrones de Diseño:** [A3-Patrones-Diseno.md](03-patrones-diseno/A3-Patrones-Diseno.md) (Strategy + Facade + Repository)
- **A4 Arquitectura en 4 Capas:** [A4-Software-Architecture-Decisions.md](04-arquitectura/A4-Software-Architecture-Decisions.md) · [Draw.io](04-arquitectura/A4-Arquitectura-SIGMAVITAL.drawio) · [SVG](04-arquitectura/A4-Arquitectura-SIGMAVITAL.svg)
- **A5 Vista de Componentes:** [A5-Component-Interface-Specification.md](05-componentes/A5-Component-Interface-Specification.md) · [Draw.io](05-componentes/A5-Component-View-SIGMAVITAL.drawio) · [SVG](05-componentes/A5-Component-View-SIGMAVITAL.svg)
- **A6 Vista de Despliegue:** [A6-Deployment-Architecture.md](06-despliegue/A6-Deployment-Architecture.md) · [Draw.io](06-despliegue/A6-Deployment-View-SIGMAVITAL.drawio) · [SVG](06-despliegue/A6-Deployment-View-SIGMAVITAL.svg)
- **A7 Trazabilidad Integral (65/65 RF):** [A7-Requirements-Traceability-Matrix.md](07-trazabilidad/A7-Requirements-Traceability-Matrix.md)

---

## 4. Cómo validar consistencia y trazabilidad

1. Verificar en [A7-Requirements-Traceability-Matrix.md](07-trazabilidad/A7-Requirements-Traceability-Matrix.md) que todos los requisitos `RF-001` a `RF-065` mapean a clases concretas de `A2` y componentes con interfaz `I*` de `A5`.
2. Abrir los archivos `.svg` y `.drawio` de `A2`, `A4`, `A5` y `A6` confirmando paridad visual exacta 1:1 y cero saltos ilegales de Presentación hacia Base de Datos.
3. Confirmar la continuidad directa hacia el diseño físico en [G2-P2-diseño-datos](../G2-P2-dise%C3%B1o-datos/README.md).

---

## 5. Autoría y uso de IA

- **Autor principal y responsable técnico:** `miguel18100` (decisiones arquitectónicas, modelado UML, interfaces de componentes, topología y verificación E2E).
- **Apoyo de IA:** asistencia puntual de **ChatGPT** para estructuración de matrices Markdown y depuración de diagramas; cada archivo fue validado y aprobado por el aprendiz.
