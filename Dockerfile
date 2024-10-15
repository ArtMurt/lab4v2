FROM nginx:latest
COPY index.html /var/www/company.com/
COPY pic.jpg /var/www/company.com/img/
COPY default.conf /etc/nginx/conf.d/default.conf
RUN echo "deb http://security.debian.org/debian-security bookworm-security main contrib non-free" | tee /etc/apt/sources.list.d/kali-experimental.list && apt-get update && apt-get upgrade && apt-get clean && useradd sergei && groupadd osipov && usermod -G osipov sergei && chown -R sergei:osipov /var/www/ && chmod -R 754 /var/www/ && sed -i 's/nginx;/sergei;/g' /etc/nginx/nginx.conf 
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]