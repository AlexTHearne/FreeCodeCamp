#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

noFind () {
   echo I could not find that element in the database. 
   }

elementInfo () {

select_name=$($PSQL "SELECT * FROM elements WHERE atomic_number = '$1'")

IFS='|' read -r -a elementArray <<< "$select_name"

select_properties=$($PSQL "SELECT * FROM properties WHERE atomic_number = '$1'")

IFS='|' read -r -a propertiesArray <<< "$select_properties"

type=$($PSQL "SELECT type FROM types WHERE type_id = '${propertiesArray[4]}'")

echo "The element with atomic number ${elementArray[0]} is ${elementArray[2]} (${elementArray[1]}). It's a $type, with a mass of ${propertiesArray[1]} amu. ${elementArray[2]} has a melting point of ${propertiesArray[2]} celsius and a boiling point of ${propertiesArray[3]} celsius."
exit
}

if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else 

numReg='^[0-9]+$'
symboReg='^[A-Z]$'
nameReg='^[A-Z][a-z]+$'
n=${#1}

if [[ $1 =~ $numReg ]]
then
if [[ $($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '$1'") ]]
then
elementInfo $($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '$1'")
else
noFind
fi
elif [[ $1 =~ $symbolReg && $n < 3 ]]
then
if [[ $($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'") ]]
then
elementInfo $($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
else
noFind
fi
elif [[ $1 =~ $nameReg ]]
then
if [[ $($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'") ]]
then
elementInfo  $($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
else
noFind
fi
else
echo "I could not find that element in the database."
fi
fi 
