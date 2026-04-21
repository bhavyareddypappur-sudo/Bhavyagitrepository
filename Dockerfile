FROM openjdk:17-alpine
WORKDIR /app
COPY target/my-app-1.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
