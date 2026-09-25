+++
date = '2026-09-25T12:01:59-05:00'
draft = true
title = 'El dilema del ingeniero: Cómo dejé de sobrepensar y construí este blog con Hugo, Obsidian y GitHub Pages'
description = 'Cómo pasé de diseñar una arquitectura compleja para un simple blog a un flujo minimalista con Obsidian, Hugo y GitHub Pages.'
categories = ["Infraestructura"]
tags = ["hugo", "obsidian", "github-pages", "github-actions", "markdown", "opensource"]
+++

Como ingeniero de infraestructura y nube, mi mente está cableada para que todo sea lógico, predecible y 100% reproducible. Dame un problema y mi primer instinto será abrir una herramienta de diagramado, diseñar una arquitectura tolerante a fallos y automatizarla.

Cuando decidí que quería empezar a publicar y compartir lo que aprendo, caí exactamente en esa trampa.

Mi mente empezó a diseñar el sistema "perfecto" para un simple blog: contenedores en la nube, un reverse proxy, bases de datos gestionadas, funciones serverless para el backend y pipelines complejos. Sobrepensé tanto el "cómo" que me olvidé del "qué". Me vi atrapado en la maldición de la sobreingeniería, intentando construir una nave espacial solo para cruzar la calle.

Últimamente, estoy luchando fuertemente contra ese instinto. Estoy intentando dejar espacio para lo impredecible, lo creativo, y obligándome a hacer las cosas más simples. Así que borré los diagramas y tomé una decisión: cero servidores que mantener, cero bases de datos, cero dolores de cabeza.

## La revelación de la simplicidad

Ya usaba Obsidian para mi toma de notas personal. Me encanta porque es simplemente Markdown: texto plano, portátil y rápido. La pieza que me faltaba era cómo llevar esas notas al mundo exterior sin fricción.

Un par de videos en YouTube, de [NetworkChuck](https://youtu.be/dnE7c0ELEH8) y [Christian Lempa](https://youtu.be/MX4yy1dTVYg), me dieron la guía que necesitaba y me hicieron redescubrir Hugo. Había escuchado de este generador de sitios estáticos hace años, pero nunca le presté la atención debida. Al probarlo, me pareció genial. Es absurdamente rápido, compila todo en milisegundos y encaja perfectamente con un flujo de trabajo minimalista.

Decidí unir Hugo con Tailwind, escribir mis posts en Obsidian y dejar que GitHub Pages hiciera el resto. Este es el sistema lógico y reproducible que logré, pero optimizado para no estorbar a la creatividad.

## El paso a paso: De Obsidian a Producción

Si eres de los que también sobrepiensan sus despliegues, aquí te dejo mi flujo de trabajo simplificado (GitOps para humanos):

### 1. El "Backend" (Obsidian)

Todo nace en Obsidian. Creé una carpeta en mi bóveda (vault) dedicada exclusivamente a los artículos del blog. Como Hugo usa Markdown con Front Matter (metadatos al inicio del archivo), configuré una plantilla en Obsidian para que cada nota nueva ya tenga el título, la fecha y el estado (draft: true/false).

### 2. El Motor (Hugo)

- Instalas Hugo en tu máquina local.
- Creas el sitio: `hugo new site mi-blog`
- Integras tu tema (o construyes uno con Tailwind).
- Apuntas la carpeta de contenido de Hugo a tu directorio de Obsidian.

### 3. La Automatización (GitHub Actions)

Aquí es donde la magia ocurre y mi lado ingeniero queda satisfecho. Subí el código a un repositorio en GitHub (puedes ver la estructura en mi repo [my-blog](https://github.com/hroddev/my-blog)). Configuré un archivo de GitHub Actions (`.github/workflows/hugo.yml`) que le dice a GitHub: "Cada vez que haga un commit en la rama principal, instala Hugo, compila el sitio y súbelo".

### 4. El Hosting (GitHub Pages)

El pipeline de GitHub Actions toma los archivos estáticos generados (HTML, CSS, JS puros) y los despliega automáticamente en GitHub Pages. Es gratis, tiene certificados SSL automáticos y no requiere configurar ni un solo reverse proxy.

## Conclusión

A veces, la mejor arquitectura es la que no existe. Renunciar al control de una infraestructura compleja me costó, pero me regaló algo mucho más valioso: tiempo para escribir.

Si estás posponiendo un proyecto personal porque estás diseñando la arquitectura perfecta en tu cabeza, te invito a probar el camino de menor resistencia. Abre un editor de texto, escribe, haz commit y publica. La simplicidad también es una forma de ingeniería elegante.

## Referencias

- NetworkChuck — [I started a blog.....in 2024 (why you should too)](https://youtu.be/dnE7c0ELEH8)
- Christian Lempa — [Building a static website in Markdown with Hugo](https://youtu.be/MX4yy1dTVYg)
