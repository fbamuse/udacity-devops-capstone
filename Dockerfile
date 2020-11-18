FROM nginx:1.18.0

COPY app/* /usr/share/nginx/html
#EXPOSE 80

#RUN mkdir -p /run/nginx


# フォアグラウンドでnginx実行
#CMD ["nginx","-g", "daemon off;"]
