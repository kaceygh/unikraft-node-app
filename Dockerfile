FROM node:26-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:26-alpine AS runtime
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY index.js ./
EXPOSE 3000
CMD ["node", "index.js"]
