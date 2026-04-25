# Guía Rápida: hrod.dev Blog

Esta guía describe el flujo de trabajo estándar para crear nuevas publicaciones y actualizar la página principal de tu blog generado con Hugo y el tema Blowfish.

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
