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







    