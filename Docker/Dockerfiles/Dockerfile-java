FROM eclipse-temurin:21.0.5_11-jre-ubi9-minimal
WORKDIR /app
COPY ../../Java/AlgoritmoLog-1.0-SNAPSHOT-jar-with-dependencies.jar ./app.jar
COPY ../../.env .
ENTRYPOINT ["java", "-jar", "app.jar"]