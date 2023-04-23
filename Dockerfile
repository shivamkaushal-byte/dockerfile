FROM ubuntu:latest
LABEL Name="shivam kaushal"
ENV TZ=Asia/Dubai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt install -y tzdata
RUN apt-get install -y apache2
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php7.4 php7.4-cli php7.4-fpm php7.4-mysql
RUN apt-get install -y mysql-server
RUN service apache2 enable
CMD ["apache2ctl", "-D", "FOREGROUND"]
