#! /bin/bash

# using if loop to be able to run tests without affecting original database

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

#start by emptying the rows in the tables of the database so we can rerun the file
echo $($PSQL "TRUNCATE TABLE games, teams")


# read the games.csv file using cat and apply a while loop to read row by row
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  # INSERT TEAMS TABLE DATA

    # GET WINNER TEAM NAME

      #exclude column names row
      if [[ $WINNER != "winner" ]]
        then
          # get team name
          TEAM1_NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
            #if team name is not found we need to include the new team to the table
            if [[ -z $TEAM1_NAME ]]
              then
              #insert new team
              INSERT_TEAM1_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
                #echo call to let us know team was inserted
                
            fi
      fi

    # GET OPPONENT TEAM NAME

      #exclude column names row
      if [[ $OPPONENT != "opponent" ]]
        then
          # get team name
          TEAM2_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
            #if team name is not found we need to include the new team to the table
            if [[ -z $TEAM2_NAME ]]
              then
              #insert new team
              INSERT_TEAM2_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
                
            fi
      fi

  # INSERT GAMES TABLE DATA

    # we dont want the column names row so exclude it
    if [[ YEAR != "year" ]]
      then
        #GET WINNER_ID
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        #GET OPPONENT_ID
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        #INSERT NEW GAMES ROW
        INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
          # echo call to let us know what was added
          
    fi
    
done