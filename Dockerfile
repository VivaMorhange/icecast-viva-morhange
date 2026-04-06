FROM debian:stable-slim

# Dépendances nécessaires pour compiler Icecast
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        pkg-config \
        libxml2-dev \
        libxslt1-dev \
        libvorbis-dev \
        libogg-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Télécharger Icecast officiel
RUN curl -L https://downloads.xiph.org/releases/icecast/icecast-2.4.4.tar.gz -o icecast.tar.gz && \
    tar xzf icecast.tar.gz && \
    cd icecast-2.4.4 && \
    ./configure && make && make install

# Créer utilisateur icecast
RUN adduser --system --group icecast

# Créer les dossiers nécessaires
RUN mkdir -p /usr/local/icecast/logs && \
    touch /usr/local/icecast/logs/error.log && \
    touch /usr/local/icecast/logs/access.log && \
    chown -R icecast:icecast /usr/local/icecast

# Copier ta configuration
COPY icecast.xml /usr/local/etc/icecast.xml

# Droits
RUN chown -R icecast:icecast /usr/local/etc

EXPOSE 8000

USER icecast

CMD ["icecast", "-c", "/usr/local/etc/icecast.xml"]
