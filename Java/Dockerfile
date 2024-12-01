FROM eclipse-temurin:21.0.5_11-jre-ubi9-minimal
WORKDIR /app
COPY /AlgoritmoLog-1.0-SNAPSHOT-jar-with-dependencies.jar /app/miner.jar
COPY /.env /app/
ENTRYPOINT ["java", "-jar", "miner.jar"]