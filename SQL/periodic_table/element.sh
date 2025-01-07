#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# Guardo el argumento
ARGUMENT=$1

# Veo si el argumento es !null
if [[ -z $ARGUMENT ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Veo si el argumento es un número
if [[ $ARGUMENT =~ ^[0-9]+$ ]]
then
  # Si es un número, busco el número atómico
  ELEMENT_DATA=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type 
                         FROM elements e 
                         JOIN properties p ON e.atomic_number = p.atomic_number 
                         JOIN types t ON p.type_id = t.type_id
                         WHERE e.atomic_number=$ARGUMENT;")
else
  # Si no, lo trato como symbol o name
  ELEMENT_DATA=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type 
                         FROM elements e 
                         JOIN properties p ON e.atomic_number = p.atomic_number 
                         JOIN types t ON p.type_id = t.type_id
                         WHERE e.symbol='$ARGUMENT' OR e.name ILIKE '$ARGUMENT';")
fi

# Si no se encuentra el elemento, printeo el mensaje de error
if [[ -z $ELEMENT_DATA ]]
then
  echo "I could not find that element in the database."
  exit
fi

# Busco todos los valores del argumento
ATOMIC_NUMBER=$(echo "$ELEMENT_DATA" | awk -F'|' '{print $1}' | xargs)
SYMBOL=$(echo "$ELEMENT_DATA" | awk -F'|' '{print $2}' | xargs)
NAME=$(echo "$ELEMENT_DATA" | awk -F'|' '{print $3}' | xargs)
ATOMIC_MASS=$(echo "$ELEMENT_DATA" | awk -F'|' '{print $4}' | xargs)
MELTING_POINT=$(echo "$ELEMENT_DATA" | awk -F'|' '{print $5}' | xargs)
BOILING_POINT=$(echo "$ELEMENT_DATA" | awk -F'|' '{print $6}' | xargs)
TYPE=$(echo "$ELEMENT_DATA" | awk -F'|' '{print $7}' | xargs)

# Si existen, printeo el rdo pedido
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."


