FROM caddy:2.10.2-builder-alpine@sha256:6fe1c9dc798992b754e42e28d92aefb33372d38de74a6381c2b51cadf0244991 AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:e9fd95fd7cea0c3403c622c5c2457cddcaf355a5eba11048b17cb3d99a828f33

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
