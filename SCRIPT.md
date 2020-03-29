## Script para la creación de usuarios

    En el siguiente apartado se pretende exponer cómo se ha automatizado el proceso de
    adición de un nuevo usuario a nuestro sistema.
> Por medio del script "usuarios.sh"

Incluir un usuario conlleva una serie de procesos tales como la modificación de algunos 
permisos, credenciales de contraseña y demás características que deben hacerse por cada
uno de los nuevos participantes.

Este proceso puede resultar, a parte de tedioso, un **momento en el que pueden cometerse errores**. 

Es entonces donde escribir un *script* que automatice el proceso y que revise
aquellas tareas que no requieran de intervención personal aporta una solución y una meejoría 
en cuanto a la eficiencia del sistema.

***

En el programa que hemos creado empleando **bash** cuidamos que:
1. Se cree el usuario con un nombre indicado al llamar el programa
2. Las contraseñas sean semejantes al nombre de usuario
3. Se cree la carpeta personal del usuario con los debidos permisos



<br>

![logo](icono-ull-negro.png)