#!/bin/bash

##init##
if [ -z "$SPLUNK_HOME" ]; then SPLUNK_HOME=/opt/splunk; fi
echo Splunk to be installed in $SPLUNK_HOME

##install splunk##
if [  ! -f $SPLUNK_HOME/bin/splunk ]; then
	tar -C $SPLUNK_HOME -xf splunkforwarder.tgz --strip-components=1
fi

##configure splunk##
if [ -z "$DEPLOYMENTSERVER" ]; then
	echo "Fatal! Unable to proceed without DEPLOYMENTSERVER. Specify -e DEPLOYMENTSERVER=yourhost:8089 when running"
	exit
fi;

printf "[target-broker:deploymentServer]\ntargetUri = $DEPLOYMENTSERVER\n" > $SPLUNK_HOME/etc/system/local/deploymentclient.conf

#start splunk
/opt/splunk/bin/splunk start --nodaemon --accept-license --no-prompt --answer-yes