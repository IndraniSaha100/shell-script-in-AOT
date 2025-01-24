fact()
{
  var=$1
  result=1
  while [ $var -ne 0 ]
  do
    result=`expr $result \* $var`
    var=$((var - 1))
  done
  echo $result
}

read inp
result=$(fact $inp)
echo "result is $result"