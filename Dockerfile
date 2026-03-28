FROM scratch AS builder
ADD alpine-minirootfs-3.23.3-x86_64.tar /

ARG VERSION=1.0.0
ENV APP_VERSION=$VERSION

WORKDIR /usr/app

COPY index.html .

FROM nginx:alpine

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

COPY --from=builder /usr/app/index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["sh", "-c", "\
IP=$(hostname -i); \
HOST=$(hostname); \
echo \"<p>Adres IP: $IP</p>\" >> /usr/share/nginx/html/index.html; \
echo \"<p>Hostname: $HOST</p>\" >> /usr/share/nginx/html/index.html; \
nginx -g 'daemon off;' \
"]