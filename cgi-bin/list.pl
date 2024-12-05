#!/usr/bin/perl
use strict;
use warnings;
use URI::Escape;

print "Content-type: text/html; charset=UTF-8\n\n";

print "<h1>Nuestras paginas de wiki</h1>";
print "<ul>";


my $dir_path = "pages";
unless (-d $dir_path) {
    print "<p>Error: El directorio 'pages' no existe.</p>";
    exit;
}


opendir(my $dir, $dir_path) or die "No se puede abrir el directorio: $!";


while (my $file = readdir($dir)) {
    next if ($file =~ m/^\./); 
    my $name = $file;
    $name =~ s/\.md$//;  
    
    my $escaped_name = uri_escape($name);

    print "<li>";
    print "<a href='view.pl?fn=$escaped_name'>$name</a>";
    

    print " <a href='edit.pl?fn=$escaped_name'>[E]</a>";

    print " <a href='delete.pl?fn=$escaped_name' onclick='return confirm(\"¿Estás seguro de que quieres eliminar esta página?\");'>[X]</a>";

    print "</li>";
}

closedir($dir);

print "</ul>";
print "<p><a href='new.pl'>Nueva Página</a></p>";
