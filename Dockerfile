FROM maven:3.9.6-eclipse-temurin-21-alpine AS build
WORKDIR /Sockets
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests


FROM eclipse-temurin:21-jdk-alpine
WORKDIR /Sockets
COPY --from=build /Sockets/target/*.jar Sockets.jar
EXPOSE 8080
CMD ["java","-jar","Sockets.jar"]
