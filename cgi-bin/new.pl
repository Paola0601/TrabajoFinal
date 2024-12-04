#!/usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);
use URI::Escape;

print "Content-type: text/html; charset=UTF-8\n\n";

if ($ENV{'REQUEST_METHOD'} eq "GET") {
    print <<EOF;
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nueva Pagina</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <h1>Nueva Pagina</h1>
    <form action="new.pl" method="POST">
        Titulo: <input type="text" name="title"><br>
        Texto (Markdown):<br>
        <textarea name="content" rows="10" cols="30"></textarea><br>
        <input type="submit" value="Enviar">
    </form>
    <a href="../index.html">Cancelar</a>
</body>
</html>
EOF
}


if ($ENV{'REQUEST_METHOD'} eq "POST") {

    read(STDIN, my $post_data, $ENV{'CONTENT_LENGTH'});


    my ($title, $content) = $post_data =~ /title=([^&]*)&content=(.*)/;

    $title = uri_unescape($title);
    $content = uri_unescape($content);
    
  
    mkdir 'pages' unless -d 'pages';


    open(my $fh, '>', "pages/$title.md") or die "No puedo guardar la página: $!\n";
    

    print $fh $content;
    close($fh);
    

    print "<p>Página creada con éxito: <a href='list.pl'>Listado de Páginas</a></p>";
}
