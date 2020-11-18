FROM nginx:1.18.0

COPY app/index.html /usr/share/nginx/html
COPY app/* /usr/share/nginx/
#EXPOSE 80

#RUN mkdir -p /run/nginx


# フォアグラウンドでnginx実行
#CMD ["nginx","-g", "daemon off;"]
