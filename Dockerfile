FROM openjdk:8 as builder

RUN mkdir -p /home && \
    cd /home 

COPY . /home
WORKDIR /home/oscar
RUN /home/build.sh

FROM tomcat:7-jre8 as ship
#FROM tomcat:7.0.96-jdk8-openjdk-slim as ship

RUN wget http://jenkins.oscar-emr.com:8080/job/drugref2/18/org.drugref\$drugref2/artifact/org.drugref/drugref2/1.0-SNAPSHOT/drugref2-1.0-SNAPSHOT.war -O /usr/local/tomcat/webapps/drugref2.war
COPY --from=builder /home/oscar/target/oscar-14.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/oscar.war

ADD conf /usr/local/tomcat/conf
COPY conf/oscar_mcmaster.properties /root/oscar.properties
COPY conf/drugref2.properties /root/drugref2.properties

ENV JDBC_URL="jdbc:mysql://db:3306/oscar_mcmaster?autoReconnect=true&zeroDateTimeBehavior=round&useOldAliasMetadataBehavior=true&jdbcCompliantTruncation=false"
ENV JDBC_USER="root"
ENV JDBC_PASS="liyi"
ENV db_username="root"
ENV db_password="liyi"
ENV db_uri="jdbc:mysql://db:3306/"
ENV db_name="oscar_mcmaster?autoReconnect=true&zeroDateTimeBehavior=round&useOldAliasMetadataBehavior=true&jdbcCompliantTruncation=false"

EXPOSE 8080

CMD ["catalina.sh", "run"]