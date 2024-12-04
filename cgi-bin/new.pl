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