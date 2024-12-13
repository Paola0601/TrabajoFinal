#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/html; charset=UTF-8');

my $correo = $cgi->param('email');
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
    print "<!DOCTYPE html>";
    print "<html><head><title>Errores de Registro</title>";
    print "<link rel='stylesheet' href='../Fronted/estilos.css'></head><body>";
    print "<p>Correo y contraseña deben estar llenos</p><ul>";
    print "<a href='../Fronted/login.html'>Volver al formulario</a>";
    print "</div></body></html>";
    exit;
}

# Añadimos la validación que sea una contraseña correcta y que el correo sea válido
if (validar_contrasena($contrasena) && validar_correo($correo)) {
    # Conectamos con la base de datos
    my $dsn = "DBI:mysql:database=register;host=mariadb";
    my $usuario = "root";
    my $contrasena = "contraseña";

    my $dbh = DBI->connect($dsn, $usuario, $contrasena, {
        RaiseError => 1,
        AutoCommit => 1,
    }) or die "No se pudo conectar a la base de datos: $DBI::errstr";
    
    # Realizamos la consulta
    my $sth = $dbh->prepare("SELECT id_usuario FROM usuarios WHERE correo = ? AND contraseña = ?");
    $sth->execute($correo, $password);

    if (my $row = $sth->fetchrow_hashref) {
        print "<!DOCTYPE html>";
        print "<html><head><title>Errores de Registro</title>";
        print "<link rel='stylesheet' href='../Fronted/estilos.css'></head><body>";
        print "<p>Inicio de sesion exitoso</p><ul>";
        print "<a href='../Fronted/login.html'>Volver al formulario</a>";
        print "</div></body></html>";
    } else {
        print "<!DOCTYPE html>";
        print "<html><head><title>Errores de Registro</title>";
        print "<link rel='stylesheet' href='../Fronted/estilos.css'></head><body>";
        print "<p>Credenciales incorrectas</p><ul>";
        print "<a href='../Fronted/login.html'>Volver al formulario</a>";
        print "</div></body></html>";
    }
    $dbh->disconnect;
} else {
    print "<!DOCTYPE html>";
    print "<html><head><title>Errores de Registro</title>";
    print "<link rel='stylesheet' href='../Fronted/estilos.css'></head><body>";
    print "<p>Correo y contraseña no válidos</p><ul>";
    print "<a href='../Fronted/login.html'>Volver al formulario</a>";
    print "</div></body></html>";
}