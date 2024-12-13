CONTENEDOR MARIADB
# Comando para crear la imagen
docker build -f Dockerfile -t mi-mariadb

# Comando para crear el contenedor
docker run -d --name mariadb --network proyecto mi-mariadb


CONTENEDOR APACHE
# Comando para crear la imagen
docker build -f Dockerfile -t mariadbutiles .

# Comando para crear el contenedor
docker run -d -p 8118:80 --name utiles --network proyecto mariadbutiles 

https//:localhost:8118