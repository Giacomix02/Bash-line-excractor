#!/bin/bash

read -p 'Enter the name of the text file to be analyzed including the extension >> ' nameFile
read -p 'Enter the number of the line to be extracted >> ' inRow
touch temp.txt
( (nl -s '. ' -w 1 -n ln $nameFile) ) > temp.txt
( (egrep $inRow.*$ temp.txt) ) > temp1.txt
row=$( (sed s/"$inRow. "//g temp1.txt) )
echo -e "\n\tI found this line:\n\t>> $row"
char_tot=${#row}
echo -e "\n\tThe number of characters is: $char_tot"
rm temp.txt
rm temp1.txt
