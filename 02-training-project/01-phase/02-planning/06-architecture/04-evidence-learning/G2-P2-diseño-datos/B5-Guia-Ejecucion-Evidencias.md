# B5-Guía de ejecución y evidencias técnicas pendientes

**Estado al 27/11/2026:** preparación documental completa; reejecución integral del DDL vigente, prueba UNIQUE compuesta y simulacro de restauración requieren ejecución real en MariaDB/MySQL y captura/log del aprendiz. No se deben marcar como ejecutados antes de obtener esos resultados.

## 1. Crear la base aislada con el DDL actual

Usar `B5-Prueba.sql`, que es la copia de prueba del DDL actual y crea `sigmavital_prueba` (no usar la base productiva `sigmavital`). En consola MariaDB/MySQL, desde la carpeta del producto:

```powershell
mariadb -u root -p < .\B5-Prueba.sql
```

En Windows/XAMPP, si el ejecutable se llama `mysql.exe`, sustituir `mariadb` por `mysql`. También se puede importar el archivo desde phpMyAdmin seleccionando la base de pruebas creada.

## 2. Verificar tablas, FK y CHECK del DDL vigente

```sql
SELECT COUNT(*) AS tablas
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'sigmavital_prueba' AND TABLE_TYPE = 'BASE TABLE';

SELECT COUNT(*) AS claves_foraneas
FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'sigmavital_prueba' AND CONSTRAINT_TYPE = 'FOREIGN KEY';

SELECT COUNT(*) AS restricciones_check
FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'sigmavital_prueba' AND CONSTRAINT_TYPE = 'CHECK';
```

Resultados esperados según el DDL de entrega: **11 tablas, 12 claves foráneas y 7 restricciones CHECK**. Guardar la salida textual o captura.

## 3. Probar la unicidad de AsignacionPersonal

Ejecutar `B5-Prueba-Unicidad-AsignacionPersonal.sql` después de importar `B5-Prueba.sql`:

```powershell
mariadb -u root -p sigmavital_prueba < .\B5-Prueba-Unicidad-AsignacionPersonal.sql
```

Resultado esperado del procedimiento: `CUMPLE`, `segundo_insert_rechazado = 1`, `registros_persistidos_en_transaccion = 1`. La prueba genera registros ficticios y hace `ROLLBACK`; no utiliza IDs del sistema ni datos reales. Guardar la salida real.

## 4. Simulacro de restauración aislada

Después de crear la base de prueba y comprobar que contiene las 11 tablas:

```powershell
mariadb-dump -u root -p --single-transaction --routines --triggers --events sigmavital_prueba > .\sigmavital_restore_test.sql
mariadb -u root -p -e "CREATE DATABASE sigmavital_restore_test CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mariadb -u root -p sigmavital_restore_test < .\sigmavital_restore_test.sql
```

Luego comprobar que la base restaurada contiene 11 tablas y las mismas restricciones:

```sql
SELECT COUNT(*) AS tablas_restauradas
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'sigmavital_restore_test' AND TABLE_TYPE = 'BASE TABLE';

SELECT COUNT(*) AS fk_restauradas
FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'sigmavital_restore_test' AND CONSTRAINT_TYPE = 'FOREIGN KEY';

SELECT COUNT(*) AS check_restauradas
FROM information_schema.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'sigmavital_restore_test' AND CONSTRAINT_TYPE = 'CHECK';
```

No ejecutar la restauración sobre una base productiva. Registrar fecha, hora, versión del motor, hash SHA-256 del respaldo, duración, tablas/FK/CHECK encontradas y resultado. Añadir el log real al producto antes de cambiar el checklist de `Pendiente` a `Cumple`.

## 5. Plantilla de registro (completar con evidencia real)

| Campo | Resultado real |
|---|---|
| Fecha/hora | Pendiente |
| Responsable | Pendiente |
| Motor/versión | Pendiente |
| Base de prueba | `sigmavital_prueba` |
| Tablas | Esperadas 11 / pendiente |
| FK | Esperadas 12 / pendiente |
| CHECK | Esperadas 7 / pendiente |
| Prueba UNIQUE compuesta | Espera CUMPLE / pendiente |
| Restauración aislada | Espera 11 tablas y restricciones / pendiente |
| Archivos log/captura | Pendiente |

