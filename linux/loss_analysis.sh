#!/bin/bash
# Hi! It's Tim so this script....
# finds all files in current dir with 4 digit date
# grabs all losses in those files and then
# combines into a single file which you get to name

echo "Ok, lets find and combine files"
echo "Please ensure files have a 4 digit date at the start e.g (0312)(monthday)"
echo
read -p "Please enter a month (format 00): " user_month
read -p "Please enter a name for the combined file: " file_name

grep -n '-' $user_month* | awk '{print $NFR}' | sed s/_win_loss_player_data:/' '/ > $file_name
