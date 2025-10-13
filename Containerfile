FROM caddy:2.10.2-builder-alpine@sha256:6fe1c9dc798992b754e42e28d92aefb33372d38de74a6381c2b51cadf0244991 AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:953131cfea8e12bfe1c631a36308e9660e4389f0c3dfb3be957044d3ac92d446

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
