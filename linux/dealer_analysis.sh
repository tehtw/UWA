#!/bin/bash

#Ok so now lets look at the dealers!

read -p "Please enter a name for the analysis file: " save_file

while read line;
    do
        the_date=$(echo $line | awk '{print $1}')
        the_time=$(echo $line | awk '{print $2}')
        AM_PM=$(echo $line | awk '{print $3}')
        file_name=($the_date"_Dealer_schedule")

            grep $the_time $file_name | grep $AM_PM | awk '{print '$the_date', $1, $2, $5, $6}' >> $save_file
            
done < ../Player_Analysis/Roulette_Losses


