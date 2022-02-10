FROM node:alpine as node

WORKDIR /app
COPY . .
RUN npm i -g @angular/cli
RUN npm i
RUN npm run build

FROM nginx:alpine
COPY --from=node /app/dist/tp-bootiful-front /usr/share/nginx/html
EXPOSE 4200