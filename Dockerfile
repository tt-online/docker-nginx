FROM nginx:1.9.11

# Install wget and install/updates certificates
RUN apt-get update \
 && apt-get install -y -q --no-install-recommends \
    ca-certificates \
    wget \
 && apt-get clean \
 && rm -r /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

VOLUME ["/var/config-nginx/"]
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/nginx"]