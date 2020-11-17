FROM alpine:3.6

# nginxのインストール
RUN apk update && \
    apk add --no-cache nginx latest

# ドキュメントルート
COPY app /app
COPY default.conf /etc/nginx/conf.d/default.conf

# ポート設定
EXPOSE 80

RUN mkdir -p /run/nginx

# フォアグラウンドでnginx実行
CMD [nginx -g "daemon off;"]
