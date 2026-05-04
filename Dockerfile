FROM alpine:latest
RUN apk add --no-cache ca-certificates curl
WORKDIR /app
RUN curl -L -H "Cache-Control: no-cache" -o v2.zip https://github.com/v2fly/v2ray-core/releases/download/v5.14.1/v2ray-linux-64.zip \
    && unzip v2.zip && chmod +x v2ray && rm v2.zip
COPY config.json /app/config.json
CMD ["./v2ray", "run", "-config", "/app/config.json"]
