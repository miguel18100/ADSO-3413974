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
