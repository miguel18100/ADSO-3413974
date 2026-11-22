# Control de Versiones desde Cero — Git y GitHub

**Versión:** 1.0  
**Nivel:** Principiante  
**Tiempo estimado:** 20 minutos

---

## Introducción

Git es un sistema de control de versiones que registra los cambios de tus archivos a lo largo del tiempo. GitHub es una plataforma en la nube que almacena esos registros y permite compartirlos con otras personas.

Esta guía cubre el flujo básico para llevar un proyecto desde tu computadora hasta GitHub.

---

## Requisitos previos

Antes de comenzar, verifica que Git está instalado en tu sistema:

```bash
git --version
```

Si no está instalado, descárgalo en [git-scm.com](https://git-scm.com). Además necesitas una cuenta activa en [github.com](https://github.com).

---

## 1. Crear el repositorio en GitHub

Un repositorio es el espacio donde GitHub almacenará tu proyecto.

1. Inicia sesión en github.com
2. Haz clic en el botón **New** en el panel izquierdo
3. Escribe el nombre del repositorio (sin espacios, usa guiones)
4. Selecciona **Public** o **Private** según prefieras
5. Deja las demás opciones sin marcar
6. Haz clic en **Create repository**

> Guarda la URL que aparece, la necesitarás más adelante. Tiene este formato:
> `https://github.com/tu-usuario/nombre-del-repo.git`

---

## 2. Inicializar Git en tu proyecto

Abre la terminal y navega hasta la carpeta de tu proyecto:

```bash
cd ruta/a/tu/proyecto
```

Inicializa Git:

```bash
git init
```

Esto crea una carpeta oculta `.git` dentro de tu proyecto. No la borres ni la muevas.

---

## 3. Agregar archivos al área de preparación

El área de preparación (staging area) es un espacio intermedio donde seleccionas qué cambios irán en el próximo commit.

Para agregar todos los archivos:

```bash
git add .
```

Para agregar un archivo específico:

```bash
git add nombre-del-archivo.txt
```

Para verificar qué archivos están listos:

```bash
git status
```

---

## 4. Registrar los cambios con un commit

Un commit guarda una instantánea del estado actual del proyecto. Cada commit lleva un mensaje que describe qué cambió.

```bash
git commit -m "Descripción breve de los cambios"
```

**Buenas prácticas para el mensaje:**
- Usa verbos en presente: `Agrega`, `Corrige`, `Actualiza`
- Sé específico: `Corrige error de validación en formulario de login`
- Evita mensajes vagos como `cambios` o `arreglos`

---

## 5. Conectar con el repositorio remoto

Vincula tu proyecto local con el repositorio que creaste en GitHub:

```bash
git remote add origin https://github.com/tu-usuario/nombre-del-repo.git
```

Verifica que la conexión quedó registrada:

```bash
git remote -v
```

Deberías ver la URL del repositorio listada dos veces (fetch y push).

---

## 6. Subir los cambios a GitHub

Envía tus commits al repositorio remoto:

```bash
git push -u origin main
```

El flag `-u` establece `origin main` como destino por defecto. A partir de este punto, solo necesitas escribir `git push` en las siguientes subidas.

---

## 7. Descargar un repositorio existente

Para copiar un repositorio completo desde GitHub a tu computadora:

```bash
git clone https://github.com/usuario/nombre-del-repo.git
```

Esto descarga todos los archivos y el historial completo de commits.

---

## 8. Sincronizar cambios del repositorio remoto

Cuando otras personas realizan cambios en el repositorio, puedes traerlos a tu copia local con:

```bash
git pull
```

Ejecuta este comando antes de comenzar a trabajar cada vez que colabores con más personas.

---

## Referencia de comandos

| Comando | Descripción |
|---------|-------------|
| `git init` | Inicializa Git en la carpeta actual |
| `git status` | Muestra el estado de los archivos |
| `git add .` | Agrega todos los cambios al staging |
| `git add <archivo>` | Agrega un archivo específico |
| `git commit -m "msg"` | Guarda los cambios con un mensaje |
| `git remote add origin <url>` | Conecta con el repositorio remoto |
| `git push` | Sube los commits al remoto |
| `git push -u origin main` | Primera subida, establece el destino |
| `git clone <url>` | Descarga un repositorio completo |
| `git pull` | Trae los cambios del repositorio remoto |
| `git log --oneline` | Muestra el historial resumido de commits |

---

## Solución de problemas frecuentes

**El comando `git push` es rechazado**  
El repositorio remoto tiene cambios que tu copia local no tiene. Ejecuta `git pull` primero para sincronizar y luego vuelve a intentar el push.

**`git push` pide usuario y contraseña en cada uso**  
Configura una clave SSH o un token de acceso personal en GitHub para no tener que autenticarte manualmente cada vez.

**Se creó la rama como `master` en lugar de `main`**  
Renómbrala con:
```bash
git branch -m master main
```

**Hice un commit con un mensaje equivocado**  
Si aún no hiciste push, corrígelo con:
```bash
git commit --amend -m "Mensaje correcto"
```

---

## Próximos pasos

Una vez que domines este flujo básico, el siguiente tema recomendado es el trabajo con **ramas** (`git branch`), que permite desarrollar funcionalidades de forma aislada sin afectar el código principal.

---

*Documentación basada en Git 2.x — Para la referencia completa visita [git-scm.com/docs](https://git-scm.com/docs)*
