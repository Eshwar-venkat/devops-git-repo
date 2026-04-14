FROM nginx:latest
WORKDIR /data
COPY ./index.html /usr/share/nginx/html/index.html
RUN apt-get update && apt-get install -y vim
RUN mkdir -p /data && echo "custom Nginx setup complete" >> /data/info.txt
EXPOSE 8080
CMD ["nginx","-g","daemon off;"]
