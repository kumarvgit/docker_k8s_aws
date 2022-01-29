# Build pahse
FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Deploy phase

# any output will de discarded
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
