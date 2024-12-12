#!/usr/bin/perl
use strict;
use warnings;
use CGI;
require "db_config.pl";

my $cgi = CGI->new;
print $cgi->header('application/json');

my $correo = $cgi->param('correo');
my $password = $cgi->param('password');

# Validamos que se ingrese un correo y contraseña correcta
sub validar_correo {
    my $correo = shift;
    return $correo =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
}
sub validar_contrasena {
    my $contrasena = shift;
    return length($contrasena) >= 8 && $contrasena =~ /[A-Za-z]/ && $contrasena =~ /\d/;
}

# Validamos que no esté vacio
if (!$correo  || !$password) {
    print '{"error": Email y contraseña son requeridos}';
    exit;
}

# Se ejecuta la consulta si es válida
if (validar_contrasena($contrasena) && validar_correo($correo)) {
    # Conectamos con la base de datos para que se cree el usuario y le pasamos el arreglo
    my $dbh = conectar_db();
    my $sth = $dbh->prepare("INSERT INTO usuarios (correo, contraseña) VALUES (?, ?)");
    $sth->execute($correo, $password);
    if ($sth){
        print '{"success":"Usuario registrado exitosamente"}';
    } else {
        print '{"error":"Error al registrar al usuario"}';
    }
    $dbh->disconnect;
} else {
    print '{"error": "Error en el correo o en la contraseña, por favor revisar"}';
}