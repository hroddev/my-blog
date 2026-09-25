.PHONY: post dev build

# Crear un post nuevo: make post nombre=mi-articulo
post:
	@test -n "$(nombre)" || (echo "Uso: make post nombre=mi-articulo" && exit 1)
	hugo new content posts/$(nombre)

# Servidor local con borradores
dev:
	hugo server -D

# Build de producción (igual que GitHub Actions)
build:
	hugo --minify
