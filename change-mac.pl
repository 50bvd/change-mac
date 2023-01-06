#!/usr/bin/perl

$interface = $ARGV[0];

if (!defined($interface)) {
    print "Usage: change-mac.pl <interface>\n";
    exit;
}

$new_mac = join(':', map { sprintf "%02x", rand(256) } (1..6));

system("ifconfig $interface down hw ether $new_mac");
system("ifconfig $interface up");

print "Adresse MAC de l'interface $interface changée en $new_mac\n";
