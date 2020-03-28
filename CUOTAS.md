## Asignación de cuotas de discos 
    Lo que se demandaba era que cada usuario tuviera una cuota de disco de __50Mb__ que no podrá sobrepasar
    __temporalmente (2 días)__.

    Para realizar este proceso, lo primero que se debe hacer es abrir el archivo __/etc/fstab__ con un editor
    de texto, se nos mostrará las distintas particiones del equipo, en nuestro caso nos interesa la cuota de
    disco para __/home__, por lo que añadiremos la opción __usrquota__ y realizamos los siguientes comandos:

>__mount -o remount /home__
>__quotacheck -cug /home__
>__quotacheck -avug__

Con esta serie de comandos lo que hacemos es lo siguiente, primero montamos el archivo, luego se crea el archivo __aquota.user__, se crea la tabla de uso de disco y a partir de aquí habrá que modificar el archivo para establecer las cuotas de disco. Para ésto último paso, se hace uso del comando __edquota usu1__ que abre un fichero en el que debemos modificar la columna __soft__ y añadirle una cuota de _50Mb_ 

//insertar foto edquota usu1//

Una vez que hayamos hecho este proceso para cada usuario, el comando __edquota -t__ nos abre un fichero en el que cambiaremos el periodo de gracia a 2 días.

>Para comprobar que se ha realizado correctamente las operaciones de las cuotas de disco podemos usar el comando:
>__repquota /home

//insertar foto repquota /home//

<br>

![logo](icono-ull-negro.png)