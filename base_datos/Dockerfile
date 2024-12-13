FROM mariadb:latest

# Variables de entorno para MariaDB
ENV MYSQL_ROOT_PASSWORD=paredes48621234
ENV MYSQL_DATABASE=data_base

# Copia el archivo SQL al directorio de inicialización
COPY data_base.sql /docker-entrypoint-initdb.d/

# Exponer el puerto de MariaDB
EXPOSE 3306
