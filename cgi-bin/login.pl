#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/html; charset=UTF-8');

# Recibimos los parámetros del html
<<<<<<< HEAD
my $correo = $cgi->param('correo');
my $password = $cgi->param('password');

# Hacemos la conexión con la base de datos
my $database = "data_base"; # Nombre de la base de datos
my $hostname = "mariadb"; # Nombre del contenedor que la contiene
my $port = 3306; # Puerto por defecto de MariaDB
my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $usuario = "root";
my $contrasena = "paredes48621234";
=======
my $correo = $cgi->param('email');
my $password = $cgi->param('password');

# Hacemos la conexión con la base de datos
my $database = "register";
my $hostname = "mariadb";
my $port = 3306;
my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $usuario = "root";
my $contrasena = "contraseña";
>>>>>>> 259f1bde648362f4a263ec97918de9c0b37f5e58

my $dbh = DBI->connect($dsn, $usuario, $contrasena, {
    RaiseError => 1,
    AutoCommit => 1,
}) or die "No se pudo conectar a la base de datos: $DBI::errstr";

<<<<<<< HEAD

my $sth = $dbh->prepare("SELECT FROM usuarios WHERE correo = ? AND contraseña = ?");
$sth->execute($correo,$password);
$sth->finish();

if (my $row = $sth->fetchrow_hashref) {
    # Usuario encontrado
    print <<HTML;
        <html>
        <head>
            <script>
                localStorage.setItem('nombre_usuario', '$row->{nombre}');
                window.location.href = '../index.html';
            </script>
        </head>
        <body>
        </body>
        </html>
HTML
} else {
    # Error en el correo o la contraseña
    print <<HTML;
    <html>
    <body>
        <script>
            window.location.href = '../login.html?error=1';
        </script>
    </body>
    </html>
HTML
}

$dbh->disconnect();
=======
my $sth = $dbh->prepare("SELECT id_usuario FROM usuarios WHERE correo = ? AND contraseña = ?");
$sth->execute($correo,$password);
$dbh->disconnect;
>>>>>>> 259f1bde648362f4a263ec97918de9c0b37f5e58
