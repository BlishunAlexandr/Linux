if [ ! -d "$folder" ] 
	then
    		echo "Folder not found"
    		exit 1
fi

for file in "$folder"/* 
	do
   		if [ -f "$file" ]; 
		then
        		owner=$(stat -c '%U' "$file")
        
        		if [ ! -d "$folder/$owner" ]; 
			then
            		mkdir "$folder/$owner"
       		fi
        
      		cp "$file" "$folder/$owner/"
        
       		chown "$owner" "$folder/$owner/$(basename "$file")"
    		fi
done