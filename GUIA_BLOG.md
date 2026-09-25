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

Cada post es una carpeta (*page bundle*) con su `index.md` y sus imágenes. Créalo con el CLI de Hugo desde la raíz del proyecto:

```bash
hugo new content posts/nombre-de-tu-articulo
```

O con el atajo del `Makefile`:

```bash
make post nombre=nombre-de-tu-articulo   # crear post
make dev                                 # servidor local con borradores
make build                               # build de producción
```

Esto usa la plantilla `archetypes/posts/index.md` y genera:

```
content/posts/nombre-de-tu-articulo/
└── index.md   # frontmatter con fecha actual, draft: true y estructura base
```

Guarda las imágenes **dentro de esa carpeta** y enlázalas con ruta relativa:

```markdown
![Descripción de la imagen](diagrama.png)
```

- Una imagen llamada `feature.png` (o `.jpg`) se usa automáticamente como portada del post.
- Obsidian está configurado para guardar las imágenes pegadas en la misma carpeta de la nota.

> Si creas el post desde Obsidian, usa la plantilla `templates/nuevo-post.md` (Templater) dentro de una carpeta nueva en `content/posts/` y nombra la nota `index`.

## 2. Configurar el Frontmatter (Categorías y Etiquetas)

Abre el `index.md` recién creado y completa la cabecera:

```yaml
---
title: "Título De Tu Artículo"   # se genera a partir del nombre de la carpeta; ajusta tildes
date: 2026-09-25T10:00:00-05:00  # se completa automáticamente
draft: true                      # cambia a false cuando esté listo para publicar
description: "Resumen de una línea para tarjetas y SEO"
categories: ["Linux"]            # pilares principales del blog (mayúscula inicial)
tags: ["bash", "scripting"]      # temas específicos (minúsculas)
---
```

> **Importante:** Usa categorías con mayúscula inicial (`Linux`, `Infraestructura`, `Seguridad`) y etiquetas en minúsculas, reutilizando las existentes cuando apliquen para que los posts relacionados funcionen.

## 3. Botones del Inicio (Pills de Etiquetas)

Los botones (pills) de la página de inicio se **generan automáticamente** a partir de las etiquetas (`tags`) de todos los posts publicados. No hay que editarlos a mano: al usar una etiqueta nueva en un post, aparece su botón en el inicio.

La portada se define en `layouts/partials/home/custom.html` (`content/_index.md` solo indica `layout: "custom"`). Ahí puedes ajustar:

- **Colores:** la lista `$colors` (paleta Nord Aurora) se asigna en orden rotativo a cada etiqueta.
- **Estilo:** las clases del enlace `<a>` (tamaño, padding, bordes redondeados).

```go-html-template
{{ $colors := slice "#bf616a" "#d08770" "#ebcb8b" "#a3be8c" "#b48ead" }}
```

> Los posts con `draft = true` no generan botones en producción, pero sí se ven con `hugo server -D`.

## 4. Ejecutar Entorno Local

Para previsualizar tus cambios antes de enviarlos a GitHub:

```bash
hugo server -D
# O usar el comando actual que tienes: tbe azure-dev
```
