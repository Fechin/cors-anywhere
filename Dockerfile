# Stage 1: build the application
FROM node:10.11-alpine AS dependencies
WORKDIR /app
COPY package*.json ./
RUN yarn install --production

# Stage 2: build the application
FROM node:10.11-alpine
WORKDIR /app
COPY . .
COPY --from=dependencies /app/node_modules ./node_modules
EXPOSE 4000
CMD ["yarn", "start"]