# Cinco preguntas sobre el proyecto Orderflow Engine

**1. Motor de cálculo y orden de aplicación de las palancas comerciales**

¿Cómo se define y justifica el orden de aplicación de las palancas comerciales —descuentos por escala, combos, obsequios e impuestos— para garantizar que puedan coexistir en un mismo pedido y que el desglose del precio sea correcto?

**2. Consistencia entre la cotización y la confirmación del pedido**

¿Qué mecanismo utiliza el sistema para garantizar que el total de una cotización sea exactamente igual al total del pedido confirmado, incluso si los precios o las condiciones comerciales cambian entre ambos momentos?

**3. Precisión monetaria y soporte multi-país**

¿Cómo se representa y calcula el dinero para evitar errores de precisión, y cómo se gestionan la moneda, la escala decimal, las tasas impositivas y las reglas de redondeo de los diferentes países sin dejar valores específicos fijados en la lógica de negocio?

**4. Idempotencia y consistencia en la confirmación de pedidos**

¿Cómo garantiza el endpoint `POST /orders` que los reintentos de una solicitud no generen pedidos duplicados ni consuman el cupo de crédito más de una vez, y que toda respuesta exitosa con número de orden corresponda a un pedido persistido y consultable en el historial?

**5. Entrega confiable de eventos a sistemas externos**

¿Cómo garantiza el patrón *Transactional Outbox* que las notificaciones push y las publicaciones al ERP no se pierdan ante fallos del sistema, y cómo se gestionan los reintentos, la deduplicación y los errores cuando un servicio externo no está disponible?