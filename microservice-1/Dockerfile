FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY target/microservice-1-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 5000

CMD ["java", "-jar", "app.jar"]
