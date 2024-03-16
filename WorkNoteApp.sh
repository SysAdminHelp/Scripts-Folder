  
cd WorkNotes 

while : 

do
	echo "-----New Note-----" 
	read -p "Enter note file name: " FILENAME  
	echo "title: $FILENAME" 
	> "$FILENAME"
	read -p "Write your note here: " NOTES  
	echo "$NOTES"  >> "$FILENAME"	
	echo "----Note Added-----" 
done 

