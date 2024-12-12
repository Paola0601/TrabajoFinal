#!/usr/bin/perl
use strict;
use warnings;
use CGI;

# Crear un objeto CGI
my $cgi = CGI->new;

# Capturar los datos del formulario
my $email = $cgi->param('email') || '';
my $password = $cgi->param('password') || '';

print $cgi->header(-type => 'text/html', -charset => 'UTF-8');

# Generar página HTML de respuesta
print <<HTML;
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido - Farmacia</title>
</head>
<body>
    <h1>¡Bienvenido a Farmacia!</h1>
    <p>Has iniciado sesión correctamente</p>
    <p>Correo electrónico: $email</p>
</body>
</html>
HTML