FROM tomcat:latest
RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
RUN pwd && ls -lrt ./
COPY /home/ubuntu/workspace/deepak-register-app-CI/webapp/target/*.war /usr/local/tomcat/webapps

