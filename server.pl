use strict;
use IO::Socket::SSL;

my $server = IO::Socket::SSL->new(
    LocalAddr => '127.0.0.1',
    LocalPort => 8080,
    Listen => 10,
    SSL_cert_file => './cert/server-cert.pem',
    SSL_key_file => './cert/server-key.pem',
) or die "failed to listen: $!";
 
my $client = $server->accept or die
    "failed to accept or ssl handshake: $!,$SSL_ERROR";

