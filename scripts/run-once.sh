varMainDir=/opt/docker/this-repo

####################
# .env Management
####################
cp $varMainDir/.env.template $varMainDir/.env


####################
# adblock-and-dns
####################
# Unbound
sudo mkdir -p $varConfigDir/pihole-unbound/pihole/etc-pihole
sudo mkdir -p $varConfigDir/pihole-unbound/pihole/etc-dnsmasq.d
sudo mkdir -p $varConfigDir/pihole-unbound/unbound/etc-unbound
sudo mkdir -p $varConfigDir/pihole-unbound/unbound/unbound.conf.d

touch $varConfigDir/pihole-unbound/unbound/etc-unbound/unbound.log

chown -R $USER:docker $varConfigDir/pihole-unbound
chmod -R 755 $varConfigDir/pihole-unbound

cp -rpi $varOptDir/services/adblock-and-dns/configtemplates/unbound/* $varConfigDir/pihole-unbound/unbound

####################
# infra-docker (required)
####################
sh $varMainDir/services/infra-docker/run-once.sh


####################
# Recurring Maintenance
####################
sh run-each-update.sh
