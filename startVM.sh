#!/bin/bash
# A script to start the Junction VM
# Make sure VM running this script has instance principal authorization in OCI (see: https://docs.cloud.oracle.com/en-us/iaas/Content/Identity/Tasks/callingservicesfrominstances.htm#Calling_Services_from_an_Instance)
# To run this script on a scheduled basis, use linux crontab. For example, you can run this script at 4:00 GMT or 12:00 EDT as follows: 
# make log directory:   mkdir -p /tmp/logs/starvm/
# open crontab:         crontab -e
# add the command:      0 4 * * * /home/opc/startVM.sh &>> /tmp/logs/startvm/`date +\%m\%d\%y_\%H\%M`

# provide ocid of instance to be stopped
instance_ocid=ocid1.instance.oc1.uk-london-1.anwgiljsmr634jqc32m7ufnjt7tbfgn2qjqnnseiscklcqo66w2fcbpwwhrq
# provide full path of log directory
start_logdir=/tmp/logs/startvm/

# check if stop vm log directory exists and create new directory if it does not exist
if [ ! -d "${start_logdir}" ]
then
  echo "Directory does not exist. Creating now"
  mkdir -p "${start_logdir}"
fi

# start instance using oci-cli with instance principal authorization
/usr/local/bin/oci compute instance action --action START --instance-id "${instance_ocid}" --auth instance_principal 

# Check to see if the oci start instance command succeeded
if [[ "${?}" -ne 0 ]]
then
  echo 'The command to start the instance was unsuccessful'
  exit 1
fi
