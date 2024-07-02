# Instalación de NGINX como api Gateway para el módulo de comunicación del GPAX

### Requisitos previos
- Servidor virtual, para 1000 usuarios concurrentes se recomienda 4 vCPU Cores, 6GB RAM, 100GB NvMe o SSD
- Sistema operativo Debina 12
- Nombre de dominio y los certificados SSL correspondientes para implementar HTTPS
- El servidor debe estar en una red dónde pueda ser expuesto a la Internet, y además pueda alcanzar como reverseProxy el AGP Gateway principal del GPAX

### Procedimiento de configuración del servidor Debian 12
1. Cambie la zona horaria a la correspondiente a su país, por ejemplo: ```timedatectl set-timezone America/Costa_Rica```
apt install ufw
ufw allow 22
ufw enable


[NGINX Archivo de configuracion](https://raw.githubusercontent.com/infowarecr/dockers/main/installDocker.sh).