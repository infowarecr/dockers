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
2. Instale el Firewall, y configúrelo para que solamente pueda aacedese al equipo por los puerto 22 desde su red interna (para administrarlo) y 443 (https):
```shell    
  apt update           
  apt install ufw
  ufw allow from 10.0.8.0/24 to any port 22
  ufw allow 443 
  ufw enable
```
 Reemplace el segmento de red 10.0.8.0/24 por el segmento de su red interna desde donde quiere administrar su servidor.

3. Instale el NGINX y configurelo usando este archivo de [configuración](https://github.com/infowarecr/dockers/raw/main/comm/nginx.conf):

```shell
  apt install nginx nginx-extras
  cp nginx.conf /etc/nginx.conf
```
