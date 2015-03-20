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

#optional client name
if [ -n "$CLIENTNAME" ]; then
	printf "\n[deployment-client]\nclientName = $CLIENTNAME\n" >> $SPLUNK_HOME/etc/system/local/deploymentclient.conf
fi;
#start splunk
/opt/splunk/bin/splunk start --nodaemon --accept-license --no-prompt --answer-yes

if [[ $? != 0 ]] || test -t 0; then exit $?; fi
