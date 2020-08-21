use strict;
use IO::Socket::SSL;

my $srv = IO::Socket::SSL->new(
    LocalAddr => '0.0.0.0:1234',
    Listen => 10,
    SSL_cert_file => './cert/server-cert.pem',
    SSL_key_file => './cert/server-key.pem',
);
$srv->accept;

 
