#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use CGI qw(:standard);
use JSON;

# Creamos el objeto CGI
my $cgi = CGI->new;

# Hacemos la conexión con la base de datos
my $database = "data_base"; # Nombre de la base de datos
my $hostname = "mariadb"; # Nombre del contenedor que la contiene
my $port = 3306; # Puerto por defecto de MariaDB
my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $usuario = "root";
my $contrasena = "paredes48621234";

my $dbh = DBI->connect($dsn, $usuario, $contrasena, {
    RaiseError => 1,
    AutoCommit => 1,
    mysql_enable_utf8 => 1,
}) or die "No se pudo conectar a la base de datos: $DBI::errstr";

# Preparar y ejecutar la consulta para obtener los libros
my $sth = $dbh->prepare("SELECT nombre, descripcion, precio, imagen FROM productos");
$sth->execute();

# Extraemos los resultados
my @productos;
while (my $row = $sth->fetchrow_hashref) {
    push @productos, {
        nombre => $row->{nombre},
        descripcion => $row->{descripcion},
        precio => $row->{precio},
        imagen => $row->{imagen},
    };
}

# Convertir los resultados a formato JSON
print $cgi->header('application/json');

print to_json(\@productos);

# Cerramos la conexión con la base de datos
$dbh->disconnect();