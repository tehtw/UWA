#!/bin/bash
read -p "Please enter a month (format 00): " user_month
read -p "Enter Data Source File name only: " user_file
read -p "Please enter a name for the combined file: " file_name
DIR1=$(./Dealer_Analysis)
DIR2=$(../Player_Analysis)

for f in $DIR1/$user_month*
do
  for i in $DIR2/$user_file
  do
 the_date=$(awk 'print{$1}' $i )
    if [ "$the_date" = "$(basename $f*)" ]
        then
        the_time=$(echo $i | awk -F " " 'print{$2}') 
      grep -vf "$the_time" "$f" | awk '{print $date, $1, $2, $5, $6}' > "$file_name"
    fi
  done
done


