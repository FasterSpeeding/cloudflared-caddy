FROM caddy:2.10.2-builder-alpine@sha256:5fd6c969b828a4ccfd18767fd0420507d1c36f1d0a8c217805268a4825b78fb7 AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.10.2-alpine@sha256:4c6e91c6ed0e2fa03efd5b44747b625fec79bc9cd06ac5235a779726618e530d

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy
