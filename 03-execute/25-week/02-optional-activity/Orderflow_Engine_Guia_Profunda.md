# Orderflow Engine — Guía profunda, requisitos y posibles trampas

**Fuentes base:** enunciado `assignment/Prueba_Tecnica_Tech_Lead_1.pdf`; `spec/SPEC.md`, `architecture.md`, `api-contract.md`, `data-model.md`, `plan.md`, `TASKS.md`, `constitution.md`, `handoff/HANDOFF.md` y ADR-0001 del ZIP aportado.

> **Alcance de esta guía:** se distingue lo exigido por el enunciado, las decisiones técnicas documentadas y las recomendaciones de revisión. “Trampa” significa error sutil que puede romper una regla o una prueba, no requisito secreto.

## 1. Resumen ejecutivo

Orderflow Engine es un motor de precios y confirmación de pedidos para un marketplace B2B de bebidas que opera en varios países, marcas y tenants. El flujo es **catálogo → carrito → cotización → confirmación → historial**.

El problema no es solo sumar productos. El sistema debe garantizar cuatro invariantes:

1. **Total cotizado = total confirmado**, aunque cambien precios o palancas.
2. **Dinero exacto**, sin aritmética monetaria `float`/`double`, con escala, redondeo y puntos de redondeo explícitos.
3. **HTTP 201 significa pedido persistido y consultable**; los reintentos no duplican pedidos ni consumen crédito dos veces.
4. **Push y ERP no pierden eventos ni aplican dos veces el mismo evento**, incluso con fallos y reintentos.

La documentación define Java 21, Spring Boot, PostgreSQL, Liquibase, JUnit 5 y Testcontainers para API; Angular para el cliente web; Docker Compose para ejecución local. La arquitectura es hexagonal: dominio puro, casos de uso y adaptadores.

## 2. Qué pide la prueba técnica

| Área | Requisito del enunciado | Evidencia esperada |
|---|---|---|
| A1 — cálculo | Recibir carrito y palancas vigentes | Endpoint o caso de uso |
| Desglose | Bruto, descuentos y origen, regalos y cantidades, base gravable, impuestos, total | Resultado auditable por línea y total |
| Coexistencia | Documentar orden y justificación de palancas | Especificación y pruebas |
| Crédito | Indicar si el total cabe en el cupo | Validación sobre total final |
| Precisión | No usar punto flotante para dinero | Tipo, escala, regla y puntos de redondeo |
| Multi-país | Moneda, escala y tasas no codificadas en la lógica | Datos/políticas por país o tenant |
| A2 — idempotencia | `POST /orders` con clave idempotente | Reintentos no duplican ni vuelven a consumir crédito |
| A2 — consistencia | 201 solo si el pedido existe y se consulta | Commit antes de responder; lectura posterior |
| A2 — eventos | Push y ERP fiables ante fallos | Outbox, reintentos, deduplicación |
| A3 — ADR | Máximo una página | Decisiones, alternativas, exclusiones, revisión, riesgo y mitigación |
| Entrega | Código, tests con comando único, README, ADR e historial legible | Repositorio reproducible |
| Front opcional | Angular o Flutter; resumen de pedido | Sin texto cortado, controles ocultos o imágenes inconsistentes |

**Alcance:** el front es opcional en el enunciado. La especificación registra una ampliación deliberada al flujo web completo. La API no depende del front. También se dejan fuera autenticación real, administración de catálogo/palancas, push/ERP reales, pagos, cancelación y liberación de crédito, entre otros. No presentar funciones excluidas como implementadas.

## 3. Vocabulario del dominio

| Término | Significado |
|---|---|
| Tenant | Par país/marca que determina precios, palancas, impuestos, clientes y política monetaria |
| SKU / familia | Producto vendible y agrupación comercial |
| Carrito | SKUs, cantidades y forma de pago enviados para cotizar |
| Palanca | Regla de descuento por escala, combo u obsequio |
| Cotización | Instantánea sellada del cálculo: líneas, descuentos, impuestos y total |
| Pedido | Confirmación que referencia la cotización; no copia ni recalcula importes |
| Cupo de crédito | Límite, consumo y libro de movimientos |
| Idempotency key | Identificador estable de una intención de confirmar, reutilizado en reintentos |
| Outbox event | Evento persistido en la misma transacción del pedido |
| Relay | Proceso que reclama eventos pendientes, los envía y registra el resultado |
| Golden test | Prueba de aceptación con datos y resultado esperado para proteger una regla |

