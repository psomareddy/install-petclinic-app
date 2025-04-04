# Spring PetClinic Sample Application [![Build Status](https://github.com/spring-projects/spring-petclinic/actions/workflows/maven-build.yml/badge.svg)](https://github.com/spring-projects/spring-petclinic/actions/workflows/maven-build.yml)

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/spring-projects/spring-petclinic)

## Understanding the Spring Petclinic application with a few diagrams
<a href="https://speakerdeck.com/michaelisvy/spring-petclinic-sample-application">See the presentation here</a>

## Building petclinic locally
PetClinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/) or [Gradle](https://spring.io/guides/gs/gradle/). You can build a jar file and run it from the command line (it should work just as well with Java 11 or newer):


Download and Install spring-petclinic application
```cmd
git clone https://github.com/spring-projects/spring-petclinic.git
```

```cmd
cd spring-petclinic
.\mvnw package -Dmaven.test.skip
```

Build artifact are built is target/spring-petclinic-{version}-SNAPSHOT.jar 

## Download Open Telemetry Java Instrumentation 

```cmd
Invoke-WebRequest -Uri https://github.com/signalfx/splunk-otel-java/releases/latest/download/splunk-otel-javaagent.jar -OutFile splunk-otel-javaagent.jar
```

## Running petclinic locally

```cmd
set OTEL_SERVICE_NAME=petclinic
set OTEL_RESOURCE_ATTRIBUTES=deployment.environment=dev,version=1.1.0
set OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4318

set JAVA_OPTIONS="-javaagent:.\\splunk-otel-javaagent.jar"

java %JAVA_OPTIONS% -jar .\\target\\spring-petclinic-3.4.0-SNAPSHOT.jar
```

You can then access petclinic here: http://localhost:8080/

## Build petclinic docker image

```cmd
docker build -t petclinic-app . -f Dockerfile
```

## Run petclinic docker container

```cmd
docker run --name petclinic -d -p 8080:8080 petclinic-app:latest -e OTEL_SERVICE_NAME="petclinic" -e OTEL_RESOURCE_ATTRIBUTES"deployment.environment=dev" -e OTEL_EXPORTER_OTLP_ENDPOINT="http://host.docker.internal:4318" 
```