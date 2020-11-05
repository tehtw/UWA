#!/bin/bash

# Alex... I am your father. 
# Not really but I am Tim and this is my Homework. 
# Run this script and it will do the rest! Well it should...
# ...if it doesnt then you broke it and its your fault. 


mkdir -p Lucky_Duck_Invesigations/Roulette_Loss_Investigation/Player_Analysis/Notes_Player_Analysis/
mkdir -p Lucky_Duck_Invesigations/Roulette_Loss_Investigation/Dealer_Analysis/Notes_Dealer_Analysis/
mkdir -p Lucky_Duck_Invesigations/Roulette_Loss_Investigation/Player_Dealer_Correlaction

cp './setup/3-HW-setup-evidence' './Lucky_Duck_Invesigations'
chmod +x ./Lucky_Duck_Invesigations/3-HW-setup-evidence && Lucky_Duck_Invesigations/3-HW-setup-evidence

cd ./Lucky_Duck_Invesigations/
mv ./Dealer_*/*10_Dealer_* ./Roulette_Loss_*/Dealer_Analysis
mv ./Dealer_*/*12_Dealer_* ./Roulette_Loss_*/Dealer_Analysis
mv ./Dealer_*/*15_Dealer_* ./Roulette_Loss_*/Dealer_Analysis
mv ./Roulette_Player_*/*10_win* ./Roulette_Loss_*/Player_Analysis
mv ./Roulette_Player_*/*12_win_* ./Roulette_Loss_*/Player_Analysis
mv ./Roulette_Player_*/*15_win_* ./Roulette_Loss_*/Player_Analysis
cd ./Roulette_Loss_Investigation/Player_Analysis
echo "************************************"
echo "******ROULETTE - CHEAT CHECKER******"
echo "******STEP 1 -GAMBLER ANALYSIS******"
echo
echo "************************************"
echo "************************************"
echo
echo
read -p "What month would you like to search for losses?  " user_month
read -p "Who is the suspect gambler? (Mylie) " gsus_name
grep -n '-' $user_month* | awk '{print $NFR}' | sed s/_win_loss_player_data:/' '/ > Roulette_Losses
grep '-' Roulette_Losses | awk '{print $1, $2, $3}' >> ./Notes_Player_Analysis/loss_times
grep -o -n $gsus_name Roulette_Losses >> ./Notes_Player_Analysis/name_count
cd ../../..
echo "************************************"
echo "******ROULETTE - CHEAT CHECKER******"
echo "******STEP 2 -DEALER ANALYSIS******"
echo
echo "************************************"
echo "************************************"


###
## "Unforutnately my attempt to be fancy ends here..."
# When trying to combine it just didnt want to work and I couldnt figure it out"
# maybe you can .... 

##while read line;
 ##   do
   ##     d_date=$(echo $line | awk '{print $1}')
     ##   d_time=$(echo $line | awk '{print $2}')
       ## d_AM_PM=$(echo $line | awk '{print $3}')
        ##d_fname=($ddate"_Dealer_schedule")

          ##  grep -f " " $d_time $d_fname | grep $d_AM_PM | awk '{print '$d_date', $1, $2, $5, $6}' >> Dealer_Losses
            
##done <../Player_Analysis/Roulette_Losses
cd ./setup/Homework2/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/
chmod +x dealer_analysis
sh dealer_analysis