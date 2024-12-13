*Se le recuerda que para crear el contenedor mariadb y de Apache se deben posicionar en la ruta correspondiente 
CONTENEDOR MARIADB
# Comando para crear la imagen
docker build -f Dockerfile -t mi-mariadb .

# Comando para crear el contenedor
docker run -d --name mariadb --network proyecto mi-mariadb


CONTENEDOR APACHE
# Comando para crear la imagen
docker build -f Dockerfile -t mariadbfarmacia .

# Comando para crear el contenedor
docker run -d -p 8118:80 --name farmacia --network proyecto mariadbfarmacia 

https//:localhost:8118
docker network create proyecto
docker run -d --name mariadb --network proyecto mi-mariadb
docker rm -f mariadb
docker run -d --name mariadb --network proyecto mi-mariadb
