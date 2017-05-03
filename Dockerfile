FROM jgoerzen/dosbox

MAINTAINER John Goerzen <jgoerzen@complete.org>

RUN mkdir /tmp/setup
COPY setup/sums /tmp/setup
COPY setup/doorsums /tmp/setup
# Do the download ASAP so we don't hit the download sites overly hard
COPY setup/download.sh /tmp/setup/download.sh
RUN /tmp/setup/download.sh

COPY setup/ /tmp/setup/
COPY supervisor/ /etc/supervisor/conf.d/
COPY scripts/ /usr/local/bin/
RUN /tmp/setup/setup.sh && rm -r /tmp/setup

EXPOSE 5901 23
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

VOLUME ["/dos/drive_g"]

