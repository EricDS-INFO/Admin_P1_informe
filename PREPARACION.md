## Preparación del sistema - configuración de las máquinas remotas
    En las siguientes secciones se va a proceder a explicar aquellas acciones tomadas
    como preparativos para el desarrollo de esta y las siguientes prácticas.

    En resumen se trata de la creación de dos máquinas virtuales bajo la estructura IaaS.
> IaaS hace referencia a Infrastructure as a Service, más información en [Microsoft Azure](https://azure.microsoft.com/en-us/overview/what-is-iaas/).


![iaas image](IAAS.jpng "imagen de cabecera sobre IaaS")
> imagen de cabecera de lo que sería un servicio Iaas

    Este tipo de servicios permite gestionar de maner ainstantanea una infraestructura 
    computacional que es gestionada y provisionada directamente desde internet. Evitamos
    muchos quebraderos de cabeza respecto a cuestiones de hardware y disponibilidad de espacio. Este tipo permite aumentar o decrementar muchas características bajo demanda.

El objetivo de esta parte de la práctica, que fue la primera, era montar una infraestructura 
sobre la cual poder trabajar todos aquellos aspectos a desarrollar durante las prácticas.

La infraestructura se compondría de dos máquinas, un lciente y un servidor. Ambas máquinas 
debían no oslo configurarse con un sistema operativo concreto y unos paquetes necesarios para 
el desarrollo de la materia, sino que también era preciso configurar una tarjeta de red que 
vinculase ambas máquinas por una intranet. 

Ambos servidores fueron creados bajo el servicio Iaas propor cionado por la ULL e 
inicializados con el sistema operativo CentOS mediante un paquete de intalación predefinido.
El propósito de usar dicha plantilla es agilizar este apartado y  evitar posibles errores que
pudieran perjudicar el uso de la máquina o ralentizar la actividad.

Cabe hacer mención a que todos los datos y sistemas que se crean residen en un CPD que 
realmente existen y son clusters físicos. Sin embargo *oVirt* hace de interfaz y hace 
transparente toda esa infraestructura para poder centrarnos en el empleo y administración de 
las máquinas virtuales.
> El acceso a estas está protegido de manera que solo se pueda acceder usando una VPN o desde 
> la propia red de la ULL

### Características comunes a ambas máquinas

Tanto la máquina que actúa de servidor como el cliente presentan similitudes en cuanto a su 
configuración:
- Ambas usan [**CentOS**](https://www.centos.org/ "link a la página oficial de CentOS")
- Ambas tendrán un usuario y un root inicialmente
    > Claramente con contraseñas distintas y personales
- Ambas partes serán configuradas en cuanto a la interconectividad
    > Se ahonda más adelante sobre este aspecto


### Configuración manual de la interfaz de red
<br>

![logo](icono-ull-negro.png)