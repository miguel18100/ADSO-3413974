# ESPECIFICACIÓN DE DISEÑO DE INTERFAZ – SIGMAVITAL

**Proyecto:** SIGMAVITAL  
**Artefacto:** Especificación de diseño de interfaz  
**Versión:** 0.1  
**Estado:** Preliminar  

## 1. Objetivo

Documentar los elementos visuales, la organización de módulos y los criterios generales de diseño utilizados en el prototipo de SIGMAVITAL, orientado a la gestión de servicios de emergencia.

## 2. Estructura visual

La interfaz se organiza mediante una estructura de navegación lateral y un área principal de contenido.

### 2.1 Menú lateral

El menú lateral permite navegar entre los siguientes módulos:

- Dashboard.
- Solicitudes.
- Pacientes.
- Servicios.
- Asignaciones.
- Ambulancias.
- Personal.
- Intervenciones.
- Cierre de servicios.

Se utiliza iconografía SVG monocromática para mantener la uniformidad visual y evitar el uso de emojis.

### 2.2 Área principal

El área principal muestra el contenido del módulo seleccionado, permitiendo visualizar tablas, indicadores, formularios y elementos de información según la sección.

### 2.3 Dashboard

El panel principal presenta indicadores de referencia:

- Solicitudes registradas.
- Servicios activos.
- Ambulancias disponibles.
- Personal operativo.

También contiene una tabla de servicios recientes y un resumen operativo.

## 3. Lineamientos visuales

- **Estilo:** Interfaz administrativa, limpia y orientada a operaciones.
- **Distribución:** Menú lateral fijo y área principal adaptable.
- **Colores:** Azul oscuro para navegación, fondos claros para contenido y superficies blancas para tarjetas.
- **Iconografía:** SVG de estilo lineal, monocromático.
- **Tipografía:** Sans serif de fácil lectura.
- **Componentes:** Tarjetas, tablas, formularios, etiquetas de estado y botones.
- **Adaptabilidad:** Diseño responsive para diferentes dimensiones de pantalla.

## 4. Módulos representados

| Módulo | Propósito |
|---|---|
| Dashboard | Visualizar indicadores y resumen operativo. |
| Solicitudes | Representar el registro inicial de emergencias. |
| Pacientes | Representar la gestión de información de pacientes. |
| Servicios | Consultar y visualizar servicios. |
| Asignaciones | Representar la asignación de recursos. |
| Ambulancias | Consultar vehículos y sus estados. |
| Personal | Consultar el personal operativo. |
| Intervenciones | Representar el registro de intervenciones. |
| Cierre de servicios | Representar el cierre y resultado de servicios. |

## 5. Criterios de usabilidad

- Mantener una navegación visible y consistente.
- Organizar los módulos por categorías operativas.
- Utilizar etiquetas descriptivas.
- Mantener una presentación uniforme de tablas y formularios.
- Mostrar estados mediante etiquetas visuales.
- Facilitar la identificación de acciones mediante botones y elementos claramente diferenciados.

## 6. Consideraciones de accesibilidad

La versión preliminar contempla criterios visuales de legibilidad, organización y consistencia.

La validación formal de accesibilidad, contraste, navegación por teclado y compatibilidad con lectores de pantalla queda pendiente.

## 7. Limitaciones

- Los datos son ficticios.
- No existe conexión con base de datos.
- Los formularios son representaciones académicas.
- No existe persistencia de información.
- No se han realizado pruebas formales de usabilidad.
- La interfaz requiere validación frente a los requisitos y casos de uso del proyecto.

## 8. Estado del artefacto

**Estado:** Elaborado – preliminar, pendiente de revisión y validación integral.

## 9. Criterios verificables de diseño y usabilidad

Los siguientes criterios se establecen como lineamientos de revisión del prototipo. Su inclusión no implica que todos hayan sido evaluados mediante pruebas formales.

