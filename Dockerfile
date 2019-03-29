FROM trestletech/plumber


RUN mkdir /data
COPY api.R /data
WORKDIR /data

RUN install2.r --error \ 
    -r 'http://cran.rstudio.com' \
    googleAuthR googleAnalyticsR bigQueryR searchConsoleR \
    && Rscript -e "devtools::install_github('RhysJackson/googleKubernetesR')" 
    
# setup nginx
RUN apt-get update && \
apt-get install -y nginx apache2-utils && \
htpasswd -bc /etc/nginx/.htpasswd admin pedro

RUN openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/server.key \
        -out /etc/ssl/private/server.crt
 
ADD ./nginx.conf /etc/nginx/nginx.conf
ADD . /data    
EXPOSE 80 443 
CMD service nginx start && ["R", "-e", \
    "pr <- plumber::plumb('/data/api.R'); \
    pr$run(host='0.0.0.0', port=9000)"]

