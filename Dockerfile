FROM node:16-alpine3.16 AS builder

WORKDIR /app

COPY . .

RUN npm i
RUN npm run build

FROM nginx:alpine

EXPOSE 80

WORKDIR /usr/share/nginx/html

COPY --from=builder /app/build .

CMD ["nginx", "-g", "daemon off;"]