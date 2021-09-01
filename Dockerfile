# Stage: Build
FROM node:14-alpine as builder
LABEL stage=builder
LABEL maintainer="mafiasoleh@gmail.com"

ARG REPO_URL={GENIEACS_REPO}
ARG BRANCH={GENIEACS_BRANCH}

WORKDIR /usr/src

RUN set -eux; \
  apk add --no-cache git coreutils; \
  git clone -b ${BRANCH} ${REPO_URL}; \
  cd genieacs; \
  npm install; \
  npm audit fix; \
  npm run build


# Stage: Final Image
FROM node:14-alpine
LABEL maintainer "mafiasoleh@gmail.com"

COPY --from=builder /usr/src/genieacs/dist /opt/genieacs

WORKDIR /opt/genieacs

RUN set -eux; \
  # install \
  npm install --cache /tmp/npm-cache; \
  # cleanup \
  rm -rf /root/.node-gyp /tmp/npm-*; \
  # bin links \
  ln -s /opt/genieacs/bin/genie* /usr/bin

ENV GENIEACS_CWMP_PORT 7457
ENV GENIEACS_NBI_PORT 7557
ENV GENIEACS_FS_PORT 7577
ENV GENIEACS_UI_PORT 3000

# Nullify entrypoint of nodejs
ENTRYPOINT ["/usr/bin/env"]
CMD ["sh"]