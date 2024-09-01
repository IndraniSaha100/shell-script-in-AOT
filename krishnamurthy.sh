
factorial_function()
{
    factorial=1
    num=$1
    if [ $num -lt 0 ]
    then
        #echo "factorial of real negative number is complex number"
        echo "-1"
    else
        for (( i=1;i<=num;i++ ))
        do
            factorial=$((factorial*i));
        done
        #echo "The factorial of $num is $factorial" 
        echo "$factorial"
    fi
}


echo "Enter number"
read num

sum=0
temp=$num
while [ $num -gt 0 ]
do
    rem=$(( num % 10 ))
    fact=$( factorial_function $rem ) 
    sum=$(( sum + fact ))
    num=$(( num / 10 ))
done

if [ $sum -eq $temp ]
then
    echo "The number is krishnamurthy"
else
    echo "The number is not kriishnamurthy"
fi

#to calculate a equation use $(())  but when function calls $()
# we can use [[]] in if or [] , but remember >,<,== are used for comparing strings, and -gt,-lt are used for numeric comparison