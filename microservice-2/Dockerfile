FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY target/microservice-2-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 5001

CMD ["java", "-jar", "app.jar"]
