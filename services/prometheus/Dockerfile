FROM phusion/baseimage:bionic-1.0.0
MAINTAINER Daniel B. Garcia (dandan02.0403@gmail.com)

ARG PROMETHEUS_TAR_LINK

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# prerequisites
RUN apt-get update
RUN apt-get install -y wget

# prometheus
RUN wget $PROMETHEUS_TAR_LINK
RUN mv -v prometheus-*.*-amd64.tar.gz /tmp/
RUN tar -xzvf /tmp/prometheus-*.*-amd64.tar.gz -C /opt/
RUN mkdir /etc/service/prometheus
COPY prometheus.sh /etc/service/prometheus/run
RUN chmod +x /etc/service/prometheus/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prometheus default port
EXPOSE 9090