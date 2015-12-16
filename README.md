# Barricade Vagrant Storm Mini-Cluster Example

This is a simple vagrant setup to have the following cluster running:

- Zookeeper
- Kafka
- Storm Nimbus (0.10.0)
- Two Storm Supervisor (0.10.0)

This has been trimmed down and should be trivial to run. 

Make sure you've installed storm locally (if on OSX `brew install storm`) and once you have this
cluster running and up, you can use the local storm client to deploy your topologies using the `storm` command.
