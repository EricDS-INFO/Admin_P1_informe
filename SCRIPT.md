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

<br>

![logo](icono-ull-negro.png)