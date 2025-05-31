# Use Maven to build the application
FROM maven:3.8.5-openjdk-11 AS build

# Set working directory inside the container
WORKDIR /app

# Copy your Maven project files
COPY pom.xml .
COPY src ./src

# Build the project (WAR file will be created in /app/target)
RUN mvn clean package

# Use official Tomcat image to run the WAR
FROM tomcat:9.0-jdk11

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the Maven build stage
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Render uses
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]