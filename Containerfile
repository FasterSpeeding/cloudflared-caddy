FROM caddy:2.10.2-builder-alpine@sha256:407924573f6ac35cd8859ee88e958628ccbad34481c53de31b9536f918d7de39 AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
