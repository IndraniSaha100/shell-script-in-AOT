: '
l=`wc -l < gcd.txt`

# echo "$l"
flag=0
for (( i=1;i<=l;i++ ))
do
    x=` head -n $i gcd.txt | tail -n 1 | cut -d ' ' -f 1`
    y=` head -n $i gcd.txt | tail -n 1 | cut -d ' ' -f 2`
    z=` head -n $i gcd.txt | tail -n 1 | cut -d ' ' -f 3`
    # echo "$x $y $z"
    out=`sh gcd.sh $x $y`
    # echo "$out $z"
    if [ $out != $z ]
    then
        echo "Not Ok"
        flag=1
        exit 1
    fi
done

if [ $flag -eq 0 ]
then
    echo "Ok"
fi 
'






flag=0
outer=`wc -l < multifile.txt`
inner=`wc -l < gcd.txt`

for (( i=1;i<=outer;i++ ))
do
    p=`head -n $i multifile.txt | tail -n 1`

    for (( j=1;j<=inner;j++ ))
    do
        x=` head -n $j gcd.txt | tail -n 1 | cut -d " " -f 1`
        y=` head -n $j gcd.txt | tail -n 1 | cut -d " " -f 2`
        z1=` head -n $j gcd.txt | tail -n 1 | cut -d " " -f 3`
        z2=` head -n $j gcd.txt | tail -n 1 | cut -d " " -f 4`

        out=$(sh "$p" "$x" "$y")
        # echo "$x $y $z $out"/
        if [ $z1 != $out ] && [ $z2 != $out ]
        then 
            echo "Not ok"
            flag=1
            exit 1
        fi
    done
done

if [ $flag -eq 0 ]
then
    echo "ok"
fi