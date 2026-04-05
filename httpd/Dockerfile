FROM httpd:latest
COPY ./index.html /usr/local/apache2/htdocs/
COPY ./my-proxy.conf /usr/local/apache2/conf/extra/my-proxy.conf

# Enable required proxy modules
RUN echo "LoadModule proxy_module modules/mod_proxy.so" >> /usr/local/apache2/conf/httpd.conf \
    && echo "LoadModule proxy_http_module modules/mod_proxy_http.so" >> /usr/local/apache2/conf/httpd.conf \
    && echo "Include conf/extra/my-proxy.conf" >> /usr/local/apache2/conf/httpd.conf
