# Этап сборки с JDK 21
#FROM eclipse-temurin:21-jdk-jammy as builder

# Устанавливаем рабочую директорию
#WORKDIR /app

# Копируем все файлы проекта
#COPY . .

# Собираем приложение (исправлено: объединены команды WORKDIR и RUN)
#RUN ./gradlew -Pvaadin.productionMode=true bootJar -x test

# Этап выполнения (исправлено: добавлен новый FROM для multi-stage build)
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app

# Копируем только собранный JAR (исправлено: правильный путь к артефакту)
#COPY --from=builder /app/build/libs/*.jar app.jar
COPY vaadin.jar /app/app.jar

# Открываем порт приложения
EXPOSE 8080

# Команда запуска (исправлено: добавлены параметры JVM)
#ENTRYPOINT ["sh", "-c", "java -XX:+UseZGC -Xmx512m -jar app.jar"]
# Команда для запуска приложения
ENTRYPOINT ["java", "-jar", "app.jar"]