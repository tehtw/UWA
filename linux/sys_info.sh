#!/bin/bash
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
machID=$(cat '/etc/machine-id')
echo '***' 'MY FIRST BASH SCRIPT' '***'
echo
date
echo
echo -e "Uname info: $(uname -a)"
echo -e "IP Info: $(ip addr | grep inet | tail -2) "
echo -e "Machine ID:" $machID 
echo "Hostname" $(hostname -s)
less /etc/resolv.conf | tail -1
echo -e 'Memory:' $MEMORY '|' 'Disk:' $DISK '|' 'CPU:' $CPU
 

