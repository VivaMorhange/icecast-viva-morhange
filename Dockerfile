FROM ghcr.io/djmaze/icecast:latest

COPY icecast.xml /etc/icecast.xml

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast.xml"]
