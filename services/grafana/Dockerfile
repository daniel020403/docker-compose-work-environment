FROM phusion/baseimage:bionic-1.0.0
MAINTAINER Daniel B. Garcia (dandan02.0403@gmail.com)

ARG GRAFANA_TAR_LINK

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# prerequisites
RUN apt-get update
RUN apt-get install -y wget

# grafana
RUN wget $GRAFANA_TAR_LINK
RUN mv -v grafana-*.*-amd64.tar.gz /tmp
RUN tar -xzvf /tmp/grafana-*.*-amd64.tar.gz -C /opt/
RUN mkdir /etc/service/grafana
COPY grafana.sh /etc/service/grafana/run
RUN chmod +x /etc/service/grafana/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# grafana default port
EXPOSE 3000