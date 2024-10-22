FROM ubuntu:latest
LABEL authors="Mikita Bahurau"

RUN apt-get update && apt-get install -y openjdk-17-jdk
WORKDIR /app
ENV DEVOPS="Mikita Bahurau"
COPY target/docker-0.0.1-SNAPSHOT.jar /app/docker-bootcamp.jar

CMD ["java", "-jar", "docker-bootcamp.jar"]