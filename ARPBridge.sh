cwssh $ip "ifconfig eth0 | grep -o -E ..:..:..:..:..:.. ; exit; exit" >> ~/Desktop/MACStorage.txt
echo "MAC Address Stored to MACStorage file"
arp -s $ip $(< MACStorage.txt) 
echo $ip $(< MACStorage.txt) # Check to make sure IP and MAC are being passed into ARP command 
truncate -s 0 MACStorage.txt