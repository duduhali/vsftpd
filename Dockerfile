
FROM alpine:3.15 AS download
WORKDIR /home
RUN set -ex; wget https://github.com/syncthing/syncthing/releases/download/v1.19.1/syncthing-linux-amd64-v1.19.1.tar.gz 
RUN  tar zxvf syncthing-linux-amd64-v1.19.1.tar.gz
RUN  cp syncthing-linux-amd64-v1.19.1/syncthing ./
RUN  rm -rf syncthing-linux-amd64-v1.19.1*


FROM fauria/vsftpd

MAINTAINER hairobotics
LABEL Description="vsftpd Docker image based on fauria/vsftpd. Supports synchronous data"

COPY run-server.sh /usr/sbin/
RUN chmod +x /usr/sbin/run-server.sh
COPY --from=download /home/syncthing /usr/sbin/
RUN chmod +x /usr/sbin/syncthing
ADD config.tar.gz  /home/.config/

EXPOSE 8384 22000

CMD ["/usr/sbin/run-server.sh"]
