# docker-splunkforwarder
This is a splunk light forwarder in an official Ubuntu container.

This container is intended to be used in an environment with a Splunk deployment server. Two configuration options can be passed via environment variables:
* DEPLOYMENTSERVER (mandatory) is the host and port of a Splunk deployment server
* CLIENTNAME (optional) the client name to identify as to the Splunk deployment server
 

These two parameters, passed in as environment variables, are used to generate `$SPLUNK_HOME/etc/system/local/deploymentclient.conf`

A typical execution might be: `docker run -t -i -h $(hostname) -e DEPLOYMENTSERVER=splunk.example.com:8089 -e CLIENTNAME=$(hostname) -v /tmp/splunk:/opt/splunk splunk`

The resulting conf (if the hostname was forwardall) would look like:

    [target-broker:deploymentServer]
    targetUri = splunk.example.com:8089
    [deployment-client]
    clientName = forwardall
