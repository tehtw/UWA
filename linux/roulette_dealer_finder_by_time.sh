#!/bin/bash

#Where you from? Where you at?.... Your right here.


the_time=$1
AM_PM=$2
the_date=$3

file_name=($the_date"_Dealer_schedule")

       grep $the_time $file_name | grep $AM_PM | awk '{print '$the_date', $1, $2}'




