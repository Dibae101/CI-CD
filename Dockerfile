FROM tomcat:latest

LABEL maintainer="Batman"

ADD ./target/LoginWebApp-1.war /opt/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
