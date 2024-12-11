#!/usr/bin/perl
use strict;
use warnings;
use CGI;
require "db_config.pl";

my $cgi = CGI->new;
print $cgi->header('application/json');

my $correo = $cgi->param('correo');
my $password = $cgi->param('password');

# Validamos los campos del formulario
if (!$correo || !$password) {
    print '{"error": "Correo y contraseña son requeridos"}';
} else {
    # Arreglo creado para pasar los datos al db_config
    my @conexion = ($correo,$password);
    # Verificamos que sea un usuario de nuestra tienda
    my $dbh = conectar_db(@conexion);
    my $sth = $dbh->prepare("SELECT id_usuario FROM usuarios WHERE correo = ? AND contraseña = ?");
    $sth->execute($correo, $password);
    if (my $row = $sth->fetchrow_hashref) {
        print '{"success": "Inicio de sesión exitoso"}';
    } else {
        print '{"error": "Credenciales incorrectas"}';
    }
    $dbh->disconnect;
}