FROM alpine:3.6

RUN apk update && \
    apk add --no-cache nginx:1.19.2
COPY app /app
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80

RUN mkdir -p /run/nginx

# フォアグラウンドでnginx実行
CMD ["nginx","-g", "daemon off;"]
