: '
Multiple line comment
'
#!bin/bash/
# read number from the user

# echo "Enter the number"
# read number

# read -p "enter" num

#open terminal and run= sh DEc25.sh

#                             Online Bash Shell.
#                 Code, Compile, Run and Debug Bash script online.
# Write your code in this editor and press "Run" button to execute it.

#!/bin/bash
: '
read -p "Enter number : " number

if [ $((number % 2)) -eq 0 ]; then
    echo "Even number $number"
else
    echo "Odd number $number"
fi

read -p "Enter number 2 : " number2
read -p "Enter number 3 : " number3

if [ $number -ge $number2 -a $number -ge $number3 ]; then
    largest=$number
    #echo "$number is largest"
elif [ $number2 -ge $number -a $number2 -ge $number3 ]; then
    largest=$number2    
    #echo "$number2 is largest"
else
    largest=$number3    
    #echo "$number3 is largest"
fi

echo "$largest is largest"


#check if a number is leap or not

if [ $((number % 400 )) -eq 0 -a $((number % 100)) -eq 0 ]; then
    leapYear=1
elif [ $((number % 4)) -eq 0 -a $((number % 100)) -ne 0 ]; then
    leapYear=1
else
    leapYear=0 
fi

if [ $leapYear -eq 1 ]; then
    echo "$number is leap year"
else
    echo "$number is not leap year"
fi


#check if a number is within a range
if [ $number -ge 0 -a $number -le 100 ]; then
    echo "$number is within 0-100"
else
    echo "$number is out of range"
fi

# number is positive or neative or 0
if [ $number -eq 0 ]; then 
    echo "$number is equal to 0"
elif [ $number -gt 0 ];then
    echo "$number is greater than 0"
else
    echo "$number is less than 0"
fi


#calculate the sum of the digit
temp=$number
sum=0
while [ $number -gt 0 ]
do 
    digit=$(( number % 10))
    sum=$((sum+digit))
    number=$((number / 10))
done

echo "The sum of the digit od $temp is $sum"
'


#function of factorial finding
fact()
{
    number=$1
    factorial=1
    for (( i=1;i <= $number;i++ ))
    do
        #echo "Hello"
        factorial=$((factorial * i))
    done
    echo $factorial
}

#f=$(fact 5)
#echo "The factorial of $number is =  $f"


#Find the number is krishnamurthy or not
krishnamurti()
{
    number=$1
    temp=$number
    sum=0
    while [ $number -gt 0 ]
    do 
        digit=$(( number % 10 ))
        f=$(fact $digit)
        sum=$((sum + f))
        number=$((number / 10))
    done
    
    if [ $temp -eq $sum ]; then
        echo "It is krishnamurti number"
    else
        echo "It is not krishnamurti number"
    fi
}

# read -p "Enter number :" number
# krishnamurti $number

# calculating the power
# power=$((2 ** 5))
# echo "$power"


#  Series f(x,n)=1+x 2 /2!+x 4 /4!+....+x 2*n /(2*n)!
series()
{
    x=$1
    y=$2 
    sum=1 
    for((i=1; i<=y; i++))
    do
        mul=$((2 * i))
        f=$(fact $mul)
        power=$((x ** mul))
        div=$((power / f))
        sum=$((sum + div))
    done
    echo $sum
}

# read -p "Enter x: " x
# read -p "Enter y: " y

# answer=$(series $x $y)
# echo "The series answer is $answer" 


# echo "The command line arguments are :$@ or $* 
# (total number of arguments $#) "


date="2 022 02 02 025"
#Must place set the string you'd like to separate,after putting IFS
# IFS=" "
# # set "23 2 2 2 2"
# set $date
# echo "$1 $2 $3 $4 $5"


# d=`date +"%d"`
# m=`date +"%m"`
# y=`date +"%y"` //24
# Y=`date +"%Y"` //2024
# echo "$d $m $Y" 


#string condition checking
# read -p "What's your name :" name
# if [ $name == "Rashmani" ]; then
#     echo "Hello $name"
# else [ $name -eq 1 ]
#     echo "1"
# fi



# Calculate Series Sum
# 1+ x^1 + x^2 + x^3 + ...+ x^n
series()
{
    x=$1
    n=$2
    sum=1 
    for(( i=1;i<=n;i++))
    do
        temp=$(( x ** i))
        sum=$((sum + temp))
    done
    echo $sum
}

# read -p "The value of x: " y
# read -p "The value of n: " n
# result=$(series $x $n)
# echo "The series of number is $result"


#calculating ncr
factorial()
{
    num=$1
    result=1
    for((i=1;i<=num;i++))
    do
        result=$((result * i))
    done
    echo $result
}

# calculate ncr
# read -p "The value of n: " n
# read -p "The value of r: " r

# value1=$(factorial $n)
# value2=$(factorial $r)
# value3=$(factorial $((n-r)))

