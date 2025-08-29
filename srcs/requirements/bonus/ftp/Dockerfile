FROM debian:latest

# Install FTP server + utilities
RUN apt-get update && apt-get install -y \
    vsftpd \
    passwd \
    procps \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /var/log/vsftpd

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY Tools/entrypoint.sh /Tools/entrypoint.sh
RUN chmod +x /Tools/entrypoint.sh

EXPOSE 20
EXPOSE 21
EXPOSE 21100-21110

CMD ["./Tools/entrypoint.sh"]

