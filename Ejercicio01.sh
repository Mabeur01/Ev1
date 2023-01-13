#!/bin/bash

# Bucle principal
while true; do
  # Mostrem les opcions disponibles
  echo "Selecciona una opció:"
  echo "1. Veure nombre de vegades que s'ha loguejat un usuari"
  echo "2. Veure dies que s'ha connectat un mes"
  echo "3. Veure usuaris que s'han connectat en una data"
  echo "4. Veure data de l'última connexió d'un usuari"
  echo "5. Sortir"
  read option

  case $option in
    1) # Operació 1
       echo "Introdueix el nom de l'usuari:"
       read username
       num_logins=$(grep -c $username usuaris.txt)
       if [ $num_logins -eq 0 ]; then
         echo "No s'ha loguejat"
       else
         echo "$username n'ha connectat $num_logins vegades"
       fi
       ;;
    2) # Operació 2
       echo "Introdueix el nom del mes (en minúscules):"
       read month
       days=$(grep $month usuaris.txt | cut -d ' ' -f1 | sort -u)
       if [ -z "$days" ]; then
         echo "0"
       else
         echo $days
       fi
       ;;
    3) # Operació 3
       echo "Introdueix el dia:"
       read day
       echo "Introdueix el mes (en minúscules):"
       read month
       users=$(grep "$day $month" usuaris.txt | cut -d ' ' -f1)
       if [ -z "$users" ]; then
         echo "No hi ha connexions en aquesta data"
       else
         echo $users
       fi
       ;;
    4) # Operació 4
       echo "Introdueix el nom de l'usuari:"
       read username
       last_login=$(grep $username usuaris.txt | tail -1)
       if [ -z "$last_login" ]; then
         echo "L'usuari no s'ha loguejat mai"
       else
         echo "L'última connexió de $username va ser el $last_login"
       fi
       ;;
    5) # Operació eixida
       break
       ;;
    *) # Opció invàlida
       echo "Opció invàlida"
       ;;
  esac
done
