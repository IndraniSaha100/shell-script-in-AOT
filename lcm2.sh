lcm()
{
    x=$1
    y=$2
    if [ $x -eq 0 ] || [ $y -eq 0 ]
    then
        echo 0
    else  
        out=`sh gcd.sh $x $y`
        cal=$((  x * y  / out )) 
        echo $cal
    fi
}

echo `lcm "$1" "$2"`
