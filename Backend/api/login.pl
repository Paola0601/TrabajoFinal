#!/usr/bin/perl
use strict;
use warnings;
use CGI;
require "db_config.pl";

my $cgi = CGI->new;
print $cgi->header('application/json');

my $correo = $cgi->param('correo');
my $password = $cgi->param('password');

sub validar_correo {
    my $correo = shift;
    return $correo =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
}

sub validar_contrasena {
    my $contrasena = shift;
    return length($contrasena) >= 8 && $contrasena =~ /[A-Za-z]/ && $contrasena =~ /\d/;
}

# Validamos los campos del formulario
if (!$correo || !$password) {
    print '{"error": "Correo y contraseña son requeridos"}';
    exit;
}

# Añadimos la validación que sea una contraseña correcta y que el correo sea válido
if (validar_contrasena($contrasena) && validar_correo($correo)) {
    # Verificamos que sea un usuario de nuestra tienda
    my $dbh = conectar_db();
    my $sth = $dbh->prepare("SELECT id_usuario FROM usuarios WHERE correo = ? AND contraseña = ?");
    $sth->execute($correo, $password);
    if (my $row = $sth->fetchrow_hashref) {
        print '{"success": "Inicio de sesión exitoso"}';
    } else {
        print '{"error": "Credenciales incorrectas"}';
    }
    $dbh->disconnect;
} else {
    print '{"error": "Error en el correo o en la contraseña, por favor revisar"}';
}