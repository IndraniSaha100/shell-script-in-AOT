
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
            factorial=$((factorial * i));
        done
        #echo "The factorial of $num is $factorial" 
        echo "$factorial"
    fi
}

ncr_calculate()
{
    num=$1
    num2=$2
  
    fact_n=$(factorial_function $num)
    fact_r=$(factorial_function $num2)
    fact_nr=$(factorial_function $((num - num2)))

    cal=$((fact_n / (fact_r * fact_nr) ))
    echo "$cal"
}

num=7
num2=1
res=$(ncr_calculate $num $num2)
echo " result is $res"