#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# reading the information off the csv
cat games.csv | while IFS=",", read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  if [[ $WINNER != "winner" ]]
  then 
  # get the winner name
  # echo WINNER == $WINNER
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

  # if the winner id does not exist
  if [[ -z $WINNER_ID ]]
  then 
    # insert the winner/team id
    INSERT_NEW_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    if [[ $INSERT_NEW_TEAM == "INSERT 0 1" ]] # the insert was successful
    then
      echo Inserted into teams, $WINNER
    fi

    # get the existing winner/team id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # get the opponent information
    # echo OPPONENT == $OPPONENT
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if the opponent team is not found
    if [[ -z $OPPONENT_ID ]]
    then
      # insert the opponent/new team
      INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_TEAM == "INSERT 0 1" ]] # the insert was successful
      then
        echo INSERTED THE OPPONENT TEAM SUCCESSFULLY
      fi
    
    # get the new opponent id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # INSERTING INTO THE GAMES TABLE
    # GET THE GAME ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    echo winner_id == $WINNER_ID and opponenet_id == $OPPONENT_ID
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")

    # if game id doesnt exist
    if [[ -z $GAME_ID ]]
    then
      # INSERT THE NEW GAME ID
      NEW_GAME_ID=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
      # if successful insert
      if [[ $NEW_GAME_ID == "INSERT 0 1" ]]
      then
        echo succecssfully added new game
      fi

      # get the new game id
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE opponent_id='$OPPONENT_ID' AND winner_id='$WINNER_ID'")
    fi
  fi

done

    
