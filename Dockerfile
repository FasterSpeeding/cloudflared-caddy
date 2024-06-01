FROM caddy:2.8.1-builder AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8.1-alpine

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
