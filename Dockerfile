FROM centos:latest
MAINTAINER vilas.chavan80@gmail.com
RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all
RUN yum -y install zip && \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf _MACOSX markups-kindle kindle.zip
#CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80