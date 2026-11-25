FROM gradle:9.9.2-jdk17-alpine AS build

WORKDIR /app

COPY . .

RUN gradle clean build -x test


FROM eclipse-temurin:17-jdk-alpine-3.24

WORKDIR /app
 
COPY --from=build /app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
