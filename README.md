# Barricade Vagrant Storm Mini-Cluster Example

This is a simple vagrant setup to have the following cluster running:

- Zookeeper
- Kafka
- Storm Nimbus (0.10.0)
- Two Storm Supervisor (0.10.0)

This has been trimmed down and should be trivial to run. 

Make sure you've installed storm locally (if on OSX `brew install storm`) and once you have this
cluster running and up, you can use the local storm client to deploy your topologies using the `storm` command.

## Getting Started

Make sure all of these are installed:

1. Make sure you have installed [Vagrant](https://www.vagrantup.com/)
2. Install the **hostmanager** vagrant plugin: `$> vagrant plugin install vagrant-hostmanager`
2. Make sure you've installed [Storm](http://brewformulas.org/Storm) locally
3. type `$> vagrant up` in your terminal in the folder where you cloned this repository
4. Use the `$> storm` command to deploy your own topology to your newly running cluster.

### Example of Deploy

Please note how we are passing the `-c nimbus.host=nimbus` which points your topology to be deployed on your newly provisioned vagrant nimbus server (which can be accessed at http://192.168.50.4:


```
$> storm jar target/yourtopology.0.1.0.jar com.acme.TestTopology -c nimbus.host=nimbus
```

From there you should either get a message of success or failure. Follow the breadcrumbs.
