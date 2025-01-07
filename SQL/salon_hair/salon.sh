#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~ MY SALON ~~\n"
echo -e "Welcome to My Salon, how can I help you?"

MAIN_MENU() {

  # Listar servicios disponibles
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # Leer selección del usuario
  read SERVICE_ID_SELECTED
  SERVICE_EXISTS=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")

  # Validar selección
  if [[ -z $SERVICE_EXISTS ]]
  then
    echo -e "\nI could not find that service. What would you like today?\n"
    MAIN_MENU
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # Buscar cliente
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "I don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    fi

    # Obtener ID del cliente
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")

    echo -e "What time would you like your appointment, $CUSTOMER_NAME?"
    read SERVICE_TIME

    # Insertar cita
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
    
    echo -e "\nI have put you down for a$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;") at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU
