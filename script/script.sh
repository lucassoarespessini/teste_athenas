#!/bin/bash 

filename="pagina.html"
filename2="pagina2.html"
filename3="pagina3.html"
outputfile="output.json"


# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH
cd "$SCRIPTPATH"

rm -f "$SCRIPTPATH/$outputfile"
# Now grab the page or pages we care about.
wget --output-document=$filename \
     https://developer.athenas.online/table.html

sed -n '/<table border="1px"/,/<\/table/p' $filename > $filename2

rm $filename

regexEachCollum="((?<=<td>)(.*?)(?=</codigo>))"

grep -oP "$regexEachCollum" "$SCRIPTPATH/$filename2" > "$SCRIPTPATH/$filename3" 
i=0
echo "{" >> "$SCRIPTPATH/$outputfile"
echo "	\"table\": [" >> "$SCRIPTPATH/$outputfile"
while IFS= read -r line
do 
	if [ "$(( $i % 4 ))" -eq 0 ]; then
    	echo "		{" >> "$SCRIPTPATH/$outputfile"
    	echo "			\"Codigo\": \"$line\"," >> "$SCRIPTPATH/$outputfile"
	elif [ "$(( $i % 4 ))" -eq 1 ]; then
    	echo "			\"Nome\": \"$line\"," >> "$SCRIPTPATH/$outputfile"
	elif [ "$(( $i % 4 ))" -eq 2 ]; then
    	echo "			\"E-mail\": \"$line\"," >> "$SCRIPTPATH/$outputfile"
	elif [ "$(( $i % 4 ))" -eq 3 ]; then
    	echo "			\"Categoria\": \"$line\"" >> "$SCRIPTPATH/$outputfile"
    	if [ "$i" -eq 59 ]; then
    		echo "		}" >> "$SCRIPTPATH/$outputfile"
    		echo "	]" >> "$SCRIPTPATH/$outputfile"
    	else
    		echo "		}," >> "$SCRIPTPATH/$outputfile"
    	fi
	fi
	i=$((i+1))
done < "$SCRIPTPATH/$filename3" 
echo "}" >> "$SCRIPTPATH/$outputfile"
echo "$(cat /script/output.json)"

rm "$SCRIPTPATH/$filename2"
rm "$SCRIPTPATH/$filename3"
