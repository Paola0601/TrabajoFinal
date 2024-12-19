#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
my $email = $cgi->param('email');
my $password = $cgi->param('password');

# Conexión con la base de datos
my $database = "data_base";
my $hostname = "mariadb";
my $port     = 3306;
my $dsn      = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $usuario  = "root";
my $contrasena = "paredes48621234";

my $dbh = DBI->connect($dsn, $usuario, $contrasena, {
    RaiseError => 1,
    AutoCommit => 1,
    mysql_enable_utf8 => 1,
}) or die "No se pudo conectar a la base de datos: $DBI::errstr";

# Verificación de credenciales
my $sth = $dbh->prepare("SELECT * FROM usuarios WHERE correo = ? AND contraseña = ?");
$sth->execute($email, $password);
my @row = $sth->fetchrow_array;
$sth->finish;

if (@row) {
    # Si el login fue exitoso se redireccionará a la página de bienvenida
    print $cgi->redirect("http://localhost:8118/html/bienvenida.html");
} else {
    # Si el login fue fallido se mostrará un error
    print $cgi->header(-type => 'text/html', -status => '401 Unauthorized');
    print "Credenciales incorrectas.";
}

$dbh->disconnect;