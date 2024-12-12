#!/usr/bin/perl
use strict;
use warnings;
use DBI;

# Hacemos el método que se conectará a la base de datos
sub conectar_db {
    # El usuario root es el que accede a los permisos en la base de datos
    my $dsn = "DBI:mysql:database=farmacia;host=mariadb";
    my $usuario = "root";
    my $contrasena = "contraseña";

    my $dbh = DBI->connect($dsn, $usuario, $contrasena, {
        RaiseError => 1,
        AutoCommit => 1,
    }) or die "No se pudo conectar a la base de datos: $DBI::errstr";
    
    return $dbh;
}
# Necesario para usarlo de módulo en otros pl que lo necesiten
1;