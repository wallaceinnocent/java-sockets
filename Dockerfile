FROM maven:3.5.4-eclipse-temurin-21-alpine AS build
WORKDIR /Sockets
COPY pom.xml .
CPOY src ./src
RUN mvn clean package -DskipTests


FROM eclipse-temurin:21-jdk-alpine
WORKDIR /Sockets
COPY --from=build /Sockets/target/*.jar Sockets.jar
EXPOSE 8080
CMD ["java","-jar","Sockets.jar"]
