#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/html; charset=UTF-8');

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
    print "<!DOCTYPE html>";
    print "<html><head><title>Errores de Registro</title>";
    print "<link rel='stylesheet' href='../Fronted/estilos.css'></head><body>";
    print "<p>Correo y contraseña deben estar llenos</p><ul>";
    print "<a href='../Fronted/login.html'>Volver al formulario</a>";
    print "</div></body></html>";
    exit;
}

# Se ejecuta la consulta si es válida
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
    my $sth = $dbh->prepare("INSERT INTO usuarios (correo, contraseña) VALUES (?, ?)");
    $sth->execute($correo, $password);
    if ($sth){
        print "<!DOCTYPE html>";
        print "<html><head><title>Registro exitoso</title>";
        print "<link rel='stylesheet' href='../Fronted/estilos.css'></head><body>";
        print "<p>Usuario registrado exitosamente</p><ul>";
        print "<a href='../Fronted/login.html'>Volver al formulario</a>";
        print "</div></body></html>";
    } else {
        print "<!DOCTYPE html>";
        print "<html><head><title>Error en el Registro</title>";
        print "<link rel='stylesheet' href='../Fronted/estilos.css'></head><body>";
        print "<p>Hubo un error en el registro</p><ul>";
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