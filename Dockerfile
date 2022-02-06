# First part: Compile and build angular

#Use the last image of node
FROM node:latest as build

RUN apt-get install openjdk-8-jdk maven

WORKDIR /usr/local/app/back
COPY /back /usr/local/app

CMD ["sh", "-c", "cd back ; mvn clean package spring-boot: start"]


#Set the working directory
WORKDIR /usr/local/app/

#Copy the source code to the working directory
COPY /front /usr/local/app

#Install the dependencies
RUN npm install

# Genere the build
RUN npm run build

#Second part: Serce app with nginx

#Use the last image of nginx
FROM nginx:latest

# Copy the build output to replace the default nginx contents
COPY --from=build /usr/local/app/front/dist/tp-bootiful-tests-as-ui-docker-mvps /usr/share/nginx/html 

#Expose port 80
EXPOSE 80
