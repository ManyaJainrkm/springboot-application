# Stage 1: Build with Maven
FROM manyajainrkm/spring-boot-project:latest

WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and package the application
COPY src /app/src
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM manyajainrkm/spring-boot-project:latest

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

# Expose port for Spring Boot
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]

