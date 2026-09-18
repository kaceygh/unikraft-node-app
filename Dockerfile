FROM node:26-alpine AS node
FROM scratch
# Node binary
COPY --from=node /usr/local/bin/node /usr/bin/node
# System libraries (musl)
COPY --from=node /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=node /usr/lib/libgcc_s.so.1 /usr/lib/libgcc_s.so.1
COPY --from=node /usr/lib/libstdc++.so.6 /usr/lib/libstdc++.so.6
# App
COPY ./server.js /usr/src/server.js
