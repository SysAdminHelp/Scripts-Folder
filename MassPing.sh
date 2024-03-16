#!/bin/bash  
	newline=`echo $'\n.'`
        newline=${newline%.}
	# User UI/Input Appending
	echo "DC Mass Ping Connection Test" 	
	
	read -p "Would you like to add new IP Addresses?" QUESTION1 
	
	case $QUESTION1 in
	  
	 Yes| yes)	
	while :
	do 
	read -p "Enter New IP Address:"  IPADDRESSES
	echo $IPADDRESSES >> IPADD.txt
	#Exit Prompt
	read -p "If you are finished, type Done or done, if not press enter: `echo $'\n> '`"  	 complete
	
	if [[ $complete == "Done" || $complete == "done" ]]; then
        echo "Please re-run the program and select no to begin ping testing"
        exit
        fi
	done 
	;;    
          
          No | no)
        #responsible for iterating through IPs  
          while IFS= read -r ip 
	do
  	ping -w 3 "$ip"
	done < IPADD.txt 
            ;;
          esac 

 
 
 
 



         
	
