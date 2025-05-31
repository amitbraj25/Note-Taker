# Use Maven to build the project
FROM maven:3.8.7-eclipse-temurin-17 as builder

# Set working directory
WORKDIR /app

# Copy everything to container
COPY . .

# Build the WAR and copy webapp-runner
RUN mvn clean package

# Use Tomcat base image to run the WAR
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy WAR and webapp-runner from builder
COPY --from=builder /app/target/NoteTraker.war /app/NoteTraker.war
COPY --from=builder /app/target/webapp-runner.jar /app/webapp-runner.jar

# Run the application using webapp-runner
CMD ["java", "-jar", "webapp-runner.jar", "NoteTraker.war"]
