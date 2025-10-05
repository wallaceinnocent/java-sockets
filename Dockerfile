FROM eclipse-temurin:21-jdk-alpine
WORKDIR /Sockets
COPY target/*.jar /Sockets/Sockets.jar
EXPOSE 8080
CMD ["java","-jar","Sockets.jar"]