# value=$(( value1 / $((value2 * value3))))
# echo "The value is :$value "



#----->FILE MANUPULATIOn<--------


file="DOBf.sh"
if [ -f $file ];then
    echo "The file is present"

    # viewing all the contents
    # while  IFS= read -r line
    # do
    #     echo "$line"
    # done < $file

    # counting all the lines,words,characters
    line=$(wc -l < $file)
    word=$(wc -w < $file)
    character=$(wc -m < $file)

    echo "file $file"
    echo "The lines are $line"
    echo "The words are $word"
    echo "The characters are $character"

else
    echo "The file is missing"
fi

: '
Using -r is generally recommended because it ensures that the input is read exactly as it is, without unintended modifications caused by interpreting backslashes. This is particularly useful when working with file paths, escape sequences, or data where backslashes have specific meaning
'

input="multifile.txt"
if [ ! -f "$input" ];then
    echo "The file is not present"
    # interrupted stop
    exit 1
fi

# creating empty file
> "output1.txt"

#copying content of one file from one to another
while IFS= read -r  line
do
    echo $line >> output1.txt
done < $input




function syys(){ #POSIX way of definig function
    echo "Function is called $@"
    echo "hello"
}

# syys 1 2 3 3 3 3 3 33 4 45 6 6

# echo -n "enter : "  #giving the output in one line
# read x


#calculate the fibonacci number
fibonacci()
{
    a=0
    b=1
    for((i=0;i<$1;i++));do
        echo -n "$a " 
        temp=$((a+b))
        a=$b
        b=$temp 
    done
}

# fibonacci $1





# Finding sqrt
number=$1
# sqrt=$( echo "scale=5; sqrt($number)"| bc -l )
# echo $sqrt


: '
 bc (basic calculator) utility, which allows you to perform mathematical calculations.

echo "scale=5; sqrt($number)":

echo prints the string that follows it. Here, the string is "scale=5; sqrt($number)", which is a mathematical expression.
scale=5: In bc, scale determines the number of decimal places in the result. scale=5 means that the result will be computed with 5 decimal places.
sqrt($number): This is the function call in bc to compute the square root of the value stored in the variable $number.

| bc -l:

The pipe (|) passes the output of the echo command to bc, which processes the mathematical expression.
bc is a calculator program that evaluates mathematical expressions. The -l option tells bc to use its math library, which includes the square root function (sqrt()).
$(...):

The $(...) syntax is used for command substitution. This means that the result of the command inside the parentheses is captured and assigned to the variable sq
'

sqrt=`awk "BEGIN {print sqrt($number)}"`
echo "By awk =$sqrt"

: '
awk: It is a powerful text-processing tool in Unix-like systems, primarily used for pattern scanning and processing. Here, it is being used to evaluate an expression.

BEGIN block: The BEGIN block in awk is used to execute the code inside it before processing any input data. In this case, there is no input data, but the block is still necessary to execute the expression.


'

sqrt()
{
    number=$1
    i=1
    while (( i * i <= number))
    do
        ((i++))
    done

    echo $((i-1))
}

# ans=$(sqrt $1)
# echo "The answer is $ans"

# for((i=3;i<=number;))
# do 
#     echo $i
#     i=$((i+2))
# done





# 1. Prime Number Check
# 2. Greatest Common Divisor (GCD)
# 3. Palindrome Check

prime()
{
    num=$1
    kathi=0
    for((i=1;i<=(num/2);i++))
    do
        temp=$((num % i))
        if [ $temp -eq 0 ];then
            kathi=1
            break
        fi
    done
    if [ $kathi == 1 ];then
        echo "The number is not prime"
    else
        echo "The number is prime"
    fi
}

# prime $1


# Find the gcd of the number
GCD()
{
    first=$1
    second=$2
    while [ $second -gt 0 ]
    do 
        temp=$(( first % second ))
        first=$second
        second=$temp
    done
    echo $first
}

# res=$(GCD $1 $2)
# echo "The gcd of $1 and $2 is $res"


counting()
{
    num=$1
    count=0
    while [ $num -gt 0 ]
    do
        ((count++))
        num=$((num / 10))
    done
    echo $count
}

palindrome()
{
    num=$1
    temp=$num
    c=$(counting $num) #c=3

    sum=0
    while [ $num -gt 0 ] #num=424
    do
        rem=$((num % 10)) #rem=4

        ((c--)) #c=2

        pow=$((10 ** c)) #pow=100
        mul=$((pow * rem)) #mul=100*4 = 400
        sum=$((sum + mul)) #sum=0+400 = 400


        num=$(( num / 10)) #num=424/10= 42
    done
    # echo "The number's mirror is $sum"
    if [ $temp -eq $sum ];then
        echo "The number is palindrome"
    else
        echo "The number is not palindrome"
    fi
}

palindrome 989

echo "total argument no=$#, arguments are= $@ or by  $*"