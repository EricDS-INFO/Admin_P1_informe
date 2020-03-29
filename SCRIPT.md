## Script para la creación de usuarios

    En el siguiente apartado se pretende exponer cómo se ha automatizado el proceso de
    adición de un nuevo usuario a nuestro sistema.


![bash-logo-image](bash-portada.png "logo de bash para encabezar")


> Por medio del script ["usuarios.sh"](usuarios.sh "script del que se habla en este apartado")

Incluir un usuario conlleva una serie de procesos tales como la modificación de algunos 
permisos, credenciales de contraseña y demás características que deben hacerse por cada
uno de los nuevos participantes.

Este proceso puede resultar, a parte de tedioso, un **momento en el que pueden cometerse errores**. 

Es entonces donde escribir un *script* que automatice el proceso y que revise
aquellas tareas que no requieran de intervención personal aporta una solución y una mejoría 
en cuanto a la eficiencia del sistema.

***

En el programa que hemos creado empleando **bash** cuidamos que:
1. Se cree el usuario con un nombre indicado al llamar el programa
2. Las contraseñas sean semejantes al nombre de usuario
3. Se cree la carpeta personal del usuario con los debidos permisos


        Se puede observar como el programa realiza las mismas acciones que 
        se cometen durante el proceso del guión de la práctica, tal y como 
        se ha ido indicando en el informe pero esta vez en una sola orden.

El siguiente paso va a ser **analizar** paso por paso como funciona el *script*.


Primero es crucial **comprobar que el usuario que ejecuta el *script* es root** para
ello nos servimos de los condicionales y del valor por expansión *$USER* que revelará
el nombre del usuario actual.
```BASH
    if [ $USER == "root" ]; then
        ...
    else
        echo "Denied, not enough permissions"
    fi
```


**Una vez verificado** que la identidad del usuario que lanza la orden es **el administrador** 
(o que al menos actúa como tal), se procede a la **comprobación** de que se ha proporcionado
un **nombre de usuario** para poder llevar a cabo la orden. Nuevamente haciendo uso de los
condicionales.
```BASH
    if [ $# -lt 1 ]; then
        echo "---Debe proporcionar un nombre de usuario para poder comenzar---"
        echo "Ejemplo: "$0 "my_username"
        exit
    fi
```
En este caso, tal y como se observa en el código expuesto, se realiza una comprobación gracias
a la expansión del número de argumentos dada por *$#*. 

De ser esta menor que 1 se procederá a imprimir un mensaje de ayuda y a salir del programa.
> *$0* corresponde a la orden leida por bash, que es el nombre del programa.


Tras la verificación de estos aspectos esenciales se prosigue a **dar valores a las variables**
y **comprobar su duplicidad**. Ya que de existir en el sistema un usuario con el nombre
proporcionado **el programa acabaría en error.** Para comprobar esto se emplea una sentencia
de bash que devuelve la existencia del usuario (*getent*) en el fichero "passwd". En caso de 
no ser nula se proporciona un mensaje de error y se procede a terminar el programa de 
inmediato.

Las siguientes lineas de código corresponden a lo explicado:
```BASH
    newuser=$1
    newpasswd=$1
   
    if  getent passwd $newuser > /dev/null 2>&1; then
        echo "user already exists"
        exit
    fi
```
> *$1* se expande con el primer argumento proporcionado, que debería ser el nombre de usuario.


Finalmente, lo que resta es ejecutar la serie de **comandos que registran a nuestro usuario** y 
le proporcionan una carpeta personal. 

```BASH
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
```
> Se puede apreciar que la contraseña proporcionada es el mismo nombre dado para el usuario
> .Sin embargo se advierte de cambiarla cuanto antes.


Este *script* es, en muchos aspectos, mejorable. Por ejemplo:
- modificando también aspectos tales como las opciones en */etc/shadow* 
- generando una contraseña aleatoria que se le suministre solo al usuario
- permitiendo más argumentos para la adición a grupos de trabajo

Sin embargo por cuestiones de falta de tiempo no se ha ahondado en estos aspectos de cara al 
día de la entrega.

<br>

![logo](icono-ull-negro.png)