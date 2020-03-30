## Introducción al informe

### Contenido del Informe
    En este informe se tratará de mostrar los pasos que hemos seguidos para poder realizar
    lo que se nos ha propuesto punto pot punto

### Breve explicación de la práctica 
Se nos presenta la siguiente situación de una Organización:

+ Existen 3 proyectos: *Aeropuerto*, *Centro Comercial*, *Parque*

+ Dos ejecutivos: *ejec1* y *ejec2*

+ Seis usuarios: *usu1* *usu2* *usu3* *usu4* *usu5* *usu6* 

+ La distribuición de los usuarios por proyectos es de la siguiente forma:

![distrib](distribuicionusers.PNG)

+ Los ejecutivos asociados a un determinado proyecto podrán leer la información de  ese proyecto, pero no podrán modificarla

+ Los ejecutivos que no pertenezcan a un proyecto no deben poder acceder  directamente a los directorios de los proyectos

+ Para que estos ejecutivos puedan controlar el estado de cada proyecto al que no  pertenecen, deben existir en el directorio /usr/local/bin tantos programas como  proyectos existan.

+ Estos programas internamente han de realizar un “ls” sobre el directorio del proyecto  correspondiente.

+ El programa que permite evaluar cada proyecto, debe cumplir lo siguiente debe poder ser ejecutado únicamente por los ejecutivos de la organización y debe tener asignado los permisos suficientes para poder ejecutar el “ls”  sobre el directorio correspondiente.

    
### Objetivos

+ Poner en práctica el conocimiento sobre la creación y manejo de *usuarios* y *grupos*, asi como de los *permisos* en ficheros, directorios y ejecutables.

+ Utilización de los bits SETUID y SETGID en ficheros ejecutables

+ Utilización del bit SETGID en directorios 

+ Utilización del sticky bit 

+ Listas de control de acceso (ACL’s

+ Cuotas de disco



> 


<br>

![logo](icono-ull-negro.png)
