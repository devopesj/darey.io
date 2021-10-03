#! /bin/bash

# ECHO Command
#echo Hello World!

#Variables
#Uppercase by convention
#Letters, numbers and underscores
#NAME="BRAD"
#echo "My name is $NAME"
#echo "My name is ${NAME}"

# USER INPUT
#read -p "Enter your name: " NAME
#echo "Hello $NAME, nice to meet you"

#SIMPLE IF STATEMENT
#if [ "$NAME" == "Sam" ]
#then
#    echo "Your name is Sam"
#fi

#IF ELSE
#if [ "$NAME" == "Sam" ]
#then
#    echo "Your name is Sam"
#else
#    echo "Your name is not Sam - INTRUDER"
#fi

# ELSE IF
# if [ "$NAME" == "Sam" ]
# then
#     echo "Your name is Sam"
# elif [ "$NAME" == "Jack" ]
# then
#     echo "Your name is Jack"
# else
#     echo "Your name is not Sam or Jack - INTRUDER"
# fi

#COMPARISON EXPRESSIONS
# NUM1=31
# NUM2=5
# if [ "$NUM1" -gt "$NUM2" ]
# then
#     echo "${NUM1} is greater than $NUM2"
# else
#     echo "$NUM2 is greater than $NUM1"
# fi
# [1 -eq 2] equal to
# [2 - ne 3] not equal
# [2 -gt 3] greater than
# [2 -ge 3] greater or equal
# [2 -lt 2] less than
# [2 -le 3] less than or equal to

#Operators:  =, equal to ==, not equal to !=, validate if variable is empty -z

# File Comparisons 
#-d file        True if the file is a dir
# -f file       True if the provided string is a file 
# ! -f file     if the file does not exist
# -g file         True if the group id is set on the file
# -r file         Tue if the file is readable
# -u file         True if the user id is set on the file
# -w file         True if the file is writeable
# -x file         True if the file is executable

# FILE="test.txt"
# if [ - "$FILE" ]
# then
#     echo "$FILE is a file"
# else
#     echo "$FILE is NOT a file"
# fi

#CASE STATEMENT
# read -p "Are you 21 or over? Y/N " ANSWER
# case "$ANSWER" in 
#     [yY] | [yY][eS][sS])
#     echo "You can have a beer :)"
#     ;;
#     [nN] | [nN][oO])
#     echo "Sorry, Ribena for you :)"
#     ;;
# *)
#     echo "Please enter y/yes or n/no"
#     ;;
# esac

#SIMPLE FOR LOOP
# NAMES="Sam Jesse Judah"
# for NAME in $NAMES
#     do
#         echo "Hello $NAME"
# done

# FOR LOOP RENAME FILES
# FILES=$(ls *.txt)
# NEW="new"
# for FILE in $FILES
#     do
#         echo "Renaming $FILE to new-$FILE"
#         mv $FILE $NEW-$FILE
# done

#WHILE LOOP - READ THROUGH A FILE LINE BY LINE
# # LINE=1
# while read -r CURRENT_LINE
#     do
#         echo "$LINE: $CURRENT_LINE"
#         ((LINE++))
# done < "./new-1.txt" 

# #FUNCTION 
# function sayHello(){
#     echo "HELLO YOU!!!!"
# }

# sayHello

# # FUNCTION WITH PARAMS
# function greet() {
#     echo "Hello, I am $1 and I am $2"
# }

# greet "Sam" "32/33"

#CREATE FOLDER AND WRITE TO A FILE
mkdir hello
touch "hello/world.txt"
echo "Hello World" >> "hello/world.txt"
echo "Created hello/world.txt"