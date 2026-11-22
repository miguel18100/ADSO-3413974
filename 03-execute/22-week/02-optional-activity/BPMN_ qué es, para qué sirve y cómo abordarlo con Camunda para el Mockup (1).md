# BPMN: Qué es, para qué sirve y cómo abordarlo con Camunda

## 1. ¿Qué es un BPMN?

**BPMN** significa **Business Process Model and Notation** (Modelo y Notación de Procesos de Negocio).

Es una forma gráfica de representar **cómo funciona un proceso paso a paso** dentro de una empresa o sistema.

En otras palabras, un BPMN nos permite mostrar:

- Quién realiza cada actividad.
- Qué actividad se realiza.
- En qué orden se realizan las actividades.
- Qué decisiones pueden ocurrir.
- Qué sucede si una condición se cumple o no.
- Cómo comienza y cómo termina un proceso.

Un BPMN se parece a un diagrama de flujo, pero está diseñado específicamente para representar **procesos de negocio** de una manera organizada y estándar.

### Ejemplo sencillo

Supongamos que tenemos un proceso para comprar un tiquete aéreo:

```text
Inicio
  ↓
Registrar reserva
  ↓
¿Hay disponibilidad?
  ├── Sí → Emitir tiquete
  │          ↓
  │      Asignar asiento
  │          ↓
  │      Registrar pago
  │          ↓
  │      Registrar abordaje
  │          ↓
  │         Fin
  │
  └── No → Informar que no hay disponibilidad
             ↓
            Fin
```

Esto permite entender visualmente qué ocurre desde que comienza el proceso hasta que termina.

---

# 2. ¿Para qué nos sirve un BPMN?

El BPMN nos sirve principalmente para **entender, organizar, comunicar y documentar un proceso**.

### Nos permite:

**1. Entender el proceso**

Podemos observar todas las actividades que hacen parte del proceso y comprender cómo están relacionadas.

**2. Identificar responsables**

Podemos establecer quién realiza cada actividad.

Por ejemplo:

- Agente de la aerolínea.
- Pasajero.
- Sistema.

**3. Encontrar errores o problemas**

Al visualizar el proceso podemos encontrar actividades repetidas, pasos innecesarios o decisiones que no están correctamente definidas.

**4. Diseñar el funcionamiento del sistema**

Antes de programar una aplicación podemos representar cómo debería funcionar.

Esto ayuda a los desarrolladores a entender qué debe hacer el sistema.

**5. Comunicar una idea**

Un BPMN permite explicar un proceso sin tener que escribir grandes cantidades de texto.

**6. Servir como base para el desarrollo**

El BPMN puede utilizarse como referencia para posteriormente construir el sistema o automatizar el proceso.

---

# 3. ¿Cómo abordar un BPMN?

Para construir correctamente un BPMN debemos empezar por entender el proceso antes de dibujarlo.

Una buena forma de hacerlo es seguir estos pasos:

## Paso 1: Entender el proceso

Primero debemos preguntarnos:

> ¿Qué proceso queremos representar?

Por ejemplo:

**Venta y control de tiquetes aéreos.**

Debemos entender qué sucede desde que comienza una solicitud hasta que termina.

---

## Paso 2: Identificar quiénes participan

Debemos identificar las personas, sistemas o áreas que intervienen.

En nuestro caso podemos tener:

- **Pasajero**
- **Agente de la aerolínea**
- **Sistema**

Estos participantes pueden representarse mediante diferentes **pools** o **lanes**.

---

## Paso 3: Identificar el inicio

Todo proceso debe tener un punto donde comienza.

Por ejemplo:

> El pasajero solicita una reserva.

Esto puede representarse con un **evento de inicio**.

---

## Paso 4: Identificar las actividades

Después debemos listar las acciones que ocurren durante el proceso.

Por ejemplo:

1. Solicitar reserva.
2. Registrar reserva.
3. Consultar disponibilidad.
4. Emitir tiquete.
5. Asignar asiento.
6. Registrar equipaje.
7. Registrar pago.
8. Registrar abordaje.
9. Consultar pasajeros que no viajaron.

Cada una de estas acciones puede convertirse en una **tarea** dentro del BPMN.

---

## Paso 5: Identificar las decisiones

Los procesos normalmente tienen condiciones.

Por ejemplo:

> ¿Existe disponibilidad de vuelo?

Si la respuesta es **Sí**, el proceso continúa.

Si la respuesta es **No**, se informa al usuario y el proceso puede finalizar.

Estas decisiones se representan mediante un **Gateway**.

---

## Paso 6: Identificar los resultados

Finalmente debemos establecer qué sucede al terminar el proceso.

Por ejemplo:

- Tiquete emitido.
- Asiento asignado.
- Pago registrado.
- Abordaje registrado.
- Pasajero marcado como no-show.

