#!/usr/bin/perl
use strict;
use warnings;
use URI::Escape;

print "Content-type: text/html; charset=UTF-8\n\n";

print "<h1>Nuestras paginas de wiki</h1>";
print "<ul>";

# Verificar si el directorio 'pages' existe
my $dir_path = "pages";
unless (-d $dir_path) {
    print "<p>Error: El directorio 'pages' no existe.</p>";
    exit;
}
# Intentar abrir el directorio
opendir(my $dir, $dir_path) or die "No se puede abrir el directorio: $!";

while (my $file = readdir($dir)) {
    next if ($file =~ m/^\./); # Saltar archivos ocultos (p. ej., . y ..)
    my $name = $file;
    $name =~ s/\.md$//;  # Eliminar la extensión '.md'
}
closedir($dir);