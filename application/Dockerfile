#This is just sample example to show how Dockerize the Java application built with Maven so that it can be easily deployed and scaled in the AWS environment

#official Maven Docker image with a specified version as our base image
FROM maven:3.8.2-openjdk-11 as build

WORKDIR /app
ADD ./src /app

#use Maven to compile and package the application
RUN mvn package

#start a new stage in the Dockerfile with a base image
FROM openjdk:11-jre-slim


#multi-stage build
COPY --from=build /app/target/my-application.jar /my-application.jar
CMD ["java", "-jar", "/my-application.jar"]
