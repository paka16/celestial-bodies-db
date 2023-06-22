#!/bin/bash

# USE THIS TO QUERY:
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# display the services

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1" 
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services")

  echo List of Services:
  echo -e "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  echo -e "\nHow can I help you?"
  read SERVICE_ID_SELECTED

  # get the service id from the MAIN_MENU_SELECTION
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

  # service doesn't exist
  if [[ -z $SERVICE_ID ]]
  then
    MAIN_MENU "There's no such thing."
  else
    # get information
    echo -e "\nWhat is your phone number?"
    read CUSTOMER_PHONE

    # customer exists
    CUSTOMER_NAME_RESULT=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    # customer doesn't exist
    if [[ -z $CUSTOMER_NAME_RESULT ]]
    then
      echo -e "\nWe don't have you in our records. What is your name?"
      read CUSTOMER_NAME
      NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")

    fi
    echo -e "\nWhen do you want your appointment?"
    read SERVICE_TIME
    # create the appointment
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    NEW_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID'")
    echo I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.

  fi
}

MAIN_MENU
