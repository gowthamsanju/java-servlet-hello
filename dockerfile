FROM tomcat:latest
ADD ./target/hello.war /etc/tomcat/webapps/ 
EXPOSE 8080
CMD ["catalina.sh", "run"]
