echo [program:kafka-$1] | sudo tee -a /etc/supervisor/conf.d/kafka-$1.conf
echo command=/usr/share/kafka/bin/kafka-server-start.sh -daemon /etc/kafka/server.properties | sudo tee -a /etc/supervisor/conf.d/kafka-$1.conf
echo directory=/home/kafka | sudo tee -a /etc/supervisor/conf.d/kafka-$1.conf
echo autorestart=true | sudo tee -a /etc/supervisor/conf.d/kafka-$1.conf
echo user=kafka | sudo tee -a /etc/supervisor/conf.d/kafka-$1.conf
