lcm()
{
    x=$1
    y=$2
    if [ $x -eq 0 ] || [ $y -eq 0 ]
    then
        echo "0"
    else  
        out=`sh gcd.sh $x $y`
        cal=$((  x * y  / out )) 
        echo "$cal"
    fi
}

res=`lcm $1 $2`
# echo " lcm of $1 and $2 is $res"
echo "$res"