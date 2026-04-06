FROM debian:stable-slim

# Installer Icecast
RUN apt-get update && \
    apt-get install -y icecast2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Créer un utilisateur système icecast
RUN adduser --system --group icecast

# Créer le dossier de logs et donner les droits
RUN mkdir -p /var/log/icecast2 && \
    chown -R icecast:icecast /var/log/icecast2

# Copier ta configuration
COPY icecast.xml /etc/icecast2/icecast.xml

# Donner les droits à l'utilisateur icecast sur la config
RUN chown -R icecast:icecast /etc/icecast2

# Icecast écoute sur 8000
EXPOSE 8000

# Passer en utilisateur non-root
USER icecast

# Lancer Icecast
CMD ["icecast2", "-c", "/etc/icecast2/icecast.xml"]
