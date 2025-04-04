FROM openjdk:17

EXPOSE 8080

# Adds the latest version of the Splunk Java agent
ADD --chown=javauser:javauser https://github.com/signalfx/splunk-otel-java/releases/latest/download/splunk-otel-javaagent.jar /opt/splunk-otel-javaagent.jar

WORKDIR /app

COPY ./spring-petclinic/target/spring-petclinic-3.4.0-SNAPSHOT.jar /app/petclinic.jar

ENTRYPOINT [ "java", "-javaagent:/opt/splunk-otel-javaagent.jar",  "-jar","/app/petclinic.jar"]