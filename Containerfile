# This is a comment line 
FROM ubi8/ubi:8.3 
LABEL description="This is a custom httpd container image" 
MAINTAINER NIC 
RUN yum install -y httpd && \
    yum clean all
RUN mkdir /documentation
EXPOSE 80 
ENV LogLevel "info" 
ADD https://www.vmware.com/content/dam/digitalmarketing/vmware/en/pdf/techpaper/performance/vsphere-esxi-vcenter-server-70U3-performance-best-practices.pdf /documentation 
COPY ./src/ /var/www/html/ 
#USER apache 
ENTRYPOINT ["/usr/sbin/httpd"] 
CMD ["-D", "FOREGROUND"] 
