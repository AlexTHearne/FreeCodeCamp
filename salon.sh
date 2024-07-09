#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU () {
if [[ $1 ]]
then echo -e "\n$1\n"
fi

AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services")
echo "$AVAILABLE_SERVICES" | while read ID BAR SERVICE
do
echo -e "$ID) $SERVICE"
done
echo "E) Exit"
echo -e "\n Please input the number for the service you would like to schedule:" 
read SERVICE_ID_SELECTED
if [[ ! $SERVICE_ID_SELECTED =~ $(echo "^[0-$($PSQL "SELECT COUNT(service_id) FROM services")]+$" | tr -d '[:space:]') ]]
then
EXIT
MAIN_MENU "That isn't a valid service selection."
else
SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
echo "You've selected $SERVICE_SELECTED"
echo -e "\nPlease enter your phone number:"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

#customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then
#get customer name
echo -e "\nPlease enter your name:"
read CUSTOMER_NAME
CREATE_CUSTOMER
fi
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
echo -e "\nPlease enter a time for your appointment between 8:00am & 8:00 pm:"
read SERVICE_TIME
if [[ -z $SERVICE_TIME ]]
then
MAIN_MENU "That isn't a valid service selection."
else
SCHEDULER
if [[ $($PSQL "SELECT time FROM appointments WHERE customer_id = '$CUSTOMER_ID' AND time = '$SERVICE_TIME'") == $SERVICE_TIME ]] 
then
MAIN_MENU "That isn't a valid time selection. Please try again."
else
SERVICE_SELECTED=$($PSQL "SELECT name FROM services INNER JOIN appointments USING(service_id) WHERE time = '$SERVICE_TIME'")
SERVICE_TIME=$($PSQL "SELECT time FROM appointments WHERE customer_id = '$CUSTOMER_ID' AND time = '$SERVICE_TIME'")
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = '$CUSTOMER_ID'") #Need to finish getting this defined so next line will print correctly. 
echo -e "\nI have put you down for a$SERVICE_SELECTED at$SERVICE_TIME,$CUSTOMER_NAME."
fi
fi
fi
}
 SCHEDULER () {
$PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')"

 }
 CREATE_CUSTOMER () {
$PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')"

 }
 EXIT () {
  if [[ $SERVICE_ID_SELECTED =~ [E] ]]
then
exit
fi
 }
echo -e "~~Welcome to The Kura Door Holistic Japanese Spa~~\n\nHere are some of the wonderful services we offer:\n"
MAIN_MENU