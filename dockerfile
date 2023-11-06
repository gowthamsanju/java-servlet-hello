FROM tomcat:latest
ADD ./target/hello.war /var/lib/tomcat/webapps/ 
EXPOSE 8080
CMD ["catalina.sh", "run"]
