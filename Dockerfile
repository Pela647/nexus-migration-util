FROM node:22.14.0-alpine

WORKDIR /app

COPY --chown=node:node package.json package-lock.json ./
RUN npm ci --omit=dev && npm cache clean --force

COPY --chown=node:node bin ./bin
COPY --chown=node:node src ./src

USER node

ENTRYPOINT ["node", "/app/bin/cli.js"]
CMD ["--help"]
