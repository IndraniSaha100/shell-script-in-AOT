# x="lcm.sh"
# y="lcm2.sh"

# echo "$x $y" > write.txt


# if [ ! -f $x ];then
#     > lcm.sh
# fi
# if [ ! -f $y ];then
#     > lcm2.sh
# fi



# #  when you go to copy a file'scontent to an another file, we see that -> echo $(lcm 3 4) like this sentences which throw the output can not copied 



# while IFS= read -r line
# do
#     echo "$line" >> "lcm2.sh"
# done < "lcm.sh"


# result1=$(sh ./$x 45 34)
# result2=$(sh ./$y 45 34)
# # echo "$result1 $result2"

# if [ $result1 -eq $result2 ];then
#     echo "The value of lcm is $result1"
# else
#     echo "Different output"
# fi


# x=`head -n 1 write.txt | cut -d " " -f1`
# y=`head -n 1 write.txt | cut -d " " -f2`
# echo "$x $y"

txt1="write.txt"
txt2="read.txt"

line=`wc -w < $txt1`
line2=`wc -l < $txt2`

# echo "$line $line2?????????????"

for ((i=1;i<=line;i++))
do
    prog=`head -n 1 $txt1 | tail -n 1 | cut -d " " -f$i`
    for ((j=1;j<=line2;j++))
    do
        num1=`head -n $j $txt2 | tail -n 1 | cut -d " " -f1`
        num2=`head -n $j $txt2 |  tail -n 1 | cut -d " " -f2`

        if [ "$num1" != "M" ] && [ "$num2" != "M" ];then

            output=$( sh ./$prog "$num1" "$num2" )
            result=`head -n $j $txt2 | tail -n 1 | cut -d " " -f3`
    
        else
            echo "Inputs Missing in $prog in $j line"
            continue
        fi

        if [ "$output" != "$result" ]; then
            echo "Mismatch found in $prog in $j line"
            exit 1
        fi
    done
done

echo "All outputs are corect and function is also correct"