## Apache Cassandra Base image
#
FROM prodriguezdefino/ubuntujava
MAINTAINER prodriguezdefino prodriguezdefino@gmail.com

# Install Cassandra
RUN echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/datastax.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
RUN apt-get update && apt-get install -y dsc21 datastax-agent opscenter-free

# Deploy startup script
ADD init.sh /usr/local/bin/cass-start
RUN chmod 755 /usr/local/bin/cass-start

# Deploy shutdown script
ADD shutdown.sh /usr/local/bin/cass-stop
RUN chmod 755 /usr/local/bin/cass-stop

# Save by default config files for later 
RUN cp /etc/cassandra/cassandra.yaml /etc/cassandra/cassandra.yaml.template
RUN cp /etc/cassandra/cassandra-env.sh /etc/cassandra/cassandra-env.sh.template
RUN cp /etc/cassandra/logback.xml /etc/cassandra/logback.xml.template
RUN cp /etc/opscenter/opscenterd.conf /etc/opscenter/opscenterd.conf.template

EXPOSE 7199 7000 7001 9160 9042
