FROM node:latest as node

WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=node /usr/local/app/dist/tp-bootiful-tests-as-ui-docker-mvps /usr/share/nginx/html

EXPOSE 4200