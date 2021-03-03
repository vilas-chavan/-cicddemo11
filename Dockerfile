FROM centos:latest
MAINTAINER vilas.chavan80@gmail.com
RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all
RUN yum -y install zip && \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page261/reflux.zip /var/www/html
WORKDIR /var/www/html
RUN unzip reflux.zip
RUN cp -rvf templatemo_531_reflux/* .
RUN rm -rf templatemo_531_reflux reflux.zip
#CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80