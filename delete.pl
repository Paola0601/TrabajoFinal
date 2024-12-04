#!/usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);

print "Content-type: text/html; charset=UTF-8\n\n";

# Obtener el nombre de la página desde la URL
my $query = param('fn');
$query =~ s/[^a-zA-Z0-9_-]//g;  # Sanitizar el nombre del archivo
my $file = "pages/$query.md";

if (-e $file) {
    # Eliminar el archivo
    unlink($file) or die "No se pudo eliminar el archivo: $!";

    
    print "<h1>Pagina eliminada</h1>";
    print "<p>La pagina '$query' ha sido eliminada exitosamente.</p>";
    print "<p><a href='list.pl'>Volver al Listado</a></p>";





