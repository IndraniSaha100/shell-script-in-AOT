clear

echo "Enter your date of birth(DD/MM/YY)"
read dob

birth_day=$(  echo "$dob" | cut -d "/" -f1  )  #first, echo "$today": This part prints the value of the variable today to standard output. second part ensure the portion of which we want to take from a variable
birth_month=$(  echo "$dob" | cut -d "/" -f2  )
birth_year=$(  echo "$dob" | cut -d "/" -f3  )

today=$( date +%d/%m/%Y) #take the current date from system

# echo " D.O.B=$birth_day /$birth_month / $birth_year ,Today=$today"

today_day=$(  echo "$today" | cut -d "/" -f1  )
today_month=$(  echo "$today" | cut -d "/" -f2  )
today_year=$(  echo "$today" | cut -d "/" -f3  )

years=$(expr $today_year - $birth_year)

#first check our birthday in this year happened or not, then
# if happened only take the extra month or day more passed after birthday
# else decrement the year by 1, and check how much months are gone after the previous birthday

if [ $today_month -lt $birth_month ];then
    ((years--))
    months=$(expr 12 - $birth_month + $today_month )   #did by this,otherwise get error of (value too great for base (error token is "08"))
else
    months=$(expr $today_month - $birth_month)
fi


#Likewise days are calculate in the month

if [ $today_day -lt $birth_day ];then
    ((months--))
    days=$(expr 30 - $birth_day + $today_day)
else
    days=$(expr $today_day - $birth_day )
fi

echo "Your age is $years years $months months $days days"