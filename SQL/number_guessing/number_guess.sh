#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only --quiet -c"

NUMBER=$(( RANDOM % 1000 + 1 ))
COUNT=1

welcome_user() {
  echo "Enter your username:"
  read USERNAME

  # Consulta para obtener datos del usuario y eliminar espacios
  GAMES_PLAYED=$($PSQL "SELECT games FROM users WHERE username='$USERNAME';" | xargs)
  BEST_GAME_GUESSES=$($PSQL "SELECT best_guess FROM users WHERE username='$USERNAME';" | xargs)

  if [[ -z $GAMES_PLAYED ]]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    $PSQL "INSERT INTO users(username, best_guess, games) VALUES('$USERNAME', 0, 0);"
  else
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME_GUESSES guesses."
  fi
}

validate_guess() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    return 0
  else
    return 1
  fi
}

guess_the_number() {
  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  while ! validate_guess $GUESS; do
    echo "That is not an integer, guess again:"
    read GUESS
  done

  while true; do
    if [[ $GUESS -gt $NUMBER ]]; then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $NUMBER ]]; then
      echo "It's higher than that, guess again:"
    else
      echo "You guessed it in $COUNT tries. The secret number was $NUMBER. Nice job!"
      # Actualiza juegos jugados
      $PSQL "UPDATE users SET games = games + 1 WHERE username = '$USERNAME';"

      # Actualiza la mejor puntuación si es la mejor
      if [[ -z $BEST_GAME_GUESSES ]] || [[ $COUNT -lt $BEST_GAME_GUESSES ]]; then
        $PSQL "UPDATE users SET best_guess = $COUNT WHERE username = '$USERNAME';"
      fi      
      exit

    fi

    COUNT=$(( COUNT + 1 ))
    read GUESS

    while ! validate_guess $GUESS; do
      echo "That is not an integer, guess again:"
      read GUESS
    done
  done
}

# Ejecuta las funciones
welcome_user
guess_the_number



