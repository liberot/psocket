use IO::Socket::SSL;

my $cl = IO::Socket::SSL->new('www.google.com:443');
print $cl "GET / HTTP/1.0\r\n\r\n";
print <$cl>;
 
 
