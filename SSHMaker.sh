#!/bin/bash  



read -p "Do you want to generate an SSH Key?: " SSHANSWER  

case $SSHANSWER in    

  Yes| yes)
read -p "What would you like to name the file to store the key?" FILENAME
echo "$FILENAME Selected" 
echo "What algo would you like to use?" 
read -p "(rsa,dsa, and ecdsa available)" ALGO
echo "$ALGO Selected"
read -p "How many bits would you like to use"? BITS
echo "$BITS Selected"
ssh-keygen -f ~/$FILENAME -t $ALGO -b $BITS 
    ;;

  No | no)
exit 
    ;;
esac 




