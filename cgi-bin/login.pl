#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/html; charset=UTF-8');

# Recibimos los parámetros del html
my $correo = $cgi->param('email');
my $password = $cgi->param('password');

# Hacemos la conexión con la base de datos
my $database = "register";
my $hostname = "mariadb";
my $port = 3306;
my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $usuario = "root";
my $contrasena = "contraseña";

my $dbh = DBI->connect($dsn, $usuario, $contrasena, {
    RaiseError => 1,
    AutoCommit => 1,
}) or die "No se pudo conectar a la base de datos: $DBI::errstr";

my $sth = $dbh->prepare("SELECT id_usuario FROM usuarios WHERE correo = ? AND contraseña = ?");
$sth->execute($correo,$password);
$dbh->disconnect;