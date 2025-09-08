FROM caddy:2.10.2-builder-alpine@sha256:e9307b3c84ee81547edcdd3c410a6e4619febd1fd0e52c70703c864b1531f59b AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:a4180db0805b3725ddf936d2e6290553745c7339c003565da717ee612fd8a888

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
