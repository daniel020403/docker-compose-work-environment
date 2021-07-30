FROM phusion/baseimage:bionic-1.0.0
MAINTAINER Daniel B. Garcia (dandan02.0403@gmail.com)

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# prerequisites
RUN apt-get update

# mysql
RUN \
    apt-get install -y mysql-server && \
    sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/mysql.conf.d/mysqld.cnf
    # echo "mysqld_safe &" > /tmp/config && \
    # echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
    # echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
    # bash /tmp/config

RUN mkdir /etc/service/mysql
COPY mysql.sh /etc/service/mysql/run
RUN chmod +x /etc/service/mysql/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# mysql default port
EXPOSE 3306