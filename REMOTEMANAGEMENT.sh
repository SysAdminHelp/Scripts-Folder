echo "Data Center Remote Management System" 
read -p "Press Enter To Begin :" ENTRYQUESTION
while [[ $ENTRYQUESTION == "" || $ENTRYQUESTION == ""  ]]; do
read -p "Enter IP": ip
echo "OPERATIONS: restart, gpucheck, storagecheck, pingtest, EthernetConfig"
read -p "Operation": op

case $op in 

restart) 
cwssh $ip "sudo safe-reboot-local; exit"
;;

gpucheck)
cwssh $ip "/home/acc/share/GPU_CLIENT_CHECK; exit"
;;

storagecheck)
cwssh $ip "lsblk; exit"
;;

pingtest)
ping -w 3 $ip  
;;

EthernetConfig)
cwssh $ip "ifconfig; exit"


esac 

done
 #10.111.3.5
 #10.111.3.4
 #10.111.1.22  