## 4. Motor de precios: orden de aplicación

La especificación define este pipeline:

| Paso | Operación | Motivo |
|---:|---|---|
| 1 | Elegibilidad de obsequios | Se evalúa con cantidades pagadas y subtotal bruto; el regalo no se activa a sí mismo |
| 2 | Combos | Consumen unidades primero para evitar doble beneficio |
| 3 | Descuentos por escala | Solo afectan unidades no consumidas por combos |
| 4 | Neto de línea | Bruto menos descuentos comerciales |
| 5 | Base gravable | Se obtiene después de descuentos comerciales |
| 6 | Impuesto por línea | Tasa por SKU y política de redondeo del país |
| 7 | Total | Suma de los importes calculados |
| 8 | Crédito | Se valida en la capa de aplicación tras conocer el total; no es una palanca del motor puro |

### 4.1 Descuentos por escala

La interpretación documentada de “tramos acumulativos” es **marginal**: cada porcentaje se aplica solo a las unidades de su tramo, y no se apilan porcentajes sobre una misma unidad. El descuento se redondea una vez por línea, no tramo por tramo.

**Ejemplo de la especificación:** SKU a 2.500 COP, cantidad 25; tramos 1–9 = 0 %, 10–19 = 5 %, 20+ = 10 %.

| Concepto | Importe |
|---|---:|
| Bruto: 25 × 2.500 | 62.500 COP |
| Tramo 10–19: 10 × 2.500 × 5 % | 1.250 COP |
| Tramo 20–25: 6 × 2.500 × 10 % | 1.500 COP |
| Descuento total | 2.750 COP |
| Base neta | 59.750 COP |
| Impuesto 19 % | 11.352,50 → 11.353 COP (`HALF_UP`) |
| Total | **71.103 COP** |

**Trampas:** aplicar ambos porcentajes a toda la cantidad; apilar porcentajes; redondear cada tramo; contar regalos o unidades del combo para alcanzar el umbral; aplicar a un SKU la regla de familia y la regla específica a la vez. La especificación prioriza la regla específica del SKU. Si una familia contiene varios SKU, asigna unidades a tramos en orden normalizado por código SKU para que el orden de entrada no cambie el precio.

### 4.2 Combos

Un combo define un conjunto de SKU y cantidades mínimas, con precio por aplicación. Las unidades consumidas por combo no reciben descuento por escala.

- Los combos se evalúan por ID, usando las unidades que queden tras combos anteriores.
- Si `precio_combo × aplicaciones ≥ valor_lista` de las unidades consumidas, no se aplica el combo ni se consumen unidades.
- El descuento general debe tener origen `COMBO:<id>`.
- Los productos participantes no deben aparecer como descuentos sueltos. `comboAllocations` distribuye el descuento entre líneas para derivar la base gravable; no es una segunda entrada de descuento.
- El reparto por línea debe conservar el importe total sin crear ni destruir dinero por redondeo.

**Trampas:** descontar dos veces; aplicar tier discount a unidades ya consumidas; consumir unidades cuando el combo no es favorable; cambiar resultados según el orden accidental de iteración; perder céntimos/unidades monetarias al repartir el descuento.

### 4.3 Obsequios

El regalo debe aparecer con SKU y cantidad, con precio de producto cero. Eso no significa automáticamente que no tenga implicaciones fiscales: la política de impuestos de regalos depende del país/tenant.

**Trampas:** ocultar el regalo; no mostrar cantidad; cobrar el precio normal; excluir siempre el regalo de la base gravable; contar el regalo para activar su propia condición; permitir que una cantidad derivada desborde el tipo numérico.

### 4.4 Impuestos y precisión monetaria

