
echo "Recent CVE List Script"  
read -p "This script uses the jq package. Do you have jq installed? " ENTRYQUESTION   


if [[ $ENTRYQUESTION == "Yes" || $ENTRYQUESTION == "yes" ]];
then
curl "https://cve.circl.lu/api/last" | jq   -r '.[0].id  + " : " + .[0].summary, .[1].id  + " : " + .[1].summary, .[2].id  + " : " + .[2].summary, .[3].id  + " : " + .[3].summary, .[4].id  + " : " + .[4].summary, .[5].id  + " : " + .[5].summary'  
fi


if [[ $ENTRYQUESTION == "No" || $ENTRYQUESTION == "no" ]];
then 
sudo apt-get install jq
curl "https://cve.circl.lu/api/last" | jq  -e -r '.[0].id  + " : " + .[0].summary, .[1].id  + " : " + .[1].summary, .[2].id  + " : " + .[2].summary, .[3].id  + " : " + .[3].summary, .[4].id  + " : " + .[4].summary, .[5].id  + " : " + .[5].summary' 
fi




