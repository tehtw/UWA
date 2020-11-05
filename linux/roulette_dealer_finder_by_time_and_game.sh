#!/bin/bash

#Where you from? Where you at?.... Your right here.


the_time=$1
AM_PM=$2
the_date=$3
search_game=$4

file_name=($the_date"_Dealer_schedule")

if [ $search_game = Blackjack ]
    then
       grep $the_time $file_name | grep $AM_PM | awk '{print '$the_date', $1, $2, $3, $4}'

elif [ $search_game = Roulette ]
    then
       grep $the_time $file_name | grep $AM_PM | awk '{print '$the_date', $1, $2, $5, $6}'

elif [ $search_game = Texas ]
    then
       grep $the_time $file_name | grep $AM_PM | awk '{print '$the_date', $1, $2, $7, $8}'

else
echo You didnt enter a game    
fi