| Decisión | Regla documentada |
|---|---|
| Representación | Value object `Money` con `BigDecimal` |
| Punto flotante | `float` y `double` prohibidos en el dominio |
| Escala/redondeo | Proceden de la configuración de país |
| Impuesto | Por SKU, sobre base después de descuentos comerciales |
| Punto de redondeo | Por línea, conforme a los puntos explícitos de la especificación |
| Multi-país | Moneda, escala, tasas, política fiscal de regalos y TTL son datos, no constantes |
| Comparación | Comparar valores decimales correctamente; no depender de igualdad sensible a escala sin motivo |

**Trampas:** usar `double`; convertir a decimal después de calcular en binario; redondear al final cuando se exige por línea; fijar dos decimales para todos los países; codificar tasas o `HALF_UP` en el dominio; comparar `BigDecimal` con `equals` cuando se quiere comparar valor numérico; olvidar fiscalidad del regalo o asignación del descuento de combo.

## 5. Cotización sellada: única fuente de verdad

Las líneas y componentes de descuento de una cotización son insert-only durante su vigencia. El pedido la referencia y no guarda otra copia de importes ni vuelve a calcularlos.

| Estrategia | Riesgo |
|---|---|
| Recalcular al confirmar | Cambios de precios/palancas producen otro total |
| Copiar importes al pedido | Dos fuentes de verdad pueden divergir |
| Sellar cotización y referenciarla | Desglose y total se conservan en un único lugar |

La cotización tiene vencimiento. El ADR identifica el riesgo de conservar un precio incorrecto hasta expirar y plantea TTL de 15 minutos por país y revocación como mitigación. La revocación se identifica como fuera del alcance implementado en el ADR; no describirla como funcionalidad ya construida sin evidencia.

**Trampas:** permitir `UPDATE` de líneas selladas; recalcular al confirmar; no validar vigencia/estado; responder con un importe no persistido; decir que la revocación existe cuando el documento la deja fuera de alcance.

## 6. Confirmación idempotente y HTTP 201

La prueba se origina en un defecto real descrito en el enunciado: se devolvía un número de orden y luego no aparecía en historial o no se había guardado.

La regla es: **solo responder 201 después del commit** de la transacción que deja el pedido persistido y consultable.

La transacción documentada incluye:
- pedido;
- consumo de crédito y asiento en el libro, si corresponde;
- clave de idempotencia y resultado asociado;
- eventos de outbox para push y ERP.

Orden de bloqueo documentado: **clave de idempotencia → cotización → cupo de crédito**. No se hacen llamadas remotas dentro de la transacción.

### Flujo recomendado para explicar la garantía

1. El cliente genera una clave estable para la intención de confirmar.
2. Reutiliza esa misma clave si hay mala red, doble toque o timeout.
3. El servidor resuelve si esa clave ya tiene un resultado.
4. Valida cotización y vigencia.
5. Bloquea y valida el cupo si el pedido es a crédito.
6. En una transacción persiste pedido, crédito, idempotencia y outbox.
7. Hace commit.
8. Solo entonces responde 201; el pedido debe poder consultarse.
9. El reintento con la misma clave recupera el resultado existente, sin pedido nuevo ni consumo adicional.

**Trampas:** generar nueva clave por cada intento; guardar la clave después del pedido; confirmar pedido y crédito en transacciones separadas; responder antes del commit; cachear éxito antes de commit; no definir misma clave con cuerpo diferente; no proteger crédito ante concurrencia; probar solo el código 201 y no consultar el pedido.

## 7. Modelo de consistencia y Transactional Outbox

La base de datos protege el núcleo local mediante ACID. Los efectos externos son asíncronos: el pedido puede estar confirmado y consultable mientras push o ERP sigue pendiente. Ese es el trade-off deliberado para no depender de la disponibilidad de terceros durante la transacción de confirmación.

### Ciclo del outbox

1. Pedido y evento se escriben en la misma transacción.
2. Un relay reclama el evento pendiente con un lease temporal.
3. Confirma la reclamación y sale de la transacción.
4. Llama al servicio externo fuera de la transacción.
5. Marca enviado si aún posee el lease; si falla, reintenta o registra estado terminal.
6. El evento tiene `event_id` estable y el consumidor deduplica por ese ID.

