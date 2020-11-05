#!/bin/sh

counter=0
while [ $counter -lt 10 ]
do
echo $counter
counter=`expr $counter + 1`
done