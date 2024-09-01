# 1+x^1+x^2+..._x^n
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


series()
{
    sum=1
    x=$1
    num=$2
    for(( i=1;i<=num;i++ ))
    do
        add=$(power $x $i)
        sum=$(( sum + add ))
    done
    echo $sum
}


echo "enter x"
read x
echo "enter n"
read n

res=$(series $x $n)
echo "The sum of the series is $res"