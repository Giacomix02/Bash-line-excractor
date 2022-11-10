#!/bin/bash

read -p 'Enter the name of the text file to be analyzed including the extension >> ' nameFile
read -p 'Enter the number of the line to be extracted >> ' inRow 
rowNum=${#inRow}
touch temp.txt
( (nl -s '. ' -w 1 -n ln $nameFile) )>temp.txt
row=$( (egrep $inRow.*$ temp.txt) )
echo -e "I found this line:\n$row"
char_tot=${#row}
final_number=$(($char_tot-$rowNum))
final_number=$(($final_number-1))
echo -e "\nThe number of characters is: $final_number"
rm temp.txt

