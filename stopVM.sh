#!/bin/bash
# A script to stop the Junction VM
# Make sure VM running this script has instance principal authorization in OCI (see: https://docs.cloud.oracle.com/en-us/iaas/Content/Identity/Tasks/callingservicesfrominstances.htm#Calling_Services_from_an_Instance)
# To run this script on a scheduled basis you can use linux crontab. For example, you can run this script at 10:00 GMT or 6:00 AM EDT as follows:
#make log directory:   mkdir -p /tmp/logs/stopvm/
# open crontab:         crontab -e
# add the command:      0 10 * * * /home/opc/stopVM.sh &>> /tmp/logs/stopvm/`date +\%m\%d\%y_\%H\%M`
#
# you will need to upload the private key to the ~/.ssh directory

# provide ocid of instance to be stopped
instance_ocid=ocid1.instance.oc1.uk-london-1.anwgiljsmr634jqc32m7ufnjt7tbfgn2qjqnnseiscklcqo66w2fcbpwwhrq
# provide full path of log directory
stop_logdir=/tmp/logs/stopvm/
# sever ip addess
server=Wdemo

# check if stop vm log directory exists and create new directory if it does not exist
if [ ! -d "${stop_logdir}" ]
then 
  echo "Directory does not exist. Creating now"
  mkdir -p "${stop_logdir}"
fi

isDone=false
while ! ${isDone} 
do
if ssh opc@${server} "sudo  ls /home/tomcat/rj/1000/data |grep etl5" 1> /dev/null 2>&1;then
   echo "file Exists"
   sleep 10
else
   isDone=true
   # stop instance using oci-cli with instance principal authorization
   /usr/local/bin/oci compute instance action --action STOP --instance-id "${instance_ocid}" --auth instance_principal 

# Check to see if the oci stop instance command succeeded
if [[ "${?}" -ne 0 ]]
then
  echo 'The command to stop the instance was unsuccessful'
  exit 1
fi
fi

done