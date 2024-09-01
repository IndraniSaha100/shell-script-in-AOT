: '
!/bin/sh
Indrani Saha learning shell script
echo "Enter your name"
read PERSON
echo "Hello $PERSON"
echo "Enter a year"
read YEAR
if [ $((YEAR % 400)) -eq 0 ] ||  [ $((YEAR % 4)) -eq 0 ] && [ $((YEAR % 100)) -ne 0 ] 
then
echo "The year is Leap year"
else
echo "The year is not leap year"
fi

for var in 0 1 2
do 
echo "$var"
done

a=0
while [ $a -le 4 ]
do 
echo $a
a=` expr $a + 1 `
done



a=0
#until loop is opposite of while loop
#if the condition evaluates to false, commands within the loop are executed
until [ ! $a -le 4 ]
do 
echo $a
# a=` expr $a + 1 `
((a++))
done


# nested loop
a=0
while [ $a -le 5 ]
do
    b=$a
    while [ $b -ge 0 ]
    do
        echo -n "$b "
        ((b--))
    done
    echo
    ((a++))
done

for file in *.txt; do
    echo "Processing $file"
done
for file in C:/Users/indra/Downloads/shell_script*
do
    echo "Processing $file"
done


for var in {1..11..2}
do  
echo "Hello $var"
done 
'



