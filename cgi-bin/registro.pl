#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;

my $cgi = CGI->new;
print $cgi->header('text/html; charset=UTF-8');

# Recibimos los parámetros del html
<<<<<<< HEAD
my $nombre = $cgi->param('nombreC');
my $correo = $cgi->param('nameSesionUsuario');
my $password = $cgi->param('password');
my $dni = $cgi->param('dni');

# Hacemos la conexión con la base de datos
my $database = "data_base"; # Nombre de la base de datos
my $hostname = "mariadb"; # Nombre del contenedor
my $port = 3306; # Puerto por defecto de MariaDB
my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $usuario = "root";
my $contrasena = "paredes48621234";
=======
my $correo = $cgi->param('nameSesionUsuario');
my $password = $cgi->param('password');
my $password2 = $cgi->param('password2');

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
# Verificamos si el usuario ya está registrado en nuestra base de datos
my $verificar = $dbh->prepare("SELECT COUNT(*) FROM usuarios WHERE correo = ?");
$verificar->execute($correo);
my ($existe) = $verificar->fetchrow_array;
$verificar->finish();

if ($existe) {
    print<<'HTML';
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error en el Registro</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <header>
        <h1>Error en el registro</h1>
    </header>
    <main>
        <section class="login">
            <h2>Este usuario ya está registrado</h2>
            <a href='../html/registro.html'>Volver al formulario</a>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Farmacia. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
HTML
    exit;
}

my $sth = $dbh->prepare("INSERT INTO usuarios (dni, nombre, correo, contraseña, fecha_registro) values (?, ?, ?, ?, NOW())");
$sth->execute($dni,$nombre,$correo,$password);
$sth->finish();

print<<'HTML';
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Exitoso</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <header>
        <h1>Registro</h1>
    </header>

    <main>
        <section class="login">
            <h2>Su registro fue exitoso</h2>
            <a href='../html/index.html'>Volver al inicio</a>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Farmacia. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
HTML

$dbh->disconnect();
=======
my $sth = $dbh->prepare("INSERT INTO usuarios values(?,?,?)");
$sth->execute($correo,$password);
$dbh->disconnect;
>>>>>>> 259f1bde648362f4a263ec97918de9c0b37f5e58
