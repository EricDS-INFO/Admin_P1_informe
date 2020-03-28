## Administración de usuarios y contraseñas

    En primer lugar, crearemos un conjunto de usuarios __usu1, usu2, usu3, usu4, usu5, usu6__, que deben cambiar cada 3
    meses su contraseña, que coincidirá con el nombre de usuario. Además, será necesario notificar a los usuarios 1
    día antes de que caduque su contraseña, y 2 días después de su caducidad, la cuenta quedará desactivada.

Será necesaria la elaboración de 2 pasos previos que servirán para proceder a la realización de este primer apartado de la práctica:

### Paso 1.
#### Creación de usuarios.
Para la creación de usuarios tenemos que ejecutar el siguiente comando como *superusuario* (**root**):
> **useradd [nombre del usuario]**
Este comando será necesario para añadir todos los usuarios. Cabe destacar que todos los directorios personales de los usuarios son creados en el directorio **/home** automáticamente con el mismo nombre que el propio usuario. Una vez creado los usuarios, se procede con el siguiente paso.

### Paso 2.
#### Creación y administración de contraseñas
Para asignar una contraseña a cada usuario, utilizaremos el comando:
> **psswd [usuario a modificar]** 
En nuestro caso queremos que las contraseñas sean iguales al nombre del usuario.
Una vez realizado este paso, deberemos modificar las características de la contraseña.

##### Características de las contraseñas
Para realizar este proceso es necesario modificar el archivo **/etc/shadow**, mediante el comando **chage**:

    Se podría abrir el fichero mediante un editor de texto convencional pero debido a la importancia del texto y su
    fragilidad, sería mucho mas conveniente y seguro trabajar con un comando que se dedicara explícitamente a la
    modificacion del fichero **/etc/shadow**

>**chage --maxdays 90**
>**chage --warndays 1**
>**chage --inactive 2 [ usuario ]**

Con la opción **maxdays** modificamos el tiempo máximo que puede transcurrir con la contraseña actual. Una vez sobrepasado este tiempo es obligatorio su cambio. En cuanto a **warndays**, su uso es necesario para indicar que el usuario será notificado un día antes (en este caso) de la caducidad de su contraseña. Por último, la opción **inactive** indica los días que habrá entre la caducidad de la contraseña y el bloqueo de la cuenta del usuario.

//insertar foto etcshadow//S






<br>

![logo](icono-ull-negro.png)