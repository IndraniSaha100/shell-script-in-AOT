gcd()
{
    num1=$1
    num2=$2
    if [ $num1 -eq 0 ]
    then
        echo "0"
    elif [ $num2 -eq 0 ]
    then
        echo "M"
    else
        while [ $num2 -ne 0 ]
        do
            temp=$num2
            rem=$(( $num1 % $num2 ))
            num2=$rem
            num1=$temp
        done
        echo $num1
    fi
}

x=`gcd $1 $2 `
# echo "Result of $1 and $2 is $x"
echo "$x"