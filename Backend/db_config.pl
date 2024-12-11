#!/usr/bin/perl
use strict;
use warnings;
use DBI;

# Hacemos el método que se conectará a la base de datos
sub conectar_db {
    # Se recibe en un arreglo el usuario y su contraseña
    my @datos = @_;
    my $dsn = "DBI:mysql:database=farmacia;host=mariadb";
    my $usuario = $datos[0];
    my $contrasena = $datos[1];

    my $dbh = DBI->connect($dsn, $usuario, $contrasena, {
        RaiseError => 1,
        AutoCommit => 1,
    }) or die "No se pudo conectar a la base de datos: $DBI::errstr";
    
    return $dbh;
}
# Necesario para usarlo de módulo en otros pl que lo necesiten
1;