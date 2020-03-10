#!/bin/bash

#### SCRIPT FOR USER GENERATION
if [ $USER == "root" ]; then
	
  if [ $# -lt 1 ]; then
    echo "---Debe proporcionar un nombre de usuario para poder comenzar---"
    echo "Ejemplo: "$0 "my_username"
    exit
  fi

  #Declaracion de variables locales
  newuser=$1
  newpasswd=$1
   
  if  getent passwd $newuser > /dev/null 2>&1; then
    echo "user already exists"
    exit
  fi
    useradd $newuser
    echo $newuser:$newpasswd | chpasswd
    echo "Added user: $newuser"
    echo "User's password for $newuser is $newpasswd. Change it as soon as possible."
    echo "----- creating home directory -----"
    mkdir /home/$newuser
    echo "---- changed permissions -----"
    chgrp $newuser /home/$newuser 
    chmod u+rwx /home/$newuser
    chmod g+rwx /home/$newuser 
    chmod o-rwx /home/$newuser

else
 echo "Denied, not enough permissions"
fi
