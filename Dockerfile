# First part: Compile and build angular

#Use the last image of node
FROM node:latest as build

WORKDIR /usr/local/app

#Copy the source code to the working directory
COPY /front /usr/local/app
COPY /back /usr/local/app

#Set the working directory
WORKDIR /usr/local/app/front

#Install the dependencies
RUN npm install

# Genere the build
RUN npm run build

WORKDIR /usr/local/app/back

# Install Java and Maven
RUN  apt-get update -y && apt-get install software-properties-common -y &&  add-apt-repository ppa:webupd8team/java && apt-get install openjdk-11-jdk maven -y

# Run Spring Boot API
CMD ["sh", "-c", "cd /usr/local/app/back ; mvn clean package spring-boot: start"]

WORKDIR /usr/local/app/front

#Second part: Serce app with nginx

#Use the last image of nginx
FROM nginx:latest

# Copy the build output to replace the default nginx contents
COPY --from=build /usr/local/app/front/dist/tp-bootiful-tests-as-ui-docker-mvps /usr/share/nginx/html

#Expose port 80
EXPOSE 80
