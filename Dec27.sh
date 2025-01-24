#!bin/bash

read -p "Enter no of element you want to insert in array " num

echo "Enter elements in array"
for((i=0;i<num;i++))
do
    read a[$i]
done

#find the greatest element from the array
greatest=${a[0]}

for((i=1;i<=$((num-1));i++))
do
    if [ ${a[$i]} > $greatest ] ;then
        greatest=${a[$i]}
    fi
done

echo "The greatest element in the array : $greatest"