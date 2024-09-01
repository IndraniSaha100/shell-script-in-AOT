: 'use this for multi line comment 
#check if a number is within a range
echo "Enter a number"
read num
echo "give the range"
read r1 r2
if [ $num -gt $r2 ] || [ $num -lt $r1 ]
then 
echo "The number is not within range "
else
echo "The number is within range"
fi

echo "Enter your marks in final"
read marks
echo "Enter total subject number"
read sub

res=$(((marks / sub)))

grade=$(($res/10))

case $grade in
9)
    echo "You got 90% marks with grade 'O'"
    ;;
8)
    echo "You got 80% marks with grade 'A'"
    ;;
7)
    echo "You got 70% marks with grade 'B'"
    ;;
6)
    echo "You got 60% marks with grade 'C'"
    ;;
5)
    echo "You got 50% marks with grade 'D'"
    ;;
4)
    echo "You got 40% marks with grade 'E'"
    ;;
3)
    echo "You got 30% marks with grade 'F'"
    ;;
*)
    echo "You got below 30% "
    ;;
esac


echo "which day you prefer"
read day

case $day in
Sunday)
    echo "Oh today is sunday means holiday"
    ;;
Monday)
    echo "Today is Monday also holiday for AOTian"
    ;;
Tuesday)
    echo "Starting day of AOT College!! Tuesday"
    ;;
Wednesday)
    echo "2nd day in college !! Wednesday"
    ;;
Thursday)
    echo "Middle day of college!! Thursday"
    ;;
Friday)
    echo "2nd last day of college in this week!!Friday"
    ;;
Saturday)
    echo "Last day in college in this week !!Saturday"
    ;;
*)
    echo "Neither day matched"
    ;;
esac


echo "First number"
read first
echo "Second number"
read second

echo "what operation do you want"
read symbol

case $symbol in
'+')
    echo "The sum of $first and $second is $((first + second))"
    ;;
-)
    echo "The subtraction of $first and $second is $((first - second))"
    ;;
'*')
    echo "The multiplication of $first and $second is $((first * second))"
    ;;
/)
    echo "The division of $first and $second is $((first / second))"
    ;;

esac
echo "Enter number"
read num

if [ $num -gt 0 ]
then
    echo "Positive number"
elif [ $num -eq 0 ]
then
    echo "Zero"
else
    echo "Negative number"
fi

echo "Enter number"
read num

factorial=1

if [ $num -lt 0 ]
then
    echo "factorial of real negative number is complex number"
else
    for (( i=1;i<=num;i++ ))
    do
        factorial=$((factorial*i));
    done
    echo "The factorial of $num is $factorial" 
fi

echo "Enter number"
read num
sum=0
temp=$num
while [ $num -gt 0 ]
do
    rem=$(( num % 10 ))
    sum=$(( sum + rem ))
    num=$(( num / 10 ))
done

echo "The $sum is the sum of digit of $temp"

'

power()
{
    base=$1
    exponent=$2

    result=1
    while [ $exponent -gt 0 ]
    do
        result=$((result * base ))
      
        exponent=$(( exponent - 1 ))
    done
    echo $result
}

# echo "enter base"
# read base
# echo "enter exponent"
# read exponent


# res=$(power $base $exponent)
res=$(power $1 $2)
echo "The power is $res " 