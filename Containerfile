FROM caddy:2.10.2-builder-alpine@sha256:e9307b3c84ee81547edcdd3c410a6e4619febd1fd0e52c70703c864b1531f59b AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:e9fd95fd7cea0c3403c622c5c2457cddcaf355a5eba11048b17cb3d99a828f33

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
