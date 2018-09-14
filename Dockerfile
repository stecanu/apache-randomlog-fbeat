FROM python:2.7
COPY requirements.txt ./
COPY apache-fake-log-gen.py ./
COPY start.sh ./
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY logstash-beats.crt /etc/pki/tls/certs/logstash-beats.crt
RUN chmod +x start.sh 
RUN pip install --no-cache-dir -r requirements.txt
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch |  apt-key add -
RUN apt-get update
RUN apt-get install apt-transport-https
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" |  tee -a /etc/apt/sources.list.d/elastic-6.x.list
RUN apt-get update &&  apt-get install filebeat
CMD  ./start.sh ; sleep infinity & wait

