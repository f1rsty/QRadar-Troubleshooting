#!/bin/bash

DELAY=3

while true; do
 clear
 cat << __EOF__
Please Select an Option:
1. System Update
2. Disable iptables
3. Enable iptables
4. Set Admin Password
5. Restart Web Services
6. System Reboot
0. Quit
__EOF__

read -p "Enter A Selection [0-6] > "

if [[ $REPLY =~ ^[0-6]$ ]]; then
 case $REPLY in
  1)
   yum -y update && yum -y upgrade
   sleep $DELAY
   continue
   ;;
  2)
   systemctl stop iptables
   sleep $DELAY
   ;;
  3)
   systemctl start iptables
   sleep $DELAY
   ;;
  4)
   /opt/qradar/support/changePasswd.sh -a
   sleep $DELAY
   continue
   ;;
  5)
   systemctl stop hostcontext
   systemctl stop httpd
   systemctl stop tomcat
   sleep $DELAY
   systemctl start tomcat
   systemctl start httpd
   systemctl start hostcontext
   sleep $DELAY
   ;;
 6)
  systemctl reboot
  sleep $DELAY
  ;;
 0)
  break
  ;;
 esac
else
 echo "Invalid Entry. Please select a number from 0 - 6"
 sleep $DELAY
 fi
done
echo "Program Ended."
