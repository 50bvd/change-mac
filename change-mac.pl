#!/usr/bin/perl

# Find network interface
$interface = $ARGV[0];

# Check interface
if (!defined($interface)) {
    print "Usage: change-mac.pl <interface>\n";
    exit;
}

# Generate new mac address
$new_mac = join(':', map { sprintf "%02x", rand(256) } (1..6));

# Inject new mac address
system("ifconfig $interface down hw ether $new_mac");
system("ifconfig $interface up");

# Display new mac address
print "Adresse MAC de l'interface $interface changée en $new_mac\n";
