FROM maven:3.8.5-openjdk-17 AS build

WORKDIR /app
COPY JavaStudentSystemProjesi /app

WORKDIR /app
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17
WORKDIR /app
COPY --from=build /app/target/JavaStudentSystemProjesi-1.0-SNAPSHOT-shaded.jar app.jar

EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
