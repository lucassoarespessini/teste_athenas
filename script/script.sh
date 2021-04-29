#!/bin/bash 

#Definindo alguns arquivos
filename="pagina.html"
filename2="pagina2.html"
filename3="pagina3.html"
outputfile="output.json"


# Absoluto Endereço
SCRIPT=$(readlink -f "$0")
# Absoluto Arquivo
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH
cd "$SCRIPTPATH"

# Deletando o output.json
rm -f "$SCRIPTPATH/$outputfile"

# Baixando a página HTML
wget --output-document=$filename \
     https://developer.athenas.online/table.html

# Pegando somente a tabela e salvando em pagina2.html
sed -n '/<table border="1px"/,/<\/table/p' $filename > $filename2

# Deletando pagina.html
rm $filename

# Executando o Regex para pegar as colunas
regexEachCollum="((?<=<td>)(.*?)(?=</codigo>))"
grep -oP "$regexEachCollum" "$SCRIPTPATH/$filename2" > "$SCRIPTPATH/$filename3" 

i=0

# Gerando o arquivo Json
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


rm "$SCRIPTPATH/$filename2"
rm "$SCRIPTPATH/$filename3"
