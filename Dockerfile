# =====================================================================
# Stage 1: Build the WAR file using Maven + JDK 8
# =====================================================================
FROM maven:3.8.6-openjdk-8 AS builder

WORKDIR /build

# Copy project files
COPY tendermanagement/pom.xml .
COPY tendermanagement/src ./src
COPY tendermanagement/WebContent ./WebContent

# Build WAR (skip tests since there are none)
RUN mvn clean package -DskipTests

# =====================================================================
# Stage 2: Deploy WAR into Tomcat 8.5
# =====================================================================
FROM tomcat:8.5-jdk8-openjdk

# Remove default Tomcat webapps to keep things clean
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR into Tomcat as ROOT.war so it runs at /
COPY --from=builder /build/target/tendermanagement-0.0.1-SNAPSHOT.war \
     /usr/local/tomcat/webapps/ROOT.war

# Copy the DB init script (used by Railway MySQL service)
COPY DataBase/init.sql /docker-entrypoint-initdb.d/init.sql

# Expose Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