| Fallo | Resultado correcto |
|---|---|
| API falla antes del commit | No quedan pedido ni evento confirmados |
| Commit realizado, API cae antes de responder | El reintento con misma clave recupera el resultado |
| Push/ERP caído | Evento queda pendiente/reintentable |
| Relay cae antes de enviar | Evento se puede reclamar tras expirar lease |
| Relay envía y cae antes de marcar SENT | Puede reenviar; consumidor deduplica `event_id` |
| Lease expiró y worker viejo responde | Worker viejo no debe sobrescribir al dueño actual |
| Reintentos agotados | Estado terminal/DEAD permite visibilidad y tratamiento |

**La distinción esencial:** el outbox evita perder la intención de entregar el evento. No garantiza por sí solo ejecución externa exactamente una vez: un crash después de enviar y antes de marcar SENT puede causar reenvío. La deduplicación del consumidor evita aplicar dos veces el mismo efecto.

**Trampas:** enviar antes de guardar el outbox; guardar el outbox en otra transacción; llamada remota dentro de transacción; afirmar “exactamente una vez” solo por usar outbox; no deduplicar; permitir que un relay sin lease marque el resultado; reintentar para siempre sin estado terminal. Métricas y alertas de pendientes/antigüedad son recomendaciones operativas y deben verificarse en la implementación.

## 8. Crédito: casos límite

El crédito se valida con el total final, no con el bruto ni antes de descuentos e impuestos.

| Caso | Comportamiento a comprobar |
|---|---|
| Total inferior al disponible | Puede proceder si las demás reglas se cumplen |
| Total igual al disponible | Confirmar la comparación definida por contrato/código |
| Total superior al disponible | Rechazo sin pedido confirmado ni consumo parcial |
| Dos pedidos concurrentes | No pueden gastar el mismo saldo disponible |
| Reintento con misma clave | No consume crédito de nuevo |
| Pago no a crédito | No consume cupo |
| Fallo a mitad de confirmación | Pedido, crédito, clave y outbox revierten juntos |

**Trampa:** comprobar el cupo sin bloqueo y descontarlo después. Dos peticiones pueden leer el mismo saldo y ambas excederlo. Para sostener una afirmación de seguridad concurrente se necesita prueba concurrente, no solo un test secuencial.

## 9. API y contratos

Rutas documentadas:
- `POST /api/v1/quotes`: calcular y guardar cotización.
- `GET /api/v1/quotes/{quoteId}`: consultar cotización.
- `POST /api/v1/orders` con `Idempotency-Key`: confirmar.
- `GET /api/v1/orders/{orderId}`: consultar pedido.
- `GET /api/v1/orders?customerId=...`: historial.
- `GET /api/v1/products`: catálogo de solo lectura para el cliente web, agregado en la extensión web.

Un contrato claro debe definir campos y tipos, tenant/cliente, moneda, origen de descuentos, regalos y cantidades, errores funcionales, vigencia, semántica de reintentos y significado de éxito. No inventar códigos HTTP o errores como si estuvieran definidos: la fuente contractual es `spec/api-contract.md`.

## 10. Arquitectura y límites de responsabilidad

| Zona | Responsabilidad | Límite |
|---|---|---|
| Dominio (`pricing.domain`) | Cálculo puro, reglas monetarias, objetos de valor | Sin Spring, JDBC, HTTP ni reloj |
| Casos de uso | Orquestar cotización y confirmación | Control de transacción y puertos |
| Adaptadores entrantes | REST, validación y mapeo | No contener lógica de precios |
| Adaptadores salientes | Persistencia, crédito, outbox, push/ERP fake | Implementar puertos definidos hacia adentro |
| PostgreSQL/Liquibase | Persistencia, constraints, índices y migraciones | La integridad crítica también se protege en BD |
| Angular | Mostrar flujo y desglose recibido | No recalcular dinero |
| Docker Compose | Ejecución local reproducible | Facilitar levantar stack y dependencias |

**Trampas:** lógica comercial en controladores; dominio dependiente de Spring/JDBC; cálculo duplicado en Angular; llamada remota con transacción abierta; validar solo en UI; afirmar integraciones push/ERP reales cuando la especificación usa fakes.

