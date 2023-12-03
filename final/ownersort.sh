if [ ! -d "$1" ]; 
then
  	echo "Directory not found"
  	exit 1
fi

cd "$1"

for file in *; 
do
	owner=$(stat -c "%U" "$file")
	mkdir -p "$owner"	
	cp "$file" "$owner/"
done