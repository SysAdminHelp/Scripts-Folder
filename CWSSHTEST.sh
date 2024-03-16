#!/bin/bash
read -p "OPTIONS:  Add = add new IPs. Run = run ping test with current IPs. " ENTRYQUESTION 

while [[ $ENTRYQUESTION == "Run" || $ENTRYQUESTION == "run" ]]; do 
	        while IFS= read -r ip 
		do		
		ssh tech_ssh tech@$ip 
		read -p "Checking GPUs.... (Press enter) 'cd /home/acc/share/ && bash ./GPU_CLIENT_CHECK'" 
		#	if [ $GPU_COUNT -ge '7' ] # is greater than or equal to if 
		#	then
	        #echo "NO NEED FOR MAINTENANCE"
		#else
	        #echo $BAD_GPUs "MISSING GPU(s) MAINTENANCE REQUIRED"
		#	fi
		done < IPADD.txt 
		break 
        	done

