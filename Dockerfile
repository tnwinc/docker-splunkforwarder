FROM ubuntu
RUN apt-get update

ADD http://download.splunk.com/products/splunk/releases/6.2.2/universalforwarder/linux/splunkforwarder-6.2.2-255606-Linux-x86_64.tgz /splunkforwarder.tgz
#COPY splunkforwarder.tgz /splunkforwarder.tgz
ADD bootstrap.sh /bootstrap.sh


ENTRYPOINT ["/bootstrap.sh"]
