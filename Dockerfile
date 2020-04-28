# Pull base image 
FROM tomcat:8.0-alpine 

# Maintainer 
MAINTAINER "suhasdevops@gmail.com" 
COPY webapp/target/*.war /usr/local/tomcat/webapps
