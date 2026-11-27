# Decisión de diseño A2-DEC-01 – Modelo de roles y alcance MVP

**Estado:** decisión documental para explicitar el límite entre el diseño de clases A2 y el modelo de datos G2-P2.

## Contexto

El diagrama de clases A2 representa la asociación Usuario–Rol con multiplicidad muchos a muchos, lo que permite modelar una cuenta con más de un rol y un rol asignado a múltiples cuentas. En cambio, los modelos B1/B2 y el DDL de G2-P2 implementan un único rol principal por usuario mediante `Usuario.id_rol`.

## Decisión para la primera versión

La persistencia de la primera versión se limita a **un rol principal por cuenta**. La asociación más flexible de A2 expresa una posibilidad de extensión del modelo de aplicación, pero **no se debe interpretar como una funcionalidad multirol ya soportada por la base de datos actual**. La matriz de permisos de B6 se aplica al rol principal persistido.

## Consecuencia y evolución

Si el alcance requiere múltiples roles simultáneos por usuario, se deberá incorporar una entidad asociativa `UsuarioRol` (con PK/FK, restricción UNIQUE para la pareja usuario–rol y vigencia/estado si corresponde) y actualizar conjuntamente B1, B2, B4, B5, las reglas de seguridad y la prueba de integración. Hasta que ese cambio se diseñe y valide, la restricción de un rol principal es la regla del MVP.

## Impacto en los artefactos

- A2 (diagrama de clases) se conserva exactamente como estaba; no se modificó el diagrama.
- B1/B2/B5 conservan el modelo de persistencia de un rol principal por usuario.
- Esta nota registra la diferencia y evita afirmar que el multirol está implementado.