---

# 4. Elementos básicos de BPMN

Para comenzar no necesitamos aprender todos los elementos de BPMN. Los más importantes son:

| Elemento | Función |
|---|---|
| Evento de inicio | Indica dónde comienza el proceso |
| Tarea | Representa una actividad |
| Gateway | Representa una decisión |
| Flujo de secuencia | Indica el orden de las actividades |
| Evento de fin | Indica dónde termina el proceso |
| Pool | Representa un participante o proceso |
| Lane | Divide responsabilidades dentro de un participante |
| Evento intermedio | Representa algo que sucede durante el proceso |

### Ejemplo visual básico

```text
○ Inicio
   ↓
[Registrar reserva]
   ↓
◇ ¿Hay disponibilidad?
   ↓ Sí
[Emitir tiquete]
   ↓
[Asignar asiento]
   ↓
◎ Fin
```

---

# 5. Entender tú y yo qué es un BPMN

Para nosotros, la idea principal es esta:

> **Un BPMN es un mapa visual de un proceso.**

No debemos verlo simplemente como un dibujo.

El BPMN representa **qué sucede, quién lo hace, qué decisiones existen y cuál es el resultado**.

Por ejemplo:

```text
INICIO
  ↓
Registrar reserva
  ↓
Verificar disponibilidad
  ↓
¿Disponible?
 ↙       ↘
NO        SÍ
↓          ↓
Informar   Emitir tiquete
           ↓
       Asignar asiento
           ↓
       Registrar pago
           ↓
          FIN
```

Si entendemos este flujo, podemos convertirlo posteriormente en un diagrama BPMN utilizando una herramienta como **Camunda**.

---

# 6. Abordar el BPMN con Camunda

**Camunda** es una plataforma que permite modelar y automatizar procesos utilizando estándares como BPMN.

Para nuestro proyecto podemos utilizar Camunda para pasar de la idea del proceso a un **diagrama BPMN organizado y formal**.

El objetivo no es simplemente hacer un diagrama bonito.

La idea es:

```text
Proceso del negocio
       ↓
Análisis del proceso
       ↓
Diagrama BPMN
       ↓
Camunda
       ↓
Proceso organizado
       ↓
Mockup del sistema
```

---

# 7. ¿Cómo trabajar nuestro BPMN en Camunda?

Primero debemos identificar las actividades de nuestro proceso.

Para el sistema de **venta y control de tiquetes aéreos**, podemos organizarlo de la siguiente manera:

## Participantes

### Pasajero

Realiza acciones como:

- Solicitar una reserva.
- Proporcionar sus datos.
- Seleccionar un vuelo.
- Realizar el pago.

### Agente de la aerolínea

Realiza acciones como:

- Gestionar reservas.
- Emitir tiquetes.
- Asignar asientos.
- Registrar equipaje.
- Registrar pagos.
- Registrar abordajes.
- Consultar pasajeros que no viajaron.

### Sistema

Se encarga de:

- Validar información.
- Consultar disponibilidad.
- Guardar datos.
- Generar información.
- Actualizar estados.

---

# 8. Ejemplo del proceso para nuestro proyecto

El proceso principal podría comenzar así:

```text
Inicio
  ↓
Solicitar reserva
  ↓
Registrar datos del pasajero
  ↓
Consultar vuelo
  ↓
¿Hay disponibilidad?
  ├── NO → Informar que no hay disponibilidad → Fin
  │
  └── SÍ
        ↓
    Crear reserva
        ↓
    Emitir tiquete
        ↓
    Asignar asiento
        ↓
    ¿Registra equipaje?
        ├── SÍ → Registrar equipaje → Registrar pago
        │
        └── NO → Registrar pago
                    ↓
              Confirmar tiquete
                    ↓
              Registrar abordaje
                    ↓
                   Fin
```

Este flujo posteriormente puede representarse correctamente utilizando los elementos BPMN dentro de Camunda.

---

# 9. BPMN y Mockup

Aquí está uno de los puntos más importantes del proyecto:

> **El BPMN y el Mockup deben estar relacionados.**

El BPMN representa **cómo funciona el proceso**.

El Mockup representa **cómo se verá y cómo interactuará el usuario con el sistema**.

Por ejemplo:

### BPMN

```text
Registrar pasajero
       ↓
Consultar vuelo
       ↓
Seleccionar vuelo
       ↓
Crear reserva
       ↓
Emitir tiquete
```

### Mockup

Podríamos tener pantallas como:

```text
┌──────────────────────────────┐
│       REGISTRAR PASAJERO     │
├──────────────────────────────┤
│ Documento: [____________]    │
│ Nombre:    [____________]    │
│ Fecha nac: [____________]    │
│                              │
│        [ CONTINUAR ]         │
└──────────────────────────────┘
```

