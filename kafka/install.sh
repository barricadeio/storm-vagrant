apt-get update
apt-get install -y unzip supervisor openjdk-7-jdk

/etc/init.d/supervisor stop

groupadd kafka
useradd --gid kafka --home-dir /home/kafka --create-home --shell /bin/bash kafka

tar -xzvf /vagrant/kafka/$1.tgz
mv $1 /usr/share

ln -s /usr/share/$1 /usr/share/kafka
chown -R kafka:kafka /usr/share/$1
chown -R kafka:kafka /usr/share/kafka

mkdir /etc/kafka
chown -R kafka:kafka /etc/kafka

cp /vagrant/kafka/server.properties /etc/kafka/server.properties

sed 's/-XX:+UseCompressedOops//' /usr/share/kafka/bin/kafka-run-class.sh > /usr/share/kafka/bin/kafka-run-class.sh.new
mv /usr/share/kafka/bin/kafka-run-class.sh /usr/share/kafka/bin/kafka-run-class.sh.old
cp /usr/share/kafka/bin/kafka-run-class.sh.new /usr/share/kafka/bin/kafka-run-class.sh

mkdir /var/log/kafka
chown -R kafka:kafka /var/log/kafka

ln -s /usr/share/kafka/bin/kafka-server-start.sh /usr/bin/kafka-server-start
sed "s/HOSTNAME/$2/" /etc/kafka/server.properties > /etc/kafka/server.properties.new
mv /etc/kafka/server.properties /etc/kafka/server.properties.old
cp /etc/kafka/server.properties.new /etc/kafka/server.properties

chmod -R 777 /usr/share/$1
chmod -R 777 /usr/share/kafka
