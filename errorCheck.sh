#!/bin/bash

today=`date +%Y-%m-%d`

i=1
while read line || [ -n "$line" ] ; do

  errors=`cat /home/ansible/vulnerability/monitoring/MonitoringSource/nginxLOG-"$today" | awk -F " " '{print $9}' | awk -F "" '{print $1}' | egrep -v '1' | egrep -v '2' | egrep -v '3'`
  alls=`cat /home/ansible/vulnerability/monitoring/MonitoringSource/nginxLOG-"$today" `

  if [ "$errors" -gt "4" ] ; then
    defs=`echo $alls`
  fi

  echo $defs

  ((i+=1))
done < /home/ansible/vulnerability/monitoring/MonitoringSource/nginxLOG-$today
# NFS mount checker
# $1=host $2=ping $3=mem $4=cpu $5~=disk(10~)
#  echo ${mydisk[@]}
