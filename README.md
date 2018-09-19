# apache-randomlog-fbeat



This docker image contains Filebeat and a [Python script][RS] that generate random apache script every 5 seconds in a log file and send it to Logstash (ELK STACK) through Filebeat.
Pull the image:
```
docker pull iostream82/apache-randomlog-fbeats
```

To run container inside the same host of ELK container:
```
 docker run -d --network host  iostream82/apache-randomlog-fbeat
```
To run container outside the  host of ELK container:
```
 docker run -d -e ELK_HOST=someIP  iostream82/apache-randomlog-fbeat
```
for specify a tag for Filebeat use ``` -e NODE_NAME=sometags ``` 

for running ELK standalone container please refer to [elk-docker-apache-log]

   [RS]: <https://github.com/kiritbasu/Fake-Apache-Log-Generator>
   [elk-docker]: <https://elk-docker.readthedocs.io/>
   [elk-docker-apache-log]: <https://github.com/stecanu/elk-docker-apache-log>
  

