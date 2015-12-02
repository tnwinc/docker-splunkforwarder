FROM ubuntu
RUN apt-get update

ADD http://download.splunk.com/products/splunk/releases/6.3.1/universalforwarder/linux/splunkforwarder-6.3.1-f3e41e4b37b2-Linux-x86_64.tgz /splunkforwarder.tgz
#COPY splunkforwarder.tgz /splunkforwarder.tgz
ADD bootstrap.sh /bootstrap.sh


ENTRYPOINT ["/bootstrap.sh"]
