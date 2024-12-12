#!/usr/bin/perl
use strict;
use warnings;
use CGI;

# Crear un objeto CGI
my $cgi = CGI->new;

# Capturar los datos del formulario
my $email = $cgi->param('email') || '';
my $password = $cgi->param('password') || '';