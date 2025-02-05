FROM openjdk:21-jdk

WORKDIR /app

# OpenTelemetry Java Agent 다운로드
RUN curl -L https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.30.0/opentelemetry-javaagent.jar -o /app/opentelemetry-javaagent.jar

COPY build/libs/sample-app-0.0.1-SNAPSHOT.jar /app/app.jar

CMD ["java", "-javaagent:/app/opentelemetry-javaagent.jar", "-jar", "/app/app.jar"]
