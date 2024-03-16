#!/bin/bash

#Program Name

echo "Data Center Remote Management and Diagnosis Tool System" 
#Loop for program to start 

while true 
do
read -p "Enter IP": ip

#Operations use cases nested inside of loop as case switch
echo "OPERATIONS: restart, gpucheck, storagecheck, pingtest, ethernetconfig, mine, arp (adds new arp entry), ipmac (matches IP to MAC), trace (traceroute)"
read -p "Operation": op
case $op in 

restart) 
cwssh $ip "sudo safe-reboot; exit; exit"
;;

gpucheck)
cwssh $ip "/home/acc/share/GPU_CLIENT_CHECK; exit; exit"
;;

storagecheck)
cwssh $ip "lsblk; exit; exit"
;;

pingtest)
ping -w 3 $ip  
;;

ethernetconfig)
cwssh $ip "ifconfig; exit; exit"
;;

mine)
cwssh $ip "sudo journalctl -fa -u miner -o cat; exit; exit"
;;

ipmac)
cwssh $ip "echo -n '$ip = ' ; ifconfig eth0 | grep -o -E ..:..:..:..:..:.. ;  exit; exit" >> ~/Desktop/IPMACMatch.txt
cat IPMACMatch.txt #Displays IP to MAC list in Terminal 
;;

arp)
cwssh $ip "ifconfig eth0 | grep -o -E ..:..:..:..:..:.. ; exit; exit" >> ~/Desktop/MACStorage.txt
echo "MAC Address Stored to MACStorage file"
arp -s $ip $(< MACStorage.txt) 
echo $ip $(< MACStorage.txt) # Check to make sure IP and MAC are being passed into ARP command 
truncate -s 0 MACStorage.txt
;;
trace)
traceroute $ip 
;;
esac 

done
 
 
 
 #sudo netstat -lntup | grep ":80"
