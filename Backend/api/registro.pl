#!/usr/bin/perl
use strict;
use warnings;
use CGI;
require "db_config.pl";

my $cgi = CGI->new;
print $cgi->header('application/json');

my $correo = $cgi->param('correo');
my $password = $cgi->param('password');

if (!$correo || !$password) {
    print '{"error": Email y contraseña son requeridos}';
} else {
    # Arreglo que tendra los datos del usuario
    my @conexion = ($correo,$password);
    # Conectamos con la base de datos para que se cree el usuario y le pasamos el arreglo
    my $dbh = conectar_db(@conexion);
    my $sth = $dbh->prepare("INSERT INTO usuarios (correo, contraseña) VALUES (?, ?)");
    $sth->execute($correo, $password);
    if ($sth){
        print '{"success":"Usuario registrado exitosamente"}';
    } else {
        print '{"error":"Error al registrar al usuario"}';
    }
    $dbh->disconnect;
}