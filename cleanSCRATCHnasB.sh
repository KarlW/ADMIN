#!/bin/bash
# Integer Constants - May be useful some day
one="1"
two="2"
three="3"
four="4"
five="5"
six="6"
seven="7"
eight="8"
nine="9"
ten="10"
eleven="11"
twelve="12"

# Translation Alpha to month number, SINGLE digit w/o leading 0
declare -A months=( ["Jan"]="1" ["Feb"]="2" \
 ["Mar"]="3" ["Apr"]="4" \
 ["May"]="5" ["Jun"]="6" \
 ["Jul"]="7" ["Aug"]="8" \
 ["Sep"]="9" ["Oct"]="10" \
 ["Nov"]="11" ["Dec"]="12" )

# For conversion SINGLE digit w/o leading 0 month number to Alpha
declare -A digits=( 
 ["1"]="Jan" ["2"]="Feb" \
 ["3"]="Mar" ["4"]="Apr" \
 ["5"]="May" ["6"]="Jun" \
 ["7"]="Jul" ["8"]="Aug" \
 ["9"]="Sep" ["10"]="Oct" \
 ["11"]="Nov" ["12"]="Dec" )

## if [ $# != 1 ]
## then
##   echo "usage: " # May want an input argument
##   exit 1
## fi

echo " "

# abbrevmonthname convert to MonthNumber
abbrevmonthname=`date +%b`
MonthNumber=${months["$abbrevmonthname"]}

monthnum=$MonthNumber
MonthName=${digits["${monthnum}"]}
echo "Current MonthName = "$MonthName

# Last month, retain; previous month to this - delete
let LastMonthNumber=$MonthNumber-1
let DeleteMonthNumber=$MonthNumber-2

if [ "$DeleteMonthNumber" -le "0" ]
then
###   echo "LE zero"
   let "DeleteMonthNumber += 12"
###   echo "Actual DeleteMonthNumber = "$DeleteMonthNumber
fi

MonthToDelete=${digits["${DeleteMonthNumber}"]}
echo "MonthToDelete = "$MonthToDelete
echo " "

cd /SCRATCHnasB
touch .
touch ..
ToGo=`ls -lart | grep " $MonthToDelete " | awk '{print $9}'`
echo "Deleting "$ToGo

# Time to clean
# for Old in $ToGo
# do
#   rm -R /SCRATCHnasB/$Old
# done
