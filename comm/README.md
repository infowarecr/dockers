# Instalación de NGINX como api Gateway para el módulo de comunicación del GPAX

### Requisitos previos
- Servidor virtual, para 1000 usuarios concurrentes se recomienda 4 vCPU Cores, 6GB RAM, 100GB NvMe o SSD
- Sistema operativo Debina 12
- Nombre de dominio y los certificados SSL correspondientes para implementar HTTPS
- El servidor debe estar en una red dónde pueda ser expuesto a la Internet, y además pueda alcanzar como reverseProxy el AGP Gateway principal del GPAX

### Procedimiento de configuración del servidor Debian 12


1. Cambie la zona horaria a la correspondiente a su país, por ejemplo: 
```shell
  timedatectl set-timezone America/Costa_Rica
```


2. Instale el Firewall, y configúrelo para que solamente pueda accedese al equipo por los puerto 22 desde su red interna (para administrarlo) y 443 (https):
```shell    
  apt update           
  apt install ufw
  # Reemplace el segmento de red 10.0.8.0/24 por el segmento de su red interna
  ufw allow from 10.0.8.0/24 to any port 22
  ufw allow 443 
  ufw enable
```
 

3. Descargue archivo de [configuración](https://github.com/infowarecr/dockers/raw/main/comm/nginx.conf) del NGINX y editedo para reemplazar los siguientes elementos:
```nginx
   gpax.com         -> por el dominio del sitio principal del gpax
   gpaxalterno.com  -> por el dominio del sitio alterno del gpax
   dominio.com      -> por el dominio en el que se publicará este API Gateway
   2000M            -> por el tamaño máximo de los archivos a adjuntar, por default tiene 2000Megabytes (2GB)
```


4. Descargue los archivos de configuración con las recomendaciones de seguridad:
- [options-ssl-nginx.conf]()
- [ssl-dhparams.pem]()


5. Tome los archivos que descargo en el paso anterior, el archivo fullchain.pem (que contiene la cadena de certificados desde el CA hasta el certificado del domino) y el archivo privkey.pem que debe contener la llave privada del domino público y pongalos en el directorio "/root/ssl".

6. Instale el NGINX y el archivo de configuración que preparo en el paso anterior:

```shell
  apt install nginx nginx-extras
  # El archivo nginx.conf es el que debe configuración que debe descargar
  cp nginx.conf /etc/nginx.conf
  # Veifique que el archivo de configuración esta correcto
  nginx -t
  # Si reporta ningún error recargue el archivo de configuración
  nginx -s reload
```


4. 