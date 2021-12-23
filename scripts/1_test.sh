#How to save strings in a variable

variable1="toto"
variable2="tata"

echo variable1: $variable1
echo variable2: $variable2
#echo = access the content of the variable

variable3="${variable1} ${variable2}"
echo variable3: $variable3