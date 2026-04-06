FROM docker.io/olbat/icecast

COPY icecast.xml /etc/icecast.xml

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast.xml"]
