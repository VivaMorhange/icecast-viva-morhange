FROM moul/icecast

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast.xml"]

