FROM maven:3.9 AS builer

LABEL app="java-app" 

ARG APP_NAME=java-app

ARG JAR_FILE=target/*.jar
ENV environment=dev
WORKDIR /BUILD

COPY src ./src

RUN mvn clean install

FROM JDK;17

COPY --from=builder /builer/target app.jar

CMD ["java", "-jar", "app.jar"]
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]