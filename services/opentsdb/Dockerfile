FROM phusion/baseimage:bionic-1.0.0
MAINTAINER Daniel B. Garcia (dandan02.0403@gmail.com)

ARG HBASE_TAR_LINK
ARG HBASE_HOME
ARG OPENTSDB_PACKAGE_LINK

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# prerequisites
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y openjdk-8-jdk

# set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV COMPRESSION=NONE
ENV HBASE_HOME=$HBASE_HOME

# hbase
RUN wget $HBASE_TAR_LINK
RUN mv -v hbase-*-bin.tar.gz /tmp/
RUN tar -xzvf /tmp/hbase-*-bin.tar.gz -C /opt/
RUN mkdir /etc/service/hbase
COPY hbase.sh /etc/service/hbase/run
RUN chmod +x /etc/service/hbase/run

# opentsdb
RUN wget $OPENTSDB_PACKAGE_LINK
RUN mv -v opentsdb-*_all.deb /tmp/
RUN dpkg -i /tmp/opentsdb-*_all.deb
# RUN /usr/share/opentsdb/tools/create_table.sh
# RUN mkdir /etc/service/opentsdb
# COPY opentsdb.sh /etc/service/opentsdb/run
# RUN chmod +x /etc/service/opentsdb/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# hbase http port
EXPOSE 16010
# hbase zookeeper client port
EXPOSE 2181
# opentsdb http port
EXPOSE 4242