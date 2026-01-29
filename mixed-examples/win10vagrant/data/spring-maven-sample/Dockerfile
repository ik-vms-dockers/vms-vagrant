FROM tomcat:10.1.52

RUN apt-get clean && apt-get update -y && apt-get install -y \
procps \
vim

RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY target/WEB-INF/redemptionCodeManagementService.war /usr/local/tomcat/webapps/ROOT.war
COPY start.sh /

RUN mkdir /var/log/codeservice

EXPOSE 8080
CMD ["/start.sh"]
