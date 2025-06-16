# Temel Java 17 imajı
FROM openjdk:17-jdk-slim

# Uygulama dizini oluştur
WORKDIR /app

# JAR dosyasını konteynıra kopyala
COPY target/JavaStudentSystemProjesi-1.0-SNAPSHOT.jar app.jar

# Uygulama başlat
ENTRYPOINT ["java", "-jar", "app.jar"]
