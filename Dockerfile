FROM jgoerzen/dosemu

MAINTAINER John Goerzen <jgoerzen@complete.org>

COPY setup/ /tmp/setup/
COPY supervisor/ /etc/supervisor/conf.d/
COPY scripts/ /usr/local/bin/
RUN /tmp/setup/setup.sh && rm -r /tmp/setup
COPY inetd.conf /etc/inetd.conf

EXPOSE 5901 23 2023
CMD ["/usr/local/bin/boot-supervisord"]

