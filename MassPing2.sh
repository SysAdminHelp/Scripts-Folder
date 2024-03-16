#!/bin/bash  
	echo "Data Center Mass Ping Connection Test Tool" 	
	
	read -p "OPTIONS:  Add = add new IPs. Run = run ping test with current IPs.`echo $'\n> '` " ENTRYQUESTION 
		
	#Loop that enables a user to add a new IP, line by line 
	while [[ $ENTRYQUESTION == "Add" || $ENTRYQUESTION == "add"  ]]; do
        	
        		read -p "Enter New IP Address:`echo $'\n> '`"  IPADDRESSES
			echo $IPADDRESSES >> IPADD.txt
        		#Exit Prompt
			read -p "If you are finished, type Done or done, if not press enter:`echo $'\n> '`" complete
	
	#Loop that exits out of the add option		
	while [[ $complete == "Done" || $complete == "done" ]]; do
        		echo "Please re-run the program and type Run to begin ping testing `echo $'\n> '`"
        		exit
        		done
        		
        		done
        		
	#Loop that runs the ping test, line by line from IPADD.txt document
	while [[ $ENTRYQUESTION == "Run" || $ENTRYQUESTION == "run" ]]; do 
	        while IFS= read -r ip 
		do
  		packetloss=$(ping -w 3 "$ip" | sed -i -n "packet loss" * > IPADDLOG.txt )
  		echo ""$ip" = "$packetloss""  
		done < IPADD.txt   
		break
        	done
        

	
