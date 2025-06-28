# AŞAMA 1: Build işlemi
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
WORKDIR /app/JavaStudentSystemProjesi
RUN mvn clean package -DskipTests

# AŞAMA 2: Sadece JAR’ı çalıştır
FROM openjdk:17
WORKDIR /app
COPY --from=build /app/JavaStudentSystemProjesi/target/JavaStudentSystemProjesi-1.0-SNAPSHOT-shaded.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
