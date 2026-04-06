FROM icecast/icecast:2.4.4

COPY icecast.xml /etc/icecast.xml

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast.xml"]