## 11. Pruebas obligatorias y ampliadas

### Golden tests del enunciado

| Test | Escenario | Debe probar |
|---|---|---|
| GT-01 | Descuento en dos tramos | Cálculo marginal y redondeo por línea |
| GT-02 | Combo | Sin descuentos sueltos duplicados ni doble descuento |
| GT-03 | Obsequio | SKU y cantidad aparecen en el desglose |
| GT-04 | Combo con impuestos | Base e impuesto correctos incluidos en total |
| GT-05 | Crédito excedido | Rechazo cuando el total no cabe |
| GT-06 | Cotizar y confirmar | Total confirmado exactamente igual al cotizado |

### Pruebas extra recomendadas

| Área | Caso | Defecto que descubre |
|---|---|---|
| Normalización | SKU repetido en distinto orden | Resultado depende del request |
| Cantidades | Cero, negativas, decimales, máximo y overflow de regalo | Entrada inválida o desbordamiento |
| Combos | Combos que compiten; precio igual/mayor a lista | Orden no determinista o consumo indebido |
| Descuentos | Regla de SKU y familia simultáneas | Doble aplicación |
| Impuestos | Regalo gravable/no gravable por país | Política ignorada |
| Multi-país | Escala y moneda distintas | Valores globales hardcodeados |
| Idempotencia | Dos requests concurrentes con misma clave | Duplicación |
| Idempotencia | Misma clave con cuerpo diferente | Reutilización ambigua |
| Transacción | Fallo antes del commit | Escritura parcial |
| Lectura | GET inmediatamente después de 201 | Pedido no consultable |
| Crédito | Dos pedidos que juntos exceden cupo | Sobreconsumo concurrente |
| Outbox | Caída externa; crash tras envío; lease vencido | Pérdida/duplicación/worker obsoleto |
| UI | Texto largo, teclado, imágenes heterogéneas | Defectos visuales del enunciado |

La constitución exige que las pruebas de reglas se hayan visto fallar antes de considerarse protección efectiva. No afirmar que se ejecutaron tests, cobertura o mutation score sin comando y salida verificables.

## 12. Front opcional: los tres defectos señalados

| Defecto | Prevención a nivel de componente | Prueba |
|---|---|---|
| Texto cortado | Layout flexible, wrapping, truncado solo intencional y texto accesible | Nombre largo en viewport mediano |
| Control tapado por barra/teclado | Áreas seguras, scroll, formularios adaptables y foco visible | Teclado abierto y acceso al último control |
| Imágenes con escalas distintas | Componente de imagen compartido, aspect ratio y política `object-fit` uniforme | Grid con imágenes panorámicas, cuadradas y verticales |

La documentación advierte que jsdom no calcula layout real: una prueba de ancho allí puede pasar falsamente. Para wrapping real, usar navegador headless con motor de layout (Chromium/Playwright según la documentación).

## 13. ADR-0001: cómo defender las decisiones

El ADR aceptado cubre cotización sellada, pedido que la referencia, transacción de confirmación, outbox y deduplicación.

| El ADR debe explicar | No debe confundirse con |
|---|---|
| Decisiones y alternativas descartadas | Lista genérica de tecnologías |
| Exclusiones conscientes | Trabajo terminado |
| Puntos de revisión de código | Preferencias sin relación con invariantes |
| Riesgo y mitigación concreta | Garantía absoluta sin trade-off |
| TTL y revocación como riesgo/mitigación propuesta | Revocación implementada si está fuera del alcance |

Puntos de revisión señalados: no `float`/`double`; comparación correcta de dinero; ninguna actualización de cotizaciones selladas; transacciones en casos de uso; orden de bloqueos; 201 después del commit; no cachear fallos como éxitos; relay fuera de transacción y solo dueño del lease marca resultado; golden tests que detectan regresiones; textos de usuario en i18n.

## 14. Entrega, repositorios y gobierno

La carpeta docs no es todo el sistema ejecutable. El README señala repositorios separados para API, web, infraestructura y herramientas. `handoff/HANDOFF.md` es el punto de entrada para retomar el trabajo y contiene estado, comandos, decisiones abiertas y trampas.

