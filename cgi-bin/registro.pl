#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;
use Digest;

my $cgi = CGI->new;
print $cgi->header('text/html; charset=UTF-8');

# Recibimos los parámetros del HTML
my $nombre = $cgi->param('nombre');
my $dni = $cgi->param('dni');
my $correo = $cgi->param('correo');
my $password = $cgi->param('password');

# Hacemos la conexión con la base de datos
my $database = "data_base";
my $hostname = "mariadb";
my $port = 3306;
my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $usuario = "root";
my $contrasena = "paredes48621234";

my $dbh = DBI->connect($dsn, $usuario, $contrasena, {
    RaiseError => 1,
    AutoCommit => 1,
}) or mostrar_error("Error al conectar con la base de datos.");

# Verificamos si el usuario ya está registrado
my $verificar = $dbh->prepare("SELECT COUNT(*) FROM usuarios WHERE correo = ?");
$verificar->execute($correo);
my ($existe) = $verificar->fetchrow_array;
$verificar->finish();

if ($existe) {
    mostrar_error("El usuario con este correo ya está registrado.");
    exit;
}

eval {
    # Insertar usuario en la base de datos
    my $sth = $dbh->prepare("INSERT INTO usuarios (dni, nombre, correo, contraseña, fecha_registro) VALUES (?, ?, ?, ?, NOW())");
    $sth->execute($dni, $nombre, $correo, $password);
    $sth->finish();
};

if ($@) {
    mostrar_error("Ocurrió un error durante el registro. Inténtalo más tarde.");
    $dbh->disconnect();
    exit;
}

# Mostrar mensaje de éxito
print <<'HTML';
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Exitoso</title>
    <link rel="stylesheet" href="../css/registro.css">
</head>
<body>
    <header>
        <h1>Registro Exitoso</h1>
    </header>
    <main>
        <h2>Su registro fue exitoso</h2>
        <a href='../index.html'>Volver al inicio</a>
    </main>
    <footer>
        <p>&copy; 2024 Farmacia. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
HTML

# Función para mostrar el error que se haya ocasionado
sub mostrar_error {
    my ($mensaje) = @_;
    print <<HTML;
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>
    <header>
        <h1>Error</h1>
    </header>
    <main>
        <section class="login">
            <h2>$mensaje</h2>
            <a href='../html/registro.html'>Volver al formulario</a>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Farmacia. Todos los derechos reservados.</p>
    </footer>
</body>
</html>
HTML
}

# Desconectar de la base de datos
$dbh->disconnect();