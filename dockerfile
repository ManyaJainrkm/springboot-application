# Stage 1: Build with Maven
FROM maven:3.9.9-openjdk-11 AS builder
WORKDIR /app
COPY ./src ./src
COPY ./pom.xml .
RUN mvn package -DskipTests

# Stage 2: Create the final image
FROM eclipse-temurin:11-jdk-alpine
ARG JAR_FILE=/app/target/app.jar
COPY --from=builder ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
