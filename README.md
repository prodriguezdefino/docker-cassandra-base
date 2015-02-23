# Docker base image for Apache Cassandra

This image installs an Apache Cassandra v2.1.2 node in an Ubuntu 14.04 container running on Java 8.

Inside the image there is a script to start up the node ```cass-start``` which expects two env variables to modify its behaviour (for example: be aware of any seed node or configure and start the ops-center in that node). 

## Configure a seed nodes

In order to configure a seed node just start  a node with ```cass-start``` without any configuration, this will asume that the current node is a seed of the ring. 

Once there is a seed node already running in the network one can start another node passing the seed's ip in the environment variable ```SEEDS_IPS``` using coma separated values. That will allow the startup script to configure itself (and the Cassandra installation) to consider the seed node in order to start the gossip protocol between each other.

Also it is possible to configure the cluster name using the env variable ```CLUSTER_NAME```.

## Configure Ops-Center in a node

In a similar way, one can configure a node to run the [Datastax Ops-Center](http://www.datastax.com/what-we-offer/products-services/datastax-opscenter) and then after node startup the web console will be accessible at ```http://<containers-ip>:8888```. To acchieve this setting the environment variable ```OPTS_CENTER``` will do the trick.