| Entregable | Verificación |
|---|---|
| API | Comando de tests, README, contrato y configuración |
| Web | Flujo, i18n, no cálculo monetario local y pruebas de navegador |
| Infra | Docker Compose reproducible |
| Tools | Generadores y checks de docs/diagramas/ADR |
| Docs | Enlaces, documentos indexados, pares de idioma y límite del ADR |
| Git | Commits comprensibles, PR con evidencia y ramas gobernadas |

Comandos documentados:
```bash
./mvnw verify
node orderflow-engine-tools/docs-check/check-docs.mjs
```
El primero es para API y necesita Docker para Testcontainers. El segundo se ejecuta desde la raíz del workspace con el repositorio de herramientas disponible. Esta guía resume la documentación: no sustituye ejecutar comandos ni verificar el estado actual.

## 15. Lista priorizada de posibles trampas

1. Recalcular al confirmar en vez de referenciar cotización sellada.
2. Responder 201 antes del commit o no probar la lectura posterior.
3. Usar `float`/`double`, escala fija o redondeo en punto incorrecto.
4. Interpretar mal los tramos o apilar porcentajes.
5. Aplicar descuento por escala a unidades consumidas por combo.
6. Duplicar el descuento del combo en el desglose.
7. Tratar regalos como siempre no gravables o no mostrar su cantidad.
8. Calcular impuesto sobre bruto en lugar de base tras descuentos.
9. Aplicar simultáneamente regla de SKU y de familia a las mismas unidades.
10. Crear una clave nueva en cada reintento o no definir clave con cuerpo distinto.
11. Consumir crédito fuera de la transacción o sin protección concurrente.
12. Hacer llamadas remotas con transacción abierta.
13. Escribir outbox en transacción separada del pedido.
14. Confundir outbox con “exactamente una vez”; falta deduplicación.
15. Dejar que worker sin lease marque el evento.
16. Tener solo tests de happy path.
17. Usar solo jsdom para afirmar comportamiento de layout.
18. Calcular dinero otra vez en el frontend.
19. Afirmar autenticación, revocación, pago o integración real fuera de alcance.
20. Declarar pruebas o métricas sin evidencia.
21. Ampliar alcance sin registrar desviación.
22. Editar artefactos generados manualmente y no ejecutar checks.

## 16. Preguntas para defender el proyecto

1. ¿Por qué la cotización sellada es más segura que recalcular o copiar importes?
2. ¿Qué significa descuento marginal por tramos y qué prueba lo demuestra?
3. ¿Qué evita que unidades de combo reciban descuento por escala?
4. ¿Dónde se redondea y por qué por línea?
5. ¿Qué hace que un 201 sea durable y consultable?
6. ¿Cómo evita el sistema que reintentos/concurrencia dupliquen pedido o crédito?
7. ¿Qué garantiza el outbox y qué no garantiza?
8. ¿Qué ocurre si ERP recibió el evento, pero el relay cayó antes de marcarlo enviado?
9. ¿Qué está fuera del alcance y cómo se evita presentarlo como terminado?
10. ¿Qué pruebas prueban invariantes y cuáles son solo pruebas generales?
11. ¿Cómo se conserva la pureza del dominio?
12. ¿Cómo se evita que el frontend muestre importes distintos a la API?

## 17. Síntesis para una defensa oral

La calidad se mide por **invariantes demostrables**, no por número de endpoints ni por cantidad de tecnologías. El centro del diseño es una cotización inmutable, cálculo monetario determinista, confirmación atómica e idempotente y entrega asíncrona fiable de eventos.

Para defender cualquier decisión, contestar siempre: **qué garantía se busca, qué mecanismo la protege y qué prueba demuestra que funciona**.

### Nota de fidelidad documental

Esta guía desarrolla la información presente en los documentos aportados. Las ampliaciones etiquetadas como “recomendadas” son sugerencias de revisión derivadas de los riesgos descritos, no requisitos adicionales atribuidos al enunciado. El estado real de ejecución de tests o integraciones debe verificarse con evidencias actuales.