| ID | Criterio | Verificación propuesta |
|---|---|---|
| UI-01 | Navegación consistente | Comprobar que el menú lateral mantiene una estructura uniforme entre módulos. |
| UI-02 | Identificación de módulos | Verificar que los nombres e iconos permitan identificar las secciones representadas. |
| UI-03 | Claridad de formularios | Revisar etiquetas, campos, agrupación de datos y acciones disponibles. |
| UI-04 | Identificación de estados | Comprobar la representación visual de estados de solicitudes, servicios y recursos. |
| UI-05 | Confirmación de acciones | Revisar la existencia de mensajes visuales de confirmación en las operaciones representadas. |
| UI-06 | Consistencia visual | Comparar colores, tipografía, botones, iconos y componentes entre módulos. |
| UI-07 | Adaptabilidad | Revisar la distribución de los elementos en diferentes tamaños de pantalla. |
| UI-08 | Prevención de errores | Identificar campos o acciones que requieran validaciones o advertencias. |
| UI-09 | Legibilidad | Revisar tamaños de texto, jerarquía visual, espaciado y contraste. |
| UI-10 | Orientación del usuario | Verificar que el usuario pueda identificar el módulo y las acciones disponibles. |

## 10. Consideraciones preliminares de ergonomía

Para la revisión progresiva de la interfaz se establecen las siguientes consideraciones:

- Mantener una jerarquía visual que priorice información operativa relevante.
- Evitar la sobrecarga visual de tablas, tarjetas y formularios.
- Mantener agrupados los datos relacionados con una misma operación.
- Utilizar etiquetas descriptivas para acciones y controles.
- Procurar consistencia en la ubicación de botones y elementos de navegación.
- Diferenciar visualmente estados y acciones sin depender exclusivamente del color.
- Reducir recorridos innecesarios entre módulos cuando se trate de operaciones relacionadas.
- Facilitar la identificación de errores y la recuperación ante acciones incorrectas.

Estas consideraciones corresponden a lineamientos de diseño. La evaluación ergonómica formal requiere una revisión sistemática y, cuando corresponda, interacción con usuarios.

## 11. Revisión preliminar de accesibilidad

Se establecen los siguientes aspectos para una futura revisión:

| Aspecto | Criterio de revisión | Estado |
|---|---|---|
| Contraste | Revisar contraste entre texto, fondo y elementos interactivos. | Pendiente de evaluación |
| Teclado | Verificar recorrido y operación de controles mediante teclado. | Pendiente de evaluación |
| Etiquetas | Revisar identificación textual de campos y controles. | Pendiente de evaluación |
| Iconos | Verificar que las acciones no dependan exclusivamente de iconos. | Pendiente de evaluación |
| Estados | Revisar que los estados no se comuniquen exclusivamente mediante color. | Pendiente de evaluación |
| Adaptabilidad | Revisar visualización en diferentes tamaños de pantalla. | Pendiente de evaluación |
| Lectura | Revisar orden y jerarquía de contenidos. | Pendiente de evaluación |

Esta tabla no representa una certificación de accesibilidad ni una validación formal de cumplimiento de estándares.

## 12. Correspondencia preliminar entre módulos y casos de uso

| Módulo de interfaz | Operación o caso de uso relacionado | Alcance representado |
|---|---|---|
| Solicitudes | CU-08 – Registrar solicitud | Representación del registro de solicitud. |
| Asignaciones | CU-11 – Asignar ambulancia y personal | Representación de asignación de recursos. |
| Cierre de servicios | CU-22 – Cerrar servicio | Representación del proceso de cierre. |
| Pacientes | Gestión de información de pacientes | Consulta y representación de información. |
| Servicios | Gestión y consulta de servicios | Visualización de información operativa. |
| Ambulancias | Gestión de recursos vehiculares | Consulta y representación de estados. |
| Personal | Gestión de personal operativo | Consulta y representación de información. |
| Intervenciones | Registro de intervenciones | Representación de información de intervención. |
| Dashboard | Resumen operativo | Visualización de indicadores de referencia. |

La correspondencia es preliminar y deberá contrastarse con la matriz de requisitos y los casos de uso completos.

## 13. Limitaciones y validación pendiente

La especificación y el prototipo tienen alcance académico y preliminar. Se encuentran pendientes, según corresponda:

- Validación integral de correspondencia con los requisitos funcionales y no funcionales.
- Pruebas integrales de navegación.
- Evaluación formal de usabilidad.
- Evaluación ergonómica sistemática.
- Validación formal de accesibilidad.
- Pruebas con usuarios.
- Recopilación de retroalimentación de stakeholders.
- Validación de los comportamientos representados frente a los casos de uso completos.

## 14. Estado actualizado del artefacto

**Estado:** Especificación de diseño ampliada – versión preliminar. Se documentan criterios verificables de interfaz, lineamientos de usabilidad y ergonomía, aspectos de accesibilidad y correspondencia preliminar con casos de uso. La validación integral permanece pendiente.

