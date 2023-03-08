FROM docker.io/library/eclipse-temurin:11.0.18_10-jdk-centos7
ADD hello.jar ./
RUN /opt/java/openjdk/bin/java -jar ./hello.jar 
