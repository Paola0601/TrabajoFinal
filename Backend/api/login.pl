#!/usr/bin/perl
use strict;
use warnings;
use CGI;
require "db_config.pl";

my $cgi = CGI->new;
print $cgi->header('application/json');

my $email = $cgi->param('email');
my $password = $cgi->param('password');

if (!$email || !$password) {
    print '{"error": "Email y contraseña son requeridos"}';
    exit;
}

my @conexion = ($email,$password);

#Verificamos que sea un usuario de nuestra tienda
my $dbh = conectar_db();
my $sth = $dbh->prepare("SELECT id_usuario FROM usuarios WHERE correo = ? AND contraseña = ?");
$sth->execute($email, $password);
if (my $row = $sth->fetchrow_hashref) {
    print '{"success": "Inicio de sesión exitoso"}';
} else {
    print '{"error": "Credenciales incorrectas"}';
}
$dbh->disconnect;
