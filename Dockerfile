# First part: Compile and build angular

#Use the last image of node
FROM node:latest as build

#Set the working directory
WORKDIR /usr/local/app/

#Copy the source code to the working directory
COPY /front /usr/local/app
COPY /back /usr/local/app

RUN apt-get install openjdk-8-jdk maven

CMD ["sh", "-c", "cd back ; mvn clean package spring-boot: start"]

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
