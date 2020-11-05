#!/bin/bash
for i in sam joe amy sara admin; do chage -M 90 $i; echo; echo ‘***’ $i ‘***’; echo; chage -l $i; done
exit