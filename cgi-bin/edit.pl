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

# Obtener el nombre de la página desde la URL (QUERY_STRING)
my $consulta = param('fn');
my $pagina = "pages/$query.md";

if (defined($pagina)) {
    # Leemos el contenido de la página encontrada
    open(my $fh, $pagina) or die "No se puede abrir el archivo: $!";

    # Guardamos el contenido de la página en un string
    my $contenido = '';
    while (my $linea = <$fh>) {
        $contenido .= $linea;
    }
    close($fh);

    print "<h1>Editar Página: $consulta</h1>";
    print "<form action='update.pl' method='POST'>";
    print "<textarea name='content' rows='10' cols='50'>$contenido</textarea><br>";
    print "<input type='submit' value='Guardar Cambios'>";
    print "</form>";
} else {
    print "<p>Página no encontrada.</p>";
}