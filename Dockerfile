FROM jgoerzen/qemu-dos

MAINTAINER John Goerzen <jgoerzen@complete.org>

COPY setup/ /tmp/setup/
COPY supervisor/ /etc/supervisor/conf.d/
COPY scripts/ /usr/local/bin/
RUN /tmp/setup/setup.sh && rm -r /tmp/setup

EXPOSE 5901 23
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

