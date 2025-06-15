# ─── Base image for all stages ───────────────────────────────────────────────
FROM node:18-alpine AS base
WORKDIR /src
COPY package*.json ./

# ─── Dev stage (for local iteration & debugging) ────────────────────────────
FROM base AS dev
# install bash + wget in one layer, grab wait-for-it.sh, set perms
RUN apk add --no-cache bash wget \
 && wget -O /usr/local/bin/wait-for-it.sh \
      https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
 && chmod +x /usr/local/bin/wait-for-it.sh

ENV NODE_ENV=development
RUN npm install
COPY ./*.js ./
CMD ["node", "index.js"]

# ─── Production stage (default build target) ───────────────────────────────
FROM base AS production
ENV NODE_ENV=production
RUN npm ci --only=production
COPY ./*.js ./

# declare the listening port
EXPOSE 3000

CMD ["node", "index.js"]
