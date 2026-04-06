FROM debian:stable-slim

# Installer Icecast
RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copier ta configuration
COPY icecast.xml /etc/icecast2/icecast.xml

# Icecast écoute sur 8000
EXPOSE 8000

# Lancer Icecast avec ta config
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
