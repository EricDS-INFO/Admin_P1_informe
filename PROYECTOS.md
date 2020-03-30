## Proyectos y ejecutivos - cómo se organiza la administración
    A continuación se pretende exponer las cuestiones que conciernen a los preparartivos para
    el desarrollo de la actividad laboral en los distintos proyectos para la administración
    que va a usar el sistema. De este modo tendremos que atender a que cada directorio 
    disponga de un control de permisos para cada uno de los usuarios y ejecutivos que 
    concentre cada proyecto.

> Los aspectos serán expuestos uno a uno a continuación

### Modelo organizacional

La organización necesita un entorno en el que trabajar. Para ello se crea una estructura de 
directorios que desde una carpeta de proyectos va dividiendo los archivos pertinentes en la 
carpeta que corresponde al proyecto.

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
    . Sin embargo los ejecutivos, en los proyectos asignados, solo podrán entrar y leer. De 
    no serles asignados solo podrán revisar el contenido del directorio de cada proyecto.

> Más adelante se explica como se ha procedido para permitir hacer estas operaciones

La estructura de directorios que engloba esta organización se compone por una carpeta por 
cada proyecto más una denominada *comun* a la cual podrá acceeder cualquier usuario del 
sistema. Con la salvedad de que en esta última sólo el usuario que crea el archivo podrá  
borrar sus propios archivos, de modo que todos podrán modificar y crear cualuier archivo

**La estructura del arbol de directorios es la siguiente:**
```t
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

Dado que buscamos que solo los usuarios asignados a un proyecto concreto puedan realizar las 
operaciones necesarias; la forma de que podamos controlar los permisos de una manera sencilla 
es haciendo que el propietario sea root (*como ya es norma si no queremos que se nos 
perjudique en este sentido*) y proporcionando, solo al grupo propietario los permisos 
pertinentes.

Acto seguido lo que debemos hacer es asignar los usuarios que van a trabajar en un proyecto 
al grupo que lo concierne.

La lista de permisos quedaría de la siguiente forma:
```BASH
    d---rws---+ root [grupo_de_proyecto] ··· [proyecto]
```
y para *comun*:
```BASH
    d---rws--T+ root [grupo_de_comun] ··· comun
```

Los aspectos a tener en consideración son:
- los permisos "especiales" van a actuar acorde con los directorios (no con ejecutables)
- El uso de setGID para que el grupo propietario del fichero creado sea el del directorio que lo contiene.
> de esta manera conseguimos que se puedan modificar los archivos entre usuarios solo del 
> mismo proyecto.
- Que setGID esté en minúscula implica que el permiso de ejecución está concedido también.
> tal y como se precisa para poder acceder al directorio.
- An común se ha añadido un sticky, que garantiza que solo el creador del fichero pueda borrar sus archivos.
- Al contrario que con el permiso anterior la " mayúscula indica la ausencia del permiso de ejecución.
> no nos interesa que cualquier usuario tenga permisos de ejecución del directorio.
- La aparición del signo "+" indica que una ACL también está presente

    La ACL o Access Controll List por sus siglas en inglés va a llevar la labor de permitir
    extender las limitaciones de los permisos UGO. Dee esta manera podremos definir de 
    una manera más concreta unos permisos específicos para otros grupos (como pudiera ser el 
    de los ejecutivos de cada proyecto)

### Los ejecutivos en nuestro proyecto

De cara a la maniobrabilidad de los permisos y por si la empresa precisara de la inclusión de 
más ejecutivos para un mismo proyecto; el paso correcto a dar es la creación de un grupo bajo 
el que reunir a los ejecutivos responsables del proyecto que los reune.

Sencillamente estos grupos podrán ser incluidos a la lista de permisos de la ACL de cada 
proyecto mediante la sentencia:
```BASH
    setfacl -m [u/g]:[nombre]:[permisos]: [ruta]
```
de esta manera podemos indicar por linea de comandos y para cada proyecto; que grupos de 
ejecutivos y que permisos poseen. un ejemplo podría ser:
```BASH
    setfacl -m g:ejecutivos_aeropuerto:rx: /export/proyectos/aeropuerto
```
> Con la anterior sentencia hemos modificado la ACL del directorio aeropuerto de manera que
> aquellos miembros del grupo *ejecutivos_aeropuerto* tiene permisos de lectura y ejecución 
> del directorio aeropuerto, lo cual les permite entrar y revisar su contenido.


> Todos los cambios pueden verificarse con la lectura de la ACL mediante el comando:
> *getfacl [ruta]*

> Cabe destacar que estas órdenes las podremos dar solamente como *root* o con sus permisos.

**Cuando un ejecutivo no es responsable de un proyecto** no podrá entrar en él. Sin embargo 
deberá de poder revisar su contenido. 

Para poder llevar a cabo este aspecto la solución propuesta consiste en la copia y 
modificación del comando *ls* siendo este ligeramente modificado en cuanto a permisos.

La finalidad de modificar el *ls* es poder acceder bajo el grupo de acceso de ejecutivos pero 
con limitaciones. Dado que es un ejecutable, al asignarle el permiso setGID tendrá un 
comportamiento ligeramente distinto. De esta maneera se compartiran de manera temporal 
algunos permisos que no podría obtener de otra manera.

El comando modificado tendría el siguiente aspecto:

```BASH
    ---r-s---+ root [grupo_proyecto] ··· ls-[proyecto]
```

De esta manera, el ejecutivo que lance el programa tomará temporalmente el permiso de lectura que necesita del grupo de proyecto adecuado. Tras esto se le mostrará la lista del contenido, tal y como lo haría ls. 

> Recordemos que el permiso de ejecución se muestra con la "s" minúscula


Con esto ya podríamos considerar una correcta configuración de los proyectos y su entorno de trabajo.


<br>
![logo](icono-ull-negro.png)