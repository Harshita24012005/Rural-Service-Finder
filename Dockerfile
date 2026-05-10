FROM tomcat:9.0

COPY ROOT.war /usr/local/tomcat/webapps/

ENV PORT=8080

EXPOSE 8080

CMD ["catalina.sh", "run"]