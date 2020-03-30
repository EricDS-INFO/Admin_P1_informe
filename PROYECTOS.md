## Proyectos y ejecutivos - cómo se organiza la administración
    A continuación se pretende exponer las cuestiones que conciernen a los preparartivos para
    el desarrollo de la actividad laboral en los distintos proyectos para la administración
    que va a usar el sistema. De este modo tendremos que atender a que cada directorio 
    disponga de un control de permisos para cada uno de los usuarios y ejecutivos que 
    concentre cada proyecto.

> Los aspectos serán expuestos uno a uno a continuación

### Modelo organizacional

La organización necesita un entorno en el que trabajar. Para ello se crea una estructura de directorios que desde una carpeta de proyectos va dividiendo los archivos pertinentes en la carpeta que corresponde al proyecto.

Esta estructura no es de acceso libre para todos los usuarios ni para los ejecutivos. Estos 
deben ser distribuidos entre los proyectos pertinentes a cada uno. En resumen solo los 
usuarios que trabajen en un determinado proyecto podrán leer, escribir, modificar y crear 
archivos. Siempre y cuando estos archivos sean creados por ellos, en caso contrario solo 
tendrán permisos de lectura al igual que el ejecutivo de dicho proyecto. Este no podrá más 
que leer los archivos siempre y cuando supervise el proyecto. En caso contrario no tendrá 
ningún permiso

**La siguiente tabla ilustra la división de responsabilidades que define el modelo:**
| Usuario |          Proyectos                    |||
|   :---:  | :---:      | :---:           | :---:  |
|          | Aeropuerto | CentroComercial | Parque |
|usu1      |   | · |   |
|usu2      | · |   |   |
|usu3      | · | · |   |
|usu4      | · | · |   |
|usu5      | · | · | · |
|usu6      |   |   |   |
|ejec1     | · |   | · |
|ejec2     | · | · |   |
> El punto "*·*" marca que el usuario ha sido asignado al proyecto
<br>

    La principla diferencia, que no es ilustrada, entre ejecutivos y usuarios es el tipo de 
    acceso. Los usuarios, en sus proyectos, van a requerir de permisos de lectura y escritura
    . Sin embargo los ejecutivos, en los proyectos asignados, solo podrán entrar y leer. De no serles asignados solo podrán revisar el contenido del directorio de cada proyecto.

> Más adelante se explica como se ha procedido para permitir hacer estas operaciones

La estructura de directorios que engloba esta organización se compone por una carpeta por 
cada proyecto más una denominada *comun* a la cual podrá acceeder cualquier usuario del 
sistema. Con la salvedad de que en esta última sólo el usuario que crea el archivo podrá  
borrar sus propios archivos, de modo que todos podrán modificar y crear cualuier archivo

**La estructura del arbol de directorios es la siguiente:**
```js
    / (raíz)
    │
    └───export
    │   │
    │   └───proyectos
    |       |
    │       └───aeropuerto
    |       |
    │       └───CentroComercial
    |       |
    │       └───Parque
    |       |
    │       └───Comun
    │   
        · · ·
```

### Cómo se han configurado los directorios

Dado que buscamos que solo los usuarios asignados a un poroyecto concreto

![logo](icono-ull-negro.png)