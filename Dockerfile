FROM stackbrew/ubuntu:12.04
RUN apt-get update -qq && apt-get -y install nginx

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/ssl

ADD default /etc/nginx/sites-available/default
ADD default-ssl /etc/nginx/sites-available/default-ssl
ADD server.crt /etc/nginx/ssl/
ADD server.key /etc/nginx/ssl/
RUN ln -s /etc/nginx/sites-available/default-ssl /etc/nginx/sites-enabled/default-ssl

EXPOSE 80 443

CMD ["nginx"]
