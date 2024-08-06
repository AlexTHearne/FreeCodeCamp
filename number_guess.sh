#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
randNum=$(($RANDOM%(1000)+1))
guess_counter=1

guessNCount () {

read guess

if [[ $guess =~ ^-?[0-9]+$ ]]
then
if [[ $guess = $randNum ]]
then 
echo "You guessed it in $guess_counter tries. The secret number was $randNum. Nice job!"
elif [[ $guess > $randNum ]]
then
echo -e "\nIt's lower than that, guess again:" 
guess_counter=$(($guess_counter+1))
guessNCount
else 
echo -e "\nIt's higher than that, guess again:"
guess_counter=$(($guess_counter+1))
guessNCount
fi
else
echo -e "\nThat is not an integer, guess again:"
guessNCount
fi
}

MAIN () {
  echo "Enter your username:"
  read name

if [[ $($PSQL "SELECT username FROM users WHERE username = '$name'") != "$name" ]]
then
echo $($PSQL "SELECT game_counter FROM users WHERE username = '$name'")
echo "Welcome, $name! It looks like this is your first time here."
CreatUser=$($PSQL "INSERT INTO users(username, game_counter, best_game) VALUES('$name', 0, 50)")
else
username=$($PSQL "SELECT username FROM users WHERE username = '$name'")
best_game=$($PSQL "SELECT best_game FROM users WHERE username = '$name'")
games_played=$($PSQL "SELECT game_counter FROM users WHERE username = '$name'")

echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
guessNCount

if [[ $($PSQL "SELECT best_game FROM users WHERE username = '$name'") > $guess_counter ]]
then
updatedBestGame=$guess_counter
else 
updatedBestGame=$($PSQL "SELECT best_game FROM users WHERE username = '$name'")
fi
updatedGameCount=$(($games_played+1))
updateUsersGames=$($PSQL "UPDATE users SET game_counter = $updatedGameCount, best_game = $updatedBestGame WHERE username = '$name'")
}

MAIN