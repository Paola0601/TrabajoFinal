#!/usr/bin/perl
use strict;
use warnings;
use DBI;

# Configuración de la conexión
sub conectar_db {
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

1;