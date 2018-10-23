#!/bin/bash
# Written by Jason M. Sholler
# Version 0.1a

DELAY=3

if (( $(ps -ef | grep -v grep | grep sshd | wc -l) > 0))
then
echo "sshd is running"
systemctl stop iptables
sleep $DELAY
else
systemctl start sshd
sleep $DELAY
systemctl stop iptables
sleep $DELAY
fi