Después:

```text
┌──────────────────────────────┐
│       BUSCAR VUELO           │
├──────────────────────────────┤
│ Origen:  [____________]      │
│ Destino: [____________]      │
│ Fecha:   [____________]      │
│                              │
│          [ BUSCAR ]          │
└──────────────────────────────┘
```

Y posteriormente:

```text
┌──────────────────────────────┐
│       EMITIR TIQUETE         │
├──────────────────────────────┤
│ Pasajero: Juan Pérez         │
│ Vuelo:     AV123             │
│ Asiento:   12A               │
│ Clase:     Económica         │
│                              │
│       [ CONFIRMAR ]          │
└──────────────────────────────┘
```

De esta manera, cada parte importante del BPMN puede tener una representación dentro del Mockup.

---

# 10. ¿Por qué el BPMN es importante antes del Mockup?

Porque nos permite saber **qué pantallas necesitamos crear**.

Por ejemplo:

| Proceso BPMN | Posible pantalla del Mockup |
|---|---|
| Registrar pasajero | Formulario de pasajero |
| Consultar vuelo | Buscador de vuelos |
| Crear reserva | Pantalla de reserva |
| Emitir tiquete | Pantalla de emisión |
| Asignar asiento | Mapa o selección de asiento |
| Registrar equipaje | Formulario de equipaje |
| Registrar pago | Pantalla de pago |
| Registrar abordaje | Pantalla de abordaje |
| Consultar no-show | Reporte de pasajeros |

Así evitamos diseñar pantallas que no tienen relación con el funcionamiento real del sistema.

---

# 11. Paso muy importante: BPMN → Mockup

La relación que debemos tener presente es:

```text
             PROCESO DEL NEGOCIO
                     ↓
                   BPMN
                     ↓
          Actividades y decisiones
                     ↓
          Funciones del sistema
                     ↓
                  Mockup
                     ↓
             Pantallas y botones
```

Por ejemplo:

```text
BPMN
  ↓
"Registrar pasajero"
  ↓
Función del sistema
  ↓
"Crear pasajero"
  ↓
Mockup
  ↓
Pantalla "Registrar pasajero"
```

Otro ejemplo:

```text
BPMN
  ↓
"Asignar asiento"
  ↓
Función del sistema
  ↓
"Seleccionar asiento"
  ↓
Mockup
  ↓
Pantalla con los asientos disponibles
```

---

# 12. ¿Qué debemos comprobar antes de presentar?

Antes de pasar el BPMN al Mockup debemos revisar:

- [ ] El proceso tiene un inicio.
- [ ] El proceso tiene un final.
- [ ] Todas las actividades tienen un orden lógico.
- [ ] Las decisiones están correctamente representadas.
- [ ] Cada actividad tiene un responsable.
- [ ] Las actividades del BPMN corresponden con funciones del sistema.
- [ ] Las funciones importantes tienen una pantalla o elemento en el Mockup.
- [ ] Los nombres utilizados en el BPMN coinciden con los nombres del sistema.
- [ ] No existen actividades innecesarias.
- [ ] El flujo completo se puede explicar fácilmente.

---

# 13. Conclusión

El **BPMN** es una herramienta que nos permite representar de manera visual cómo funciona un proceso.

Para nuestro proyecto, primero debemos **entender el proceso de venta y control de tiquetes aéreos**, identificar quién participa, qué actividades se realizan y qué decisiones existen.

Después podemos utilizar **Camunda** para construir el BPMN de manera organizada.

Finalmente, el BPMN nos sirve como guía para construir el **Mockup**, porque cada actividad importante del proceso puede convertirse en una función, pantalla, formulario, botón o reporte dentro del sistema.

La idea principal que debemos recordar es:

> **Primero entendemos el proceso, después hacemos el BPMN, y luego usamos ese BPMN como guía para diseñar el Mockup.**

### Flujo general del proyecto

```text
ENTENDER EL PROBLEMA
        ↓
IDENTIFICAR EL PROCESO
        ↓
IDENTIFICAR PARTICIPANTES
        ↓
IDENTIFICAR ACTIVIDADES
        ↓
IDENTIFICAR DECISIONES
        ↓
CREAR BPMN EN CAMUNDA
        ↓
VALIDAR EL PROCESO
        ↓
IDENTIFICAR FUNCIONES DEL SISTEMA
        ↓
DISEÑAR EL MOCKUP
        ↓
COMPROBAR QUE BPMN Y MOCKUP
COINCIDAN
```

**En pocas palabras:**

> **BPMN = mapa del proceso.**  
> **Camunda = herramienta para modelar el proceso.**  
> **Mockup = representación visual del sistema.**  
> **BPMN → nos dice qué debe hacer el sistema.**  
> **Mockup → nos muestra cómo se verá ese sistema.**