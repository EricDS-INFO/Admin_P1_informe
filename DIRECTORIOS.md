## __Acciones tomadas para el manejo de directorios y permisos de los usuarios del sistema__

Ahora vamos a analizar cómo se ha manejado los directorios personales de cada usuario y los permisos que se le asignan. Todo usuario del sistema debe poseer un subdirectorio del propio directorio __/home__ cuyo nombre debe coincidir con el de la cuenta del usuario. Sin embargo, no es necesaria la creación de este directorio personal del usuario , puesto que se crea automáticamente con la creación de usuario.

Además, ningún usuario puede entrar en el directorio personal de otro usuario; sin embargo, aunque un usuario puede crear y borrar todo tipo de archivos en su propio directorio personal, no podrá cambiar los permisos de ese directorio.

### __Permisos del directorio personal__
Para que ningún usuario pueda acceder al directorio personal ni a los ficheros de otro usuario, lo primero que debemos hacer es cambiar los permisos de cada directorio personal. Para ello, utilizaremos el comando __chmod__ seguido de los permisos que se quieran permitir y el nombre del directorio: 

__chmod 770 usu1__
__chmod a+rwx,o-rwx usu1__

Lo que hacemos con este comando, estamos indicando mediante la cifra __770__ lo mismo que se puede hacer con la opción __a+rwx,o-rwx__, que el directorio usu1 tendrá permisos de lectura, escritura y ejecución para el propietario del directorio y para el grupo propietario. Asimismo, cualquier otro usuario no tendrá ningún permiso sobre ese directorio. Además, queremos que el usuario no pueda modificar estos permisos que hemos asignado; el problema es que el propietario de un directorio siempre va a poder cambiar los permisos de ese directorio, así que lo que haremos será hacer propietario a __root__ mediante el comando __chown__:

__chown root usu1__

Como grupo propietario será el propio __usu1__, éste tendrá la posibilidad de entrar en su directorio
<br>

![logo](icono-ull-negro.png)'