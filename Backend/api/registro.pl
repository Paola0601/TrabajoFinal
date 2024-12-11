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
    print '{"error": Email y contraseña son requeridos}';
    exit;
}

my @conexion = ($email,$password);

# Conectamos con la base de datos para que se cree el usuario
my $dbh = conectar_db(@conexion);
my $sth = $dbh->prepare("INSERT INTO usuarios (correo, contraseña) VALUES (?, ?)");
$sth->execute($email, $password);
if ($sth){
    print '{"success":"Usuario registrado exitosamente"}';
} else {
    print '{"error":"Error al registrar al usuario"}';
}
$dbh->disconnect;
