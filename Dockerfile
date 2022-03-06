FROM node:alpine as node

WORKDIR /usr/local/app
COPY . /usr/local/app
RUN npm i -g @angular/cli
RUN npm i
RUN npm run build

FROM nginx:alpine
COPY --from=node /usr/local/app/front/dist/tp-bootiful-front /usr/share/nginx/html
EXPOSE 4200
