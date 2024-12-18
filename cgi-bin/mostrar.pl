#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

# Se crea un objeto CGI
my $cgi = CGI->new;
$cgi -> charset("UTF-8");

# Se imprime la cabecera principal del index
print $cgi->header('text/html');
print <<HTML;
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bases de datos</title>
	<link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
	<header class="header-container">
		<h1>Productos</h1>
	</header>
HTML

# Se realiza la conexión con la base de datos
my $dns = "DBI:mysql:database=data_base;host=mariadb;port=3306";
my $username= "root";
my $password= "paredes48621234";

my $dbh = DBI->connect($dns, $username, $password) or die ("Error al entrar al servidor: $DBI::errstr");

if ($cgi->param("mostrar_productos")) {
    mostrar_tabla('productos');
} else {
    print "<h1>No se seleccionó ninguna acción válida.</h1>";
}


# Subrutina para mostrar las tablas
sub mostrar_tabla {
    my ($tabla) = @_;
    my $sth = $dbh->prepare("SELECT * FROM $tabla");
    $sth->execute();

    # Se construye la tabla en el HTML
    print "<h1>Datos de la tabla $tabla</h1>";
    print "<table border='1'>";
    print "<tr>";

    # Se obtiene los nombres de columna
    my @columns = @{$sth->{NAME}};
    for my $col (@columns) {
        print "<th>$col</th>";
    }
    print "</tr>";

    # Se imprime las filas
    while (my @row = $sth->fetchrow_array) {
        print "<tr>";
        print "<td>$_</td>" for @row;
        print "</tr>";
    }

    print "</table>";
print <<HTML;
    <div class="centrado">
        <a href='../index.html' class='boton-volver'>Volver</a>
    </div>
HTML
    $sth->finish;
}