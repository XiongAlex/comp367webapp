# Use a Maven base image with JDK 17
FROM maven:3.8.4-openjdk-17 AS build

# Copy the project files into the image
COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp

# Build the project
RUN mvn -f /usr/src/myapp/pom.xml clean package

# Use an OpenJDK base image with JDK 17 to run the application
FROM openjdk:17-oracle

# Copy the built JAR file from the build stage
COPY --from=build /usr/src/myapp/target/*.jar /usr/app/myapp.jar

# Expose the port the app runs on
EXPOSE 8080

# Define the command to start the app
ENTRYPOINT ["java", "-jar", "/usr/app/myapp.jar"]