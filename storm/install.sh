apt-get update
apt-get install -y unzip supervisor openjdk-7-jdk 

/etc/init.d/supervisor stop

groupadd storm
useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm

unzip -o /vagrant/storm/$1.zip -d /usr/share/
chown -R storm:storm /usr/share/$1
chmod -R 766 /usr/share/$1
ln -s /usr/share/$1 /usr/share/storm
ln -s /usr/share/storm/bin/storm /usr/bin/storm

cp /vagrant/storm/env.sh /etc/profile.d/10-storm.sh

mkdir /etc/storm
chown storm:storm /etc/storm

rm /usr/share/storm/conf/storm.yaml
cp /vagrant/storm/storm.yaml /usr/share/storm/conf/
cp /vagrant/storm/cluster.xml /usr/share/storm/log4j2/
cp /vagrant/storm/worker.xml /usr/share/storm/log4j2/
ln -s /usr/share/storm/conf/storm.yaml /etc/storm/storm.yaml 

mkdir /var/log/storm
chown storm:storm /var/log/storm

#sed -i 's/${storm.home}\/logs/\/var\/log\/storm/g' /usr/share/storm/logback/cluster.xml
