FROM phusion/baseimage:bionic-1.0.0
MAINTAINER Daniel B. Garcia (dandan02.0403@gmail.com)

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# prerequisites
RUN apt-get update
RUN apt-get install -y git
COPY ./hugo_0.25.1_Linux-64bit.deb /tmp/

# hugo
RUN apt install -y /tmp/hugo_0.25.1_Linux-64bit.deb

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# hugo server default port
EXPOSE 1313