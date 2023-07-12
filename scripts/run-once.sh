varMainDir=/opt/docker/this-repo

####################
# .env Management
####################
cp $varMainDir/.env.template $varMainDir/.env


####################
# adblock-and-dns
####################
# !!!! TO BE FINISHED!, follow README.md

####################
# infra-docker (required)
####################
sh $varMainDir/services/infra-docker/run-once.sh


####################
# Recurring Maintenance
####################
sh run-each-update.sh
