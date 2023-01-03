#!/usr/bin/perl

# Récupérer le nom de l'interface réseau à partir de la ligne de commande
$interface = $ARGV[0];

# Vérifier que l'interface a été spécifiée
if (!defined($interface)) {
    print "Usage: change-mac.pl <interface>\n";
    exit;
}

# Générer une nouvelle adresse MAC aléatoire
$new_mac = join(':', map { sprintf "%02x", rand(256) } (1..6));

# Exécuter la commande pour changer l'adresse MAC de l'interface
system("ifconfig $interface down hw ether $new_mac");
system("ifconfig $interface up");

# Afficher la nouvelle adresse MAC
print "Adresse MAC de l'interface $interface changée en $new_mac\n";