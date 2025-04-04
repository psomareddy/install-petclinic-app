set OTEL_SERVICE_NAME=petclinic
set OTEL_RESOURCE_ATTRIBUTES=deployment.environment=dev,version=1.1.0
set OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4318

set JAVA_OPTIONS="-javaagent:.\\splunk-otel-javaagent.jar"

java %JAVA_OPTIONS% -jar .\\spring-petclinic\\target\\spring-petclinic-3.4.0-SNAPSHOT.jar