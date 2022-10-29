#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ Salon appointment Scheduler ~~~~~\n"
MAIN_MENU(){
  if [[ $1 ]]
  then 
  echo -e "\n$1"
  fi
  echo -e "Welcome to My Salon, how can I help you?\n"
  SERVICE_NAMES=$($PSQL "select service_id,name from services")
  echo "$SERVICE_NAMES" | while read SERVICE_ID BAR SERVICE_NAME
  do
  echo -e "$SERVICE_ID) $SERVICE_NAME"
  done
  echo "6) Exit"
  read SERVICE_ID_SELECTED 
  case $SERVICE_ID_SELECTED in 
  1) CUT ;;
  2) COLOR ;;
  3) PERM ;;
  4) STYLE ;;
  5) TRIM ;;
  6) EXIT ;;
  *) MAIN_MENU "Please enter a valid option." ;;
  esac 
}
CUT(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  # if customer doesn't exist 
  if [[ -z $CUSTOMER_NAME ]]
  then
  # get new customer name
  echo -e "\nWhat's your name?"
  read CUSTOMER_NAME    
  # insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  # get customer id 
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  echo -e " \nWhat time would you like your cut, $(echo $CUSTOMER_NAME | sed 's/^ *//')?"
  # read time
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  # echo a message 
  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//').\n"
}
COLOR(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  # if customer doesn't exist 
  if [[ -z $CUSTOMER_NAME ]]
  then
  # get new customer name
  echo -e "\nWhat's your name?"
  read CUSTOMER_NAME    
  # insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  # get customer id 
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  echo -e " \nWhat time would you like your color, $(echo $CUSTOMER_NAME | sed 's/^ *//')?"
  # read time
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  # echo a message 
  echo -e "\nI have put you down for a color at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//').\n"
}
PERM(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  # if customer doesn't exist 
  if [[ -z $CUSTOMER_NAME ]]
  then
  # get new customer name
  echo -e "\nWhat's your name?"
  read CUSTOMER_NAME    
  # insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  # get customer id 
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  echo -e " \nWhat time would you like your perm, $(echo $CUSTOMER_NAME | sed 's/^ *//') ?"
  # read time
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  # echo a message 
  echo -e "\nI have put you down for a perm at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//').\n"
}
STYLE(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  # if customer doesn't exist 
  if [[ -z $CUSTOMER_NAME ]]
  then
  # get new customer name
  echo -e "\nWhat's your name?"
  read CUSTOMER_NAME    
  # insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  # get customer id 
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  echo -e " \nWhat time would you like your style, $(echo $CUSTOMER_NAME | sed 's/^ *//')?"
  # read time
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  # echo a message 
  echo -e "\nI have put you down for a style at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//').\n"
}
TRIM(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
  # if customer doesn't exist 
  if [[ -z $CUSTOMER_NAME ]]
  then
  # get new customer name
  echo -e "\nWhat's your name?"
  read CUSTOMER_NAME    
  # insert new customer
  INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  # get customer id 
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  echo -e " \nWhat time would you like your trim, $(echo $CUSTOMER_NAME | sed 's/^ *//')?"
  # read time
  read SERVICE_TIME
  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  # echo a message 
  echo -e "\nI have put you down for a trim at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/^ *//').\n"
}
EXIT(){
  echo -e "\n Thank you for stopping in.\n"
}
MAIN_MENU
