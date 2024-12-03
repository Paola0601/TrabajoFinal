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