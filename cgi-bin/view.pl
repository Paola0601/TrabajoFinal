#!/usr/bin/perl

use strict;
use warnings;
use URI::Escape;
use CGI qw(:standard);
use Text::Markdown qw(markdown);

# Configuramos la codificación de entrada y de salida
binmode STDOUT, ":encoding(UTF-8)";
binmode STDIN, ":encoding(UTF-8)";

print "Content-type: text/html; charset=UTF-8\n\n";

# Usamos la variable de entorno QUERY_STRING para la url después del ?
my $consulta = $ENV{'QUERY_STRING'};
$consulta =~ s/fn=//;
$consulta = uri_unescape($consulta);
# Ruta del archivo en nuestro directorio
my $archivo = "pages/$consulta.md";

# Verificar si el archivo existe
if (defined($archivo)) {
    # Abrimos el archivo
    open(my $fh, $archivo) or do {
        print "<h1>Error</h1>";
        print "<p>No se puede abrir el archivo: $!</p>";
        exit;
    };

    # Extraemos el contenido
    my $contenido = '';
    while (my $linea = <$fh>) {
        $contenido .= $linea;
    }
    close($fh);

    # Hacemos la conversión del contenido
    my $html = markdown($content);

    # Mostramos el contenido de la página
    print "<h1>$consulta</h1>";
    print $html;
    print "<p><a href='list.pl'>Volver al Listado</a></p>";
} else {
    # Si el archivo no existe, mostrar un mensaje de error
    print "<h1>Error</h1>";
    print "<p>Página no encontrada: $consulta</p>";
    print "<p><a href='list.pl'>Volver al Listado</a></p>";
}