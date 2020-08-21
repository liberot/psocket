use strict;
use IO::Socket::SSL;

my $srv = IO::Socket::SSL->new(
    LocalAddr => '0.0.0.0:1234',
    Listen => 10,
    SSL_cert_file => './cert/server-cert.pem',
    SSL_key_file => './cert/server-key.pem',
);
$srv->accept;

my $cl = IO::Socket::SSL->new('www.google.com:443');
print $cl "GET / HTTP/1.0\r\n\r\n";
print <$cl>;
 
