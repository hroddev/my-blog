# Guía Rápida: hrod.dev Blog

Esta guía describe el flujo de trabajo estándar para crear nuevas publicaciones y actualizar la página principal de tu blog generado con Hugo y el tema Blowfish.

## 0. Preparar el Entorno (máquina o contenedor nuevo)

El tema Blowfish requiere **Hugo extended** en una versión reciente. Evita `apt install hugo` (la versión de Ubuntu suele estar desactualizada) y `snap` (no funciona en la mayoría de contenedores).

### Instalar Hugo extended

**Opción A: paquete `.deb` oficial (requiere `sudo`, Ubuntu/Debian x86_64)**

```bash
VER=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep -oP '"tag_name": "v\K[^"]+')
curl -LO "https://github.com/gohugoio/hugo/releases/download/v${VER}/hugo_extended_${VER}_linux-amd64.deb"
sudo dpkg -i "hugo_extended_${VER}_linux-amd64.deb"
rm "hugo_extended_${VER}_linux-amd64.deb"
```

**Opción B: binario para tu usuario (sin `sudo`)**

```bash
VER=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep -oP '"tag_name": "v\K[^"]+')
mkdir -p ~/.local/bin
curl -L "https://github.com/gohugoio/hugo/releases/download/v${VER}/hugo_extended_${VER}_linux-amd64.tar.gz" | tar -xz -C ~/.local/bin hugo
```

> Asegúrate de que `~/.local/bin` esté en tu `PATH` (en Ubuntu suele estarlo al abrir una terminal nueva).

Verifica la instalación; la salida debe incluir `+extended`:

```bash
hugo version
```

### Descargar el tema (submódulo)

El tema Blowfish es un submódulo de git, así que al clonar el repo la carpeta `themes/blowfish/` queda vacía. Para descargarlo:

```bash
# Si ya clonaste el repo
git submodule update --init

# O clonar todo de una vez
git clone --recurse-submodules <url-del-repo>
```

Este comando descarga el tema en el commit exacto que fija el repo. Para actualizar Blowfish a su última versión (pruébalo en local antes de hacer push):

```bash
git submodule update --remote themes/blowfish
git add themes/blowfish
git commit -m "update blowfish theme"
```

## 1. Crear una Nueva Publicación

Para mantener la estructura y consistencia, siempre utiliza el CLI de Hugo para generar nuevos archivos:

```bash
# Ejecutar desde la raíz del proyecto (donde está hugo.toml)
hugo new posts/nombre-de-tu-articulo.md
```

Esto generará un archivo con la cabecera (Frontmatter) preconfigurada con la fecha y hora actuales.

## 2. Configurar el Frontmatter (Categorías y Etiquetas)

Abre el archivo recién creado y clasifica tu contenido:

```yaml
---
title: "Título de tu artículo"
date: 2026-04-25T10:00:00-05:00
draft: false # Cambiar a false cuando estés listo para publicar
categories:
  - Linux      # Usa categorías para los pilares principales de tu blog
tags:
  - bash       # Usa etiquetas para temas más específicos
  - scripting
---
```

> **Importante:** La primera letra de las categorías suele ir en mayúscula para mantener uniformidad (ej. `Linux`, `Seguridad`).

## 3. Actualizar los Botones del Inicio (`_index.md`)

Los botones (pills) que aparecen en la página de inicio están configurados como HTML directo en `content/_index.md` para un control visual exacto.

Si agregas una **Categoría Nueva** (ej. `DevOps`) y quieres que aparezca un botón para ella en el inicio:

1. Abre `content/_index.md`.
2. Busca la sección `<div class="flex flex-wrap gap-3...">`.
3. Duplica uno de los enlaces `<a>` existentes.
4. Cambia el `href` y el texto visible:

```html
<!-- Ejemplo de nuevo botón -->
<a href="/categories/devops" class="px-4 py-1.5 text-sm font-semibold rounded-full bg-neutral-200 dark:bg-neutral-800 text-neutral-700 dark:text-neutral-300 hover:bg-primary-500 hover:text-white dark:hover:bg-primary-400 dark:hover:text-neutral-900 transition-colors border border-transparent hover:border-primary-500">DevOps</a>
```

## 4. Ejecutar Entorno Local

Para previsualizar tus cambios antes de enviarlos a GitHub:

```bash
hugo server -D
# O usar el comando actual que tienes: tbe azure-dev
```
