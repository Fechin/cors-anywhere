# Stage 1: build the application
FROM node:10.11-alpine AS dependencies
WORKDIR /app
COPY package*.json ./
RUN yarn install --production

# Stage 2: build the application
#FROM node:10.11-alpine
# https://pkgs.alpinelinux.org/packages?name=nodejs&branch=v3.9&repo=&arch=&maintainer=
FROM alpine:3.9
RUN apk add --no-cache nodejs yarn
WORKDIR /app
COPY . .
COPY --from=dependencies /app/node_modules ./node_modules
EXPOSE 4000
CMD ["yarn", "start"]
