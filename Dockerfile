FROM alpine:3.19

# Installer Icecast
RUN apk add --no-cache icecast

# Copier ta configuration
COPY icecast.xml /etc/icecast.xml

# Icecast écoute sur 8000
EXPOSE 8000

# Lancer Icecast avec ta config
CMD ["icecast", "-c", "/etc/icecast.xml"]
