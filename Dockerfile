FROM ubuntu
RUN apt-get update
RUN apt-get install --fix-missing
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install maven -y
WORKDIR /usr/app
COPY . .
RUN ./mvnw install
WORKDIR /usr/app/target
RUN ls -la
RUN sh -c 'touch gcpcloudrunback-0.0.1-SNAPSHOT.jar'
EXPOSE 8080
CMD ["java","-jar","gcpcloudrunback-0.0.1-SNAPSHOT.jar"]
