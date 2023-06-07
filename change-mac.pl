#!/usr/bin/perl
#var
$interface = $ARGV[0];
$new_mac = join(':', map { sprintf "%02x", rand(256) } (1..6));
#check if the interface variable is defined print usage message and exit if not
if (!defined($interface)) {
    print "Usage: change-mac.pl <interface>\n";
    exit;
}
#desactivate interface sets new mac address and activates interface
system("ifconfig $interface down hw ether $new_mac");
system("ifconfig $interface up");
#print success msg
print "MAC address of the interface $interface changed to $new_mac\n";
