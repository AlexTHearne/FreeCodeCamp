#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS 
do
  
  #get winner in team_id
  if [[ $YEAR != year ]]
then
  WINNING_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  #if not found
  if [[ -z $WINNING_TEAM_ID ]]
    then
  # insert winning team
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      echo $INSERT_WINNER

  # get new winning team_id
      if [[ $INSERT_WINNER == "INSERT 0 1" ]]
        then
          echo "Inserted into teams, $WINNER"
      fi
  fi
  #get opponentin team_id
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  #if not found
  if [[ -z $OPPONENT_TEAM_ID ]]
    then
  # insert opponent team
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      echo $INSERT_OPPONENT

  # get new opponent team_id
      if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
        then
          echo "Inserted into teams, $OPPONENT"
      fi
  fi
   #check if game is in games table
    GAME_DATA=$($PSQL "SELECT * FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_goals='$WINNER_GOALS' AND opponent_goals='$OPPONENT_GOALS' AND winner_id='(SELECT team_id from teams WHERE name='$WINNER')' AND opponent_id='(SELECT team_id from teams WHERE name='$OPPONENT')'")
   #if not found
  if [[ -z $GAME_DATA ]]
    then
   #insert game data
    INSERT_GAME_DATA=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, (SELECT team_id from teams WHERE name='$WINNER'), (SELECT team_id from teams WHERE name='$OPPONENT'))")
      echo $INSERT_GAME_DATA
   # get new game data
    if [[ $INSERT_GAME_DATA == "INSERT 0 1" ]]
      then
        echo "Inserted into games, $YEAR, $ROUND, $WINNER_GOALS, $OPPONENT_GOALS $WINNER_ID, $OPPONENT_ID"
      fi

   fi
  fi
done